<?php
namespace app\huasheng\controller;

use org\Page;
use think\helper\Time;

class Category extends Base
{
    protected function initialize()
    {
        parent::initialize();

    }

    public function index($where = '')
    {
        $current_update_time = 0;
        $current_status = 2;
        $page = 1;  //页码
        $page_size = 30; //页码大小

        $where_arr = array();
        if (empty($where)) {
            $where_arr[0] = 'all';
        }else {
            $where_arr = explode("_",$where);
        }

        if (count($where_arr) > 1) {
            $current_update_time = (int)$where_arr[1];
        }
        if (count($where_arr) > 2) {
            $current_status = (int)$where_arr[2];
        }
        if (count($where_arr) > 3) {
            $page = (int)$where_arr[3];
        }

        //分页
        $offset = ($page - 1) * $page_size;

        //分类
        $classify_arr = array('all' => array('cid' => 0,'alias' => 'all','name' => '全部','path' => '/classify/all'));
        foreach ($this->site_config['category_list'] as $item) {
            $classify_arr[$item['alias']] = array(
                'cid' => $item['cid'],
                'alias' => $item['alias'],
                'name' => $item['name'],
                'path' => '/classify/' . $item['alias']
            );
        }
        //时间选择
        $classify_update_times = array(array('time' => 0,'name' => "不限"), array('time' => 1,'name' => "今天"), array('time' => 3,'name' => "三日内"), array('time' => 7,'name' => "七日内"), array('time' => 15,'name' => "半月内"), array('time' => 30,'name' => "一月内"));
        foreach ($classify_update_times as $key => $item) {
            $classify_update_times[$key]['path'] = sprintf("%s_%d_%d",$classify_arr[$where_arr[0]]['path'],$item['time'],$current_status);
        }
        //连载状态
        $classify_status = array(array('status' => 2,'name' => "不限"), array('status' => 0,'name' => "连载中"), array('status' => 1,'name' => "已完结"));
        foreach ($classify_status as $key => $item) {
            $classify_status[$key]['path'] = sprintf("%s_%d_%d",$classify_arr[$where_arr[0]]['path'],$current_update_time,$item['status']);
        }

        //当前分类
        $current_classify = $classify_arr[$where_arr[0]];

        $where = [];
        //分类选中
        if ($current_classify['cid'] != 0) {
            $where[] = ['Cid','in',get_sub_cid_list($current_classify['cid'])];
        }else {
            $where[] = ['Cid','in',get_all_sub_cid_list()];
        }

        //连载状态
        if ($current_status != 2) {
            $where[] = ['Full','eq',$current_status];
        }

        //更新时间
        if ($current_update_time != 0) {
            $update_time = 0;
            switch ($current_update_time) {
                case 1 :
                    $update_time = Time::daysAgo(1);
                    break;
                case 3 :
                    $update_time = Time::daysAgo(3);
                    break;
                case 7 :
                    $update_time = Time::daysAgo(7);
                    break;
                case 15 :
                    $update_time = Time::daysAgo(15);
                    break;
                case 30 :
                    $update_time = Time::daysAgo(30);
                    break;
            }

            if ($update_time != 0) {
                $where[] = ['UpdateTime','gt',$update_time];
            }
        }


        $model = model("article")->where($where);
        $total = $model->count();

        $list = $model->limit($offset,$page_size)->order('UpdateTime','DESC')->cache()->select()->toArray();

        //分页
        $pages = new Page(sprintf("classify/%s_%d_%d_{PAGE}",$where_arr[0],$current_update_time,$current_status),$page,$total,$page_size);
        if (isMobileDomain()) {
            $pages->setConfig("theme",'%NO_PREV% %UP_PAGE% %DOWN_PAGE% ');
            $show = $pages->showMobile();
        }else {
            $show = $pages->show();
        }

        $this->assign("pages",$show);

        $this->assign("page",$page);
        $this->assign("current_status",$current_status);
        $this->assign("current_update_time",$current_update_time);
        $this->assign("classify_status",$classify_status);
        $this->assign("classify_update_times",$classify_update_times);
        $this->assign("current_alias",$where_arr[0]);
        $this->assign("current_page",'classify');

        $this->site_seo('category',array('category' => $current_classify,"page" => $page));
        return $this->fetch("index",['current_cate' => 'category','classify' => $classify_arr,'current_classify' => $current_classify,'list' => $list]);
    }

}

