<?php
namespace app\huasheng\controller;

use app\common\controller\Common;
use org\Page;
use org\SiteMap;
use think\facade\Config;
use think\facade\Env;
use think\facade\Request;

class Index extends Base
{
    protected function initialize()
    {
        parent::initialize(); //
    }

    public function index () {
        if (isMobileDomain()) {
            return $this->mobile_index();
        }else {
            return $this->pc_index();
        }
    }

    /**
     * 移动端首页
     * @return mixed
     * @throws
     */
    public function mobile_index() {

        //最后新增
        $last_insert_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(30)->order('PrimaryId','desc')->cache()->select()->toArray();

        $this->site_seo('home');
        return $this->fetch("index",['last_insert_list' => $last_insert_list]);
    }

    /**
     * pc首页
     * @return mixed
     * @throws
     */
    public function pc_index()
    {
        $last_update_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(24)->order('UpdateTime','desc')->cache()->select()->toArray();

        //分割分类数组
        $all_category_list = array_chunk($this->site_config['category_list'],3);
        if (count($all_category_list) > 0) {
            if (count($all_category_list[count($all_category_list) - 1]) < 3){
                array_pop($all_category_list);
            }
        }

        $this->site_seo('home');

        return $this->fetch("index",['all_category_list' => $all_category_list,'last_update_list' => $last_update_list]);
    }

    /**
     * 搜索
     * @param string $k 关键字
     * @return mixed
     * @throws
     */
    public function search ($k = '')
    {
        if (empty($k)) {
            $this->error("搜索关键字不能为空！");
        }

        $search_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->whereOr('Title','like',trim($k))->whereOr('Author','like',trim($k))->order('UpdateTime','desc')->cache()->select()->toArray();

        $this->site_seo('search',['keyword' => $k]);
        return $this->fetch("search",['keyword' => $k,'list' => $search_list]);
    }


    public function full ($page = 1) {
        $page_size = 30;
        $offset = ($page - 1) * $page_size;

        $article_model = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Full','eq',1)->where('Status','eq',1);
        $total = $article_model->count();
        $list = $article_model->limit($offset,$page_size)->order('PrimaryId','desc')->cache()->select()->toArray();

        //分页
        $pageObj = new Page(sprintf("%s_{PAGE}",$this->request->action()),$page,$total,$page_size);

        if (isMobileDomain()) {
            $pageObj->setConfig("theme",'%UP_PAGE% %DOWN_PAGE% %HEADER%');
        }

        $this->assign("pages",$pageObj->showPc());

        $this->site_seo('full');
        return $this->fetch("full",['list' => $list,"current_page" => 'full']);
    }

    public function top ($classify = '') {

        $this->assign("current_classify",$classify);

        if (empty($classify))
        {
            $this->site_seo('top');
            return $this->fetch("top");
        }else {
            $this->site_seo('top');
            return $this->fetch("top_classify");
        }
    }

    /**
     * 首页列表
     * @throws
     */
    public function home_cid_list()
    {
        $cid_list = get_sub_cid_list($this->request->param('cid'));
        $list = model("article")->whereIn("Cid",$cid_list)->limit(24)->order('UpdateTime','desc')->cache()->select()->toArray();

        if (empty($list)) {
            $this->echoJson('',-1,'暂无最新');
        }else {
            $html = $this->fetch('home_cid_list',['list' => $list])->getContent();
            $this->echoJson($html);
        }
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
}
