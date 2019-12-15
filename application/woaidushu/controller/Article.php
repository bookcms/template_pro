<?php
namespace app\woaidushu\controller;

use org\Page;
use think\facade\Cache;

class Article extends Base
{

    public function index($primary_id = 0)
    {
        //分割变量
        $primary_ids = explode("_",$primary_id);
        $page = 1;

        if (count($primary_ids) > 1) {
            $primary_id = $primary_ids[0];
            $page = $primary_ids[1];
        }

        //章节列表分页大小
        $chapter_page_size = 500;
        if (!empty($this->site_config['extend']['chapter_page_list_num'])) {
            $chapter_page_size = $this->site_config['extend']['chapter_page_list_num'];
        }

        $article = model('article')->where('PrimaryId','eq',get_cut_value($primary_id))->cache()->find()->toArray();

        //手动更新
        if ($article['OneSelf'] == 1) {
            if ($this->site_config['extend']['chapter_page_list_switch'] == 'on') {
                $all_chapter_list = get_custom_all_chapter_list($article['_id'],$article['SourceList'],$page,$chapter_page_size);
            }else {
                $all_chapter_list = get_custom_all_chapter_list($article['_id'],$article['SourceList'],0,0);
            }
        }else {
            if ($this->site_config['extend']['chapter_page_list_switch'] == 'on') {
                $all_chapter_list = get_all_chapter_list($article['_id'],$article['SourceList'],$page,$chapter_page_size);
            }else {
                $all_chapter_list = get_all_chapter_list($article['_id'],$article['SourceList'],0,0);
            }
        }

        //获取当前分类
        $article['category'] = get_category($article['Cid']);

        $article['SourceUrl'] = "";

        //获取当前源地址
        foreach ($article['SourceList'] as $url) {
            if (get_flag_name($url) == $article['LastChapterFlag']){
                $article['SourceUrl'] = $url;
                break;
            }
        }

        //修复小说表没有 LastChapterFlag 标记
        if ($article['SourceUrl'] == "" && count($article['SourceList']) > 0) {
            $article['SourceUrl'] = $article['SourceList'][0];
        }

        $article['last_update_chapter_list'] = $all_chapter_list['last_update_chapter_list'];
        $article['chapter_list'] = $all_chapter_list['chapter_list'];

        //最后更新章节id和标题
        $article['LastChapterSort'] = $all_chapter_list['last_chapter_sort'];
        $article['LastChapterTitle'] = $all_chapter_list['last_chapter_title'];
        $article['LastChapterFlag'] = $all_chapter_list['last_chapter_flag'];
        //分页页码
        $article['page'] = $page;
        
        //获取最后章节
        $last_update_chapter_list = $article['last_update_chapter_list'];
        $last_chapter = array_shift($last_update_chapter_list);

        //分页
        if ($this->site_config['extend']['chapter_page_list_switch'] == 'on') {
            $pageObj = new Page(sprintf("book/%d_{PAGE}",$primary_id),$page,$all_chapter_list['chapter_total'],$chapter_page_size);
            if (isMobileDomain()) {
                $pageObj->setConfig("theme",'%NO_PREV% %UP_PAGE% %DOWN_PAGE% %HEADER%');
            }
            $this->assign("pages",$pageObj->showPc());
        }else {
            $this->assign("pages","");
        }

        //排行榜计数
        add_redis_cid_ranking(get_cut_value($article['PrimaryId']),$article['category']['cid'],"top");
        //设置小说点击量
        set_novel_click(get_cut_value($article['PrimaryId']));
        //获取小说点击量
        $article['Click'] = get_novel_click(get_cut_value($article['PrimaryId']));

        $this->site_seo('details',array('details' => $article,'category_name' => $article['category']['name']));
        return $this->fetch("index",['current_cate' => $article['category'] , 'novel' => $article,'last_chapter' => $last_chapter]);
    }

    /**
     * 作者页面
     * @param string $name
     * @return mixed
     * @throws
     */
    public function author($name = '')
    {
        if (empty($name)) {
            $this->error("作者不能为空!");
        }

        $search_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Author','like',$name)->order('UpdateTime','desc')->cache()->select()->toArray();

        $this->site_seo('author',array('author' => $name));
        return $this->fetch('author', [ 'author' => $name,'list' => $search_list]);
    }

    /**
     * 移动端小说列表
     * @param int $id
     * @return mixed
     * @throws
     */
    public function  mulu ($primary_id = 0) {

        $primary_ids = explode("_",$primary_id);
        $page = 1;

        if (count($primary_ids) > 1) {
            $primary_id = $primary_ids[0];
            $page = $primary_ids[1];
        }

        $article = model('article')->where('PrimaryId','eq',get_cut_value($primary_id))->cache()->find()->toArray();
        $category = get_category($article['Cid']);

        //章节列表分页大小
        $chapter_page_size = 500;
        if (!empty($this->site_config['extend']['chapter_page_list_num'])) {
            $chapter_page_size = $this->site_config['extend']['chapter_page_list_num'];
        }

        //手动更新
        if ($article['OneSelf'] == 1) {
            if ($this->site_config['extend']['chapter_page_list_switch'] == 'on') {
                $all_chapter_list = get_custom_all_chapter_list($article['_id'],$article['SourceList'],$page,$chapter_page_size);
            }else {
                $all_chapter_list = get_custom_all_chapter_list($article['_id'],$article['SourceList'],0,0);
            }
        }else {
            if ($this->site_config['extend']['chapter_page_list_switch'] == 'on') {
                $all_chapter_list = get_all_chapter_list($article['_id'],$article['SourceList'],$page,$chapter_page_size);
            }else {
                $all_chapter_list = get_all_chapter_list($article['_id'],$article['SourceList'],0,0);
            }
        }

        $article['chapter_list'] = $all_chapter_list['chapter_list'];

        //分页
        if ($this->site_config['extend']['chapter_page_list_switch'] == 'on') {
            $obj_page = new Page(sprintf("mulu/%d_{PAGE}",$primary_id),$page,$all_chapter_list['chapter_total'],$chapter_page_size);
            if (isMobileDomain()) {
                $obj_page->setConfig("theme",'%NO_PREV% %UP_PAGE% %DOWN_PAGE% %HEADER%');
            }
            $show = $obj_page->show();
            $this->assign("pages",$show);
        }else {
            $this->assign("pages","");
        }

        $article['page'] = $page;

        $this->site_seo('details',array('details' => $article,'category_name' => $category['name']));

        return $this->fetch("mulu",['novel' => $article]);
    }

    /**
     * 更新缓存
     */
    public function update_cache (){
        $primary_id = $this->request->param('primary_id');
        $last_chapter_sort = get_cut_value($this->request->param('last_chapter_sort'));
        $article_url = base64_decode($this->request->param('article_url'));
        $last_chapter_url = base64_decode($this->request->param('last_chapter_url'));

        $cache_key = md5("cache_list_" . $last_chapter_sort . get_cut_value($primary_id));
        if (Cache::has($cache_key)) {

            $list = Cache::get($cache_key);
            $this->echoJson($list,200,"更新成功!");

        }else {

            $result = curl_server("api_v1/spider_chapter_list",array(
                'site_id' => $this->site_config['site_id'],
                'primary_id' => get_cut_value($primary_id),
                'article_url' => $article_url,
                'chapter_url' => $last_chapter_url,
            ),"http://127.0.0.1:1122");

            $list = $result['data'];

            if (!empty($list)) {

                $article = model('article')->where('PrimaryId','eq',get_cut_value($primary_id))->field("SourceList")->find()->toArray();

                foreach ($list as $key => $item) {
                    $list[$key]['primary_id'] = $primary_id;
                    $sort = get_offset_sort((int)$last_chapter_sort + $key + 1,$article['SourceList'],$article_url);
                    $list[$key]['sort'] = $sort;
                    //设置缓存
                    Cache::set("cache_chapter_" . get_cut_value($primary_id) . "_" . $sort,$list[$key],60);
                }

                $list = array_reverse($list);
                Cache::set($cache_key,$list,5);
                $this->echoJson($list,200,"更新成功!");
            }else {
                $this->echoJson("",404,"暂无更新");
            }

        }
    }

}

