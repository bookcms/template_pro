<?php
namespace app\biquge\controller;

use app\common\controller\Common;
use org\Page;
use org\SiteMap;
use think\Db;
use think\facade\Cache;
use think\facade\Config;
use think\facade\Env;
use think\facade\Request;

class Index extends Base
{
    protected function initialize()
    {
        parent::initialize(); //
    }

    public function index()
    {
        $lastInsertData = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(30)->order('PrimaryId','desc')->cache()->select()->toArray();
        $lastUpdateData = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(30)->order('UpdateTime','desc')->cache()->select()->toArray();

        //分割分类数组
        $all_category_list = array_chunk($this->site_config['category_list'],3);
        if (count($all_category_list) > 0) {
            if (count($all_category_list[count($all_category_list) - 1]) < 3){
                array_pop($all_category_list);
            }
        }

        $this->site_seo('home');

        return $this->fetch("index",['all_category_list' => $all_category_list,'lastUpdateData' => $lastUpdateData,'lastInsertData' => $lastInsertData]);
    }

    /**
     * 移动端新书
     * @return mixed
     * @throws
     */
    public function last_insert()
    {
        $last_insert_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(30)->order('PrimaryId','desc')->cache()->select()->toArray();
        $this->site_seo('home');

        return $this->fetch("last_insert",['last_insert_list' => $last_insert_list]);
    }

    /**
     * 搜索
     * @param string $keyword 关键
     * @return mixed
     * @throws
     */
    public function search ($keyword = '')
    {
        if (empty($keyword)) {
            $this->error("搜索关键字不能为空！");
        }

        $user_id = 0;
        if (Cache::has("user_info")) {
            $user_info = Cache::get("user_info");
            $user_id = $user_info['id'];
        }

        $search_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->whereOr('Title','like',trim($keyword))->whereOr('Author','like',trim($keyword))->order('UpdateTime','desc')->cache()->select()->toArray();

        //后台搜索统计
        curl_server("api_v1/add_top_search",array('user_id' => $user_id,'keyword' => $keyword,"platform" => 'pc','ip' => $this->request->ip()));

        $this->site_seo('search',['keyword' => $keyword]);
        return $this->fetch("search",['keyword' => $keyword,'list' => $search_list]);

    }

    public function full ($page = 1) {
        $page_size = 30;
        $offset = ($page - 1) * $page_size;

        $article_model = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Full','eq',1)->where('Status','eq',1);
        $total = $article_model->count();
        $full_list = $article_model->limit($offset,$page_size)->order('PrimaryId','desc')->cache()->select()->toArray();

        //分页
        $page = new Page(sprintf("%s_{PAGE}",$this->request->action()),$page,$total,$page_size);

        if (isMobileDomain()) {
            $page->setConfig("theme",'%UP_PAGE% %DOWN_PAGE% %HEADER%');
        }

        $show = $page->show();

        $this->assign("pages",$show);
        $this->assign("current_cate",array('name' => "临时书架", 'alias' => "full",));

        $this->site_seo('full');
        return $this->fetch("full",['full_list' => $full_list]);
    }

    /**
     * 生成setmap
     */
    public function build_site_map () {
        $this->base_build_site_map();
    }

    /**
     * 生成index地图
     * @param int $page
     * @throws
     */
    public function build_site_index_map ($page = 1) {
        $this->base_build_site_index_map($page);
    }

    /**
     * 临时书架
     * @return mixed
     */
    public function bookcase()
    {

        $this->assign("current_cate",array('name' => "临时书架", 'alias' => "bookcase",));
        $this->site_seo('bookcase');
        return $this->fetch('index');
    }

}
