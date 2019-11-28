<?php
namespace app\huasheng\controller;

use app\common\controller\Common;
use org\Page;
use think\facade\Config;

class Top extends Base
{
    protected function initialize()
    {
        parent::initialize();
    }

    public function index () {

        $top_list = array();
        foreach ($this->site_config['category_list'] as $category) {
            $top_list[] = array(
                'cid' => $category['cid'],
                'name' => $category['name'],
                'top_list' => get_redis_cid_ranking_list($category['cid'],10,"top"),
            );
        }

        $this->site_seo('top');
        return $this->fetch('index',['list' => $top_list,"current_page" => 'top',"current_classify" => '']);
    }

}
