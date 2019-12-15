<?php
namespace app\biquge\controller;

use app\common\controller\Common;
use org\Page;
use think\Exception;
use think\facade\Cache;
use think\facade\Config;
use think\facade\Request;

class Category extends Base
{
    protected function initialize()
    {
        parent::initialize();

    }

    public function index($page = 1)
    {
        $page_size = 30;
        $offset = ($page - 1) * $page_size;

        //分类小说
        $novel_list = [];

        $model = model("article")->whereIn('Cid',$this->current_cate['cid_list']);
        $total = $model->count();

        $list_data = $model->limit($offset,$page_size)->order('PrimaryId','desc')->select()->toArray();
        $novel_list['list'] = $list_data;

        //区块
        $novel_list['block'] = get_redis_cid_ranking_list($this->current_cate['cid'],30,"top");

        $pageObj = new Page(sprintf("%s_{PAGE}", $this->current_cate['alias']), $page, $total, $page_size);
        if (isMobileDomain()) {
            $pageObj->setConfig("theme",'%NO_PREV% %UP_PAGE% %DOWN_PAGE% %HEADER%');
        }
        $show = $pageObj->showPc();
        $this->assign("pages",$show);

        $this->site_seo('category',array('category' => $this->current_cate));
        return $this->fetch("index",["category" => $this->current_cate,"novel_list" => $novel_list]);

    }

    public function sort ()
    {
        $this->site_seo('category',array('category' => $this->current_cate));

        return $this->fetch("sort");
    }
}

