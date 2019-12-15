<?php
namespace app\jiutao\controller;

use app\common\controller\Common;
use org\Page;
use org\SiteMap;
use think\Db;
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

        //分割分类数组
        $all_category_list = array_chunk($this->site_config['category_list'],4);

        $last_insert_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(30)->order('PrimaryId','desc')->cache()->select()->toArray();

        $this->site_seo('home');
        return $this->fetch("index",['all_category_list' => $all_category_list,'last_insert_list' => $last_insert_list]);
    }

    /**
     * pc首页
     * @return mixed
     * @throws
     */
    public function pc_index()
    {
        $lastInsertData = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(20)->order('PrimaryId','desc')->cache()->select()->toArray();
        $lastUpdateData = model("article")->whereIn("Cid",get_all_sub_cid_list())->limit(20)->order('UpdateTime','desc')->cache()->select()->toArray();

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

        $search_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->whereOr('Title','like',trim($keyword))->whereOr('Author','like',trim($keyword))->order('UpdateTime','desc')->cache()->select()->toArray();

        $this->site_seo('search',['keyword' => $keyword]);
        return $this->fetch("search",['keyword' => $keyword,'list' => $search_list]);

    }

    /**
     * 全本
     * @param int $page
     * @return mixed
     * @throws
     */
    public function full ($page = 1) {
        $page_size = 30;
        $offset = ($page - 1) * $page_size;

        $article_model = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Full','eq',1)->where('Status','eq',1);
        $total = $article_model->count();
        $full_list = $article_model->limit($offset,$page_size)->order('PrimaryId','desc')->cache()->select()->toArray();

        //分页
        $pageObj = new Page(sprintf("%s_{PAGE}",$this->request->action()),$page,$total,$page_size);

        if (isMobileDomain()) {
            $pageObj->setConfig("theme",'%UP_PAGE% %DOWN_PAGE%');
        }

        $show = $pageObj->showPc();

        $this->assign("pages",$show);
        $this->assign("current_page",'full');

        $this->site_seo('full');
        return $this->fetch("full",['full_list' => $full_list,'total' => $total]);
    }


    /**
     * 最近更新
     * @return mixed
     * @throws
     */
    public function last_update() {
        $last_update = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Full','eq',1)->where('Status','eq',1)->limit(50)->order('UpdateTime','desc')->cache()->select()->toArray();
        $this->site_seo('last_update');
        return $this->fetch("last_update",['last_update' => $last_update]);
    }

    /**
     * 生成setmap
     */
    public function build_site_map () {
        $site_config = get_site_config();

        if (array_key_exists("site_map",$site_config)) {
            $site_map_count = (int)$site_config['site_map']['site_map_num'];

            //单条
            if ($site_config['site_map']['site_map_type'] == '1') {
                $full_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Status','eq',1)->limit($site_map_count)->order('PrimaryId','desc')->select()->toArray();

                $site = new Sitemap();

                foreach ($full_list as $item)
                {
                    $url = Request::domain() . str_replace("{novel_id}",$item['PrimaryId'],$site_config['site_map']['site_map_url']);
                    $site->AddItem($url, 2,'daily',$item['UpdateTime']);
                }

                $site->Show();
            }else {
                $total = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Status','eq',1)->count();

                $site = new Sitemap();

                $site->BuildMapIndex($total / $site_map_count);
                $site->ShowIndex();
            }
        }

    }

    /**
     * 生成index地图
     * @param int $page
     * @throws
     */
    public function build_site_index_map ($page = 1) {
        $config = get_site_config();

        if (array_key_exists("site_map",$config)) {
            $page_size = (int)$config['site_map']['site_map_num'];
            $offset = ($page - 1) * $page_size;

            $full_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Status','eq',1)->limit($offset,$page_size)->order('PrimaryId','desc')->select()->toArray();

            $site = new Sitemap();
            foreach ($full_list as $item) {
                $url = Request::domain() . str_replace("{novel_id}",$item['PrimaryId'], $config['site_map']['site_map_url']);
                $site->AddItem($url, 2, 'daily', $item['UpdateTime']);
            }

            $site->Show();
        }

    }

    /**
     * 桌面图标
     */
    public function desktop () {
        $site_config = get_site_config();
        $desktop = createShortCut("{$site_config['site_name']}.url", $site_config['site_domain'],  $site_config['site_domain']."/favicon.ico");
        exit($desktop);
    }
}
