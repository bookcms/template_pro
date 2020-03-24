<?php
namespace app\biquge\controller;

use think\facade\Cache;

class User extends Base
{
    private $user_info;

    protected function initialize()
    {
        parent::initialize();

        if (session("login_token") == null) {
            if ($this->request->isAjax()) {
                $this->echoJson("",-1,"未登录");
            }else {
                $this->redirect(url("/login/index"));
            }
        }

        if (Cache::has("user_info")) {
            $this->user_info = Cache::get("user_info");
        }else {
            $result = curl_server("api_v1/get_user_info",array('platform' => 'pc','token' => session("login_token")));
            if (!empty($result['data'])) {
                $this->user_info = $result['data'];
                Cache::set("user_info",$result['data']);
            }

            if ($result['code'] == -1) {
                session("login_token",null);
                $this->redirect(url("/login/index"));
            }

        }

    }

    /**
     * 个人资料
     * @return mixed
     */
    public function index ()
    {
        $this->site_seo('user_index');
        return $this->fetch('index',['user_info' => $this->user_info]);
    }


    /**
     * 修改密码
     * @return mixed|void
     */
    public function password ()
    {
        if ($this->request->isPost()) {
            $data = $this->request->only(['password','password2']);

            if ($data['password'] != $data['password2']) {
                return $this->error("两次密码不一样~");
            }

            $result = curl_server("api_v1/change_password",array(
                'platform' => 'pc',
                'password' => $data['password'],
                'last_login_ip' => $this->request->ip(),
                'token' => session("login_token")
            ));

            //修改成功
            if ($result['code'] == 0) {
                session("login_token",$result['data']);
            }

            $this->echoJson(url("/user/index"),$result['code'],$result['msg']);
        }

        $this->assign("current_cate",array('name' => "修改密码", 'alias' => "user_index",));
        $this->site_seo('user_password');

        return $this->fetch('password');
    }

    /**
     * 加入书架
     */
    public function add_book()
    {
        $data = $this->request->only(['id','type']);

        $msg_arr = array(
            'rack' => '书架',
            'collect' => '收藏'
        );

        $data['novel_id'] = get_cut_value($data['id']);
        $data['platform'] = 'pc';
        $data['token'] = session("login_token");

        //更新收藏排行榜
        if ($data['type'] == "collect") {
            $article = model('article')->where('PrimaryId','eq',$data['id'])->cache()->find()->toArray();
            //获取当前分类
            $article['category'] = get_category($article['Cid']);
            add_redis_cid_ranking(get_cut_value($article['PrimaryId']),$article['category']['cid'],"collect");
        }
        
        $result = curl_server("api_v1/user_add_book",$data);

        $this->echoJson($result['msg'],$result['code'],$msg_arr[$data['type']]);
    }

    /**
     * 书架列表
     * @return mixed
     * @throws
     */
    public function rack_list(){
        if (isMobileDomain()) {
            return $this->rack_list_m();
        }else {
            return $this->rack_list_pc();
        }
    }

    protected function rack_list_m() {

        $page_size = $this->request->param("limit",10);
        $page = $this->request->param("page",1);

        $offset = ($page - 1) * $page_size;
        $site_config = get_site_config();

        $user_book_model = model('user_book')->where('ActType','eq','rack')->where('UserId','eq',(int)$this->user_info['id'])->where("Platform","eq",sprintf("pc_%d",$site_config['site_id']));
        $result = $user_book_model->limit($offset,$page_size)->order("PrimaryId","DESC")->all()->toArray();

        $list = array();
        foreach ($result as $key => $item) {

            $list[$key] = array(
                'id'       => $item['PrimaryId'],
                'title'    => $item['Title'],
                'url'      => url("/book/" . $item['PrimaryId'],array(),"html",true),
            );

            $novel = get_novel_item($item['ArticleId']);
            $list[$key]['author'] = $novel['Author'];

            if (!empty($novel)) {
                $list[$key]['last_chapter_title'] = $novel['LastChapterTitle'];
                $list[$key]['last_chapter_url'] = url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel['LastChapterSort'],$novel['SourceList'],$novel['LastChapterFlag']),"","html",true);
            }else {
                $list[$key]['last_chapter_title'] = "数据失效";
                $list[$key]['last_chapter_url'] = "";
            }

            $chapter = get_chapter_flag_details($item['ReadChapterFlag'],$item['ArticleId'],$item['ReadChapterSort']);
            if (!empty($chapter)) {
                $list[$key]['read_chapter_title'] = $chapter['Title'];
                $list[$key]['read_chapter_url'] = url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($chapter['Sort'],$novel['SourceList'],$item['ReadChapterFlag']),"","html",true);
            }else {
                $list[$key]['read_chapter_title'] = "暂无数据";
                $list[$key]['read_chapter_url'] = "";
            }

        }

        $this->site_seo('user_rack_list');
        return $this->fetch("rack_list",['list' => $list]);
    }
    protected function rack_list_pc()
    {

        if ($this->request->isPost()) {

            $page_size = $this->request->param("limit",10);
            $page = $this->request->param("page",1);

            $offset = ($page - 1) * $page_size;
            $site_config = get_site_config();

            $user_book_model = model('user_book')->where('ActType','eq','rack')->where('UserId','eq',(int)$this->user_info['id'])->where("Platform","eq",sprintf("pc_%d",$site_config['site_id']));
            //总数据
            $total = $user_book_model->count();
            $result = $user_book_model->limit($offset,$page_size)->order("PrimaryId","DESC")->all()->toArray();

            $list = array();
            foreach ($result as $key => $item) {

                $list[$key] = array(
                    'id'       => $item['PrimaryId'],
                    'title'    => $item['Title'],
                    'url'      => url("/book/" . $item['PrimaryId'],array(),"html",true),
                );

                $novel = get_novel_item($item['ArticleId']);
                if (!empty($novel)) {
                    $list[$key]['last_chapter_title'] = $novel['LastChapterTitle'];
                    $list[$key]['last_chapter_url'] = url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel['LastChapterSort'],$novel['SourceList'],$novel['LastChapterFlag']),"","html",true);
                }else {
                    $list[$key]['last_chapter_title'] = "数据失效";
                    $list[$key]['last_chapter_url'] = "";
                }

                $chapter = get_chapter_flag_details($item['ReadChapterFlag'],$item['ArticleId'],$item['ReadChapterSort']);
                if (!empty($chapter)) {
                    $list[$key]['read_chapter_title'] = $chapter['Title'];
                    $list[$key]['read_chapter_url'] = url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($chapter['Sort'],$novel['SourceList'],$item['ReadChapterFlag']),"","html",true);
                }else {
                    $list[$key]['read_chapter_title'] = "暂无数据";
                    $list[$key]['read_chapter_url'] = "";
                }

            }

            $data['total'] = $total;
            $data['list'] = $list;

            $this->echoJson($data,0,"加载成功");
        }

        $this->site_seo('user_rack_list');
        return $this->fetch('rack_list');
    }

    /**
     * 收藏列表
     * @return mixed
     * @throws
     */
    public function collect_list() {
        if (isMobileDomain()) {
            return  $this->collect_list_m();
        }else {
            return  $this->collect_list_pc();
        }
    }
    public function collect_list_m() {

        $page_size = $this->request->param("limit",10);
        $page = $this->request->param("page",1);

        $offset = ($page - 1) * $page_size;
        $site_config = get_site_config();

        $user_book_model = model('user_book')->where('ActType','eq','collect')->where('UserId','eq',(int)$this->user_info['id'])->where("Platform","eq",sprintf("pc_%d",$site_config['site_id']));
        $result = $user_book_model->limit($offset,$page_size)->order("PrimaryId","DESC")->all()->toArray();

        $list = array();
        foreach ($result as $key => $item) {

            $list[$key] = array(
                'id'       => $item['PrimaryId'],
                'title'    => $item['Title'],
                'url'      => url("/book/" . $item['PrimaryId'],array(),"html",true)
            );

            $novel = get_novel_item($item['ArticleId']);
            $list[$key]['author'] = $novel['Author'];

            if (!empty($novel)) {
                $list[$key]['last_chapter_title'] = $novel['LastChapterTitle'];
                $list[$key]['last_chapter_url'] = url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel['LastChapterSort'],$novel['SourceList'],$novel['LastChapterFlag']),"","html",true);
            }else {
                $list[$key]['last_chapter_title'] = "数据失效";
                $list[$key]['last_chapter_url'] = "";
            }


        }

        $this->site_seo('user_collect_list');
        return $this->fetch("collect_list",['list' => $list]);
    }
    public function collect_list_pc()
    {
        if ($this->request->isPost()) {

            $page_size = $this->request->param("limit",10);
            $page = $this->request->param("page",1);

            $offset = ($page - 1) * $page_size;
            $site_config = get_site_config();

            $user_book_model = model('user_book')->where('ActType','eq','collect')->where('UserId','eq',(int)$this->user_info['id'])->where("Platform","eq",sprintf("pc_%d",$site_config['site_id']));
            $total = $user_book_model->count();

            $result = $user_book_model->limit($offset,$page_size)->order("PrimaryId","DESC")->all()->toArray();

            $list = array();
            foreach ($result as $key => $item) {

                $list[$key] = array(
                    'id'       => $item['PrimaryId'],
                    'title'    => $item['Title'],
                    'url'      => url("/book/" . $item['PrimaryId'],array(),"html",true)
                );

                $novel = get_novel_item($item['ArticleId']);

                if (!empty($novel)) {
                    $list[$key]['last_chapter_title'] = $novel['LastChapterTitle'];
                    $list[$key]['last_chapter_url'] = url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel['LastChapterSort'],$novel['SourceList'],$novel['LastChapterFlag']),"","html",true);
                }else {
                    $list[$key]['last_chapter_title'] = "数据失效";
                    $list[$key]['last_chapter_url'] = "";
                }


            }

            $data['total'] = $total;
            $data['list'] = $list;

            $this->echoJson($data,0,"加载成功");
        }

        $this->site_seo('user_collect_list');
        return $this->fetch('collect_list');
    }

    /**
     * 删除收藏或者书架
     */
    public function delete_book (){

        if ($this->request->isPost()) {
            $data = $this->request->only(['novel_id','act_type']);
            $data['book_id'] = get_cut_value($data['book_id']);
            $data['platform'] = 'pc';
            $data['token'] = session("login_token");

            $result = curl_server("api_v1/user_delete_book",$data);

            $this->echoJson($result['data'],$result['code'],$result['msg']);

        }

    }

    /**
     * 更新书架记录
     */
    public function update_book (){

        if ($this->request->isPost()) {
            $data = $this->request->only(['article_id','chapter_id','flag']);

            $data['article_id'] = get_cut_value($data['article_id']);
            $data['chapter_id'] = get_cut_value($data['chapter_id']);
            $data['flag'] = base64_decode($data['flag']);

            $data['platform'] = 'pc';
            $data['token'] = session("login_token");
            if (session("login_token") != null) {
                $result = curl_server("api_v1/user_update_book",$data);
                $this->echoJson($result['data'],$result['code'],$result['msg']);
            }
        }

    }

    /**
     * 用户消息
     * @return mixed
     */
    public function messages()
    {

        $this->site_seo('user_messages');
        return $this->fetch('messages');
    }

}


