<?php
namespace app\index\controller;

use app\common\controller\Common;
use org\Page;
use org\SiteMap;
use think\Db;
use think\facade\Config;
use think\facade\Env;
use think\facade\Request;

class Index extends Common
{
    protected function initialize()
    {
        parent::initialize(); //
    }



    /**
     * 搜索
     * @param string $keyword 关键
     * @return mixed
     * @throws
     */
    public function search ($keyword = '')
    {


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
            $page->setConfig("theme",'%UP_PAGE% %DOWN_PAGE%');
        }

        $show = $page->showMobile();

        $this->assign("pages",$show);
        $this->assign("current_cate",array('name' => "临时书架", 'alias' => "full",));

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
