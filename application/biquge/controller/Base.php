<?php

namespace app\biquge\controller;

use app\common\controller\Common;
use think\facade\Env;
use think\facade\Log;

class Base extends Common
{

    protected function initialize()
    {
        parent::initialize();

        $this->initRouteConfig();

        $this->current_cate = array(
            'name' => "首页",
            'alias' => "home",
            'cid_list' => "",
        );

        $paths = explode("/",$this->request->path());

        if (is_array($this->site_config['category_list']) && count($paths) > 0) {
            foreach ($this->site_config['category_list'] as $category) {
                if (strpos($paths[0],$category['alias']) !== false) {
                    $this->current_cate = $category;
                    break;
                }
            }
        }

        $this->assign("current_cate",$this->current_cate);
    }

    private function initRouteConfig()
    {
        $site_config = get_site_config();
        if (!empty($site_config['category_list'])) {

            $routePath = Env::get('root_path') . 'route/index.php';
            if (!is_file($routePath)) {
                $route = '';

                if (is_array($site_config['category_list'])) {

                    foreach ($site_config['category_list'] as $item) {
                        $route .= "Route::get('{$item['alias']}_:page', 'category/index');\r\nRoute::get('{$item['alias']}', 'category/index');\r\n\r\n";
                    }

                    $code = <<<INFO
<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\\facade\\Route;

{$route}

INFO;
                    file_put_contents($routePath, $code);
                }
            }
            Log::info('初始化路由文件成功');
        }else {
            Log::info('初始化路由文件失败');
        }
    }


    /**
     * 站点SEO
     * @param string $seo_type 页面类型
     * @param array $param 参数
     * @throws
     */
    protected function site_seo($seo_type = "",$param = array())
    {
        $site_config = get_site_config();

        $site_title = '';
        $keywords = '';
        $description = '';

        foreach ($site_config['site_seo'] as $seo) {

            if ($seo['alias'] == "home" && $seo_type == $seo['alias']) { //首页
                if(!empty($seo['item']['title'])){
                    $site_title = trim(str_replace(array('{site_name}'), array($site_config['site_name']), $seo['item']['title']));
                }
                if(!empty($seo['item']['keywords'])){
                    $keywords = trim(str_replace(array('{site_name}'), array($site_config['site_name']), $seo['item']['keywords']));
                }
                if(!empty($seo['item']['description'])){
                    $description = trim(str_replace(array('{site_name}'), array($site_config['site_name']), $seo['item']['description']));
                }
                break;
            }else if ($seo['alias'] == "details"  && $seo_type == $seo['alias']) { //详情
                $details = $param['details'];

                if(!empty($seo['item']['title'])){
                    $site_title = trim(str_replace(array('{title}','{author}','{category_name}','{site_name}','{page}'), array($details['Title'],$details['Author'],$param['category_name'],$site_config['site_name'],$details['page']), $seo['item']['title']));
                }
                if(!empty($seo['item']['keywords'])){
                    $keywords = trim(str_replace(array('{title}','{author}','{category_name}','{site_name}','{page}'), array($details['Title'],$details['Author'],$param['category_name'],$site_config['site_name'],$details['page']), $seo['item']['keywords']));
                }
                if(!empty($seo['item']['description'])){
                    $description = trim(str_replace(array('{title}','{author}','{category_name}','{introduction}','{UpdateTime}','{site_name}','{page}'), array($details['Title'],$details['Author'],$param['category_name'],$details['Introduction'],date("Y-m-d H:i:s",$details['UpdateTime']),$site_config['site_name'],$details['page']), $seo['item']['description']));
                }
                break;
            } else if ($seo['alias'] == "chapter" && $seo_type == $seo['alias']) { //章节
                $article = $param['article'];
                $chapter = $param['chapter'];

                if(!empty($seo['item']['title'])){
                    $site_title = trim(str_replace(array('{site_name}','{title}','{author}','{category_name}','{chapter_title}','{page}'), array($site_config['site_name'],$article['Title'],$article['Author'],$param['category_name'],$chapter['Title'],$chapter['page']), $seo['item']['title']));
                }
                if(!empty($seo['item']['keywords'])){
                    $keywords = trim(str_replace(array('{site_name}','{title}','{author}','{category_name}','{chapter_title}','{page}'), array($site_config['site_name'],$article['Title'],$article['Author'],$param['category_name'],$chapter['Title'],$chapter['page']), $seo['item']['keywords']));
                }
                if(!empty($seo['item']['description'])){
                    $description = trim(str_replace(array('{site_name}','{title}','{author}','{category_name}','{introduction}','{UpdateTime}','{chapter_title}','{page}'), array($site_config['site_name'],$article['Title'],$article['Author'],$param['category_name'],$article['Introduction'],date("Y-m-d H:i:s",$article['UpdateTime']),$chapter['Title'],$chapter['page']), $seo['item']['description']));
                }
                break;
            }else if ($seo_type == "category" && $seo_type == $seo['alias']) { //分类seo
                $category = $param['category'];

                if(!empty($seo['item']['title'])){
                    $site_title = trim(str_replace(array('{category_name}','{site_name}'), array($category['name'],$site_config['site_name']), $seo['item']['title']));
                }
                if(!empty($seo['item']['keywords'])){
                    $keywords = trim(str_replace(array('{category_name}','{site_name}'), array($category['name'],$site_config['site_name']), $seo['item']['keywords']));
                }
                if(!empty($seo['item']['description'])){
                    $description = trim(str_replace(array('{category_name}','{site_name}'), array($category['name'],$site_config['site_name']), $seo['item']['description']));
                }
                break;
            } else if ($seo_type == 'author' && $seo_type == $seo['alias']){ //作者seo
                if(!empty($seo['item']['title'])){
                    $site_title = trim(str_replace(array('{site_name}','{author}'), array($site_config['site_name'],$param['author']), $seo['item']['title']));
                }
                if(!empty($seo['item']['keywords'])){
                    $keywords = trim(str_replace(array('{site_name}','{author}'), array($site_config['site_name'],$param['author']), $seo['item']['keywords']));
                }
                if(!empty($seo['item']['description'])){
                    $description = trim(str_replace(array('{site_name}','{author}'), array($site_config['site_name'],$param['author']), $seo['item']['description']));
                }
                break;
            } else if ($seo_type == 'search' && $seo_type == $seo['alias']){ //搜索seo
                if(!empty($seo['item']['title'])){
                    $site_title = trim(str_replace(array('{site_name}','{keyword}'), array($site_config['site_name'],$param['keyword']), $seo['item']['title']));
                }
                if(!empty($seo['item']['keywords'])){
                    $keywords = trim(str_replace(array('{site_name}','{keyword}'), array($site_config['site_name'],$param['keyword']), $seo['item']['keywords']));
                }
                if(!empty($seo['item']['description'])){
                    $description = trim(str_replace(array('{site_name}','{keyword}'), array($site_config['site_name'],$param['keyword']), $seo['item']['description']));
                }
                break;
            }else if (($seo['alias'] == "full" && $seo_type == $seo['alias']) || $seo['alias'] == "top" && $seo_type == $seo['alias']) { //全本 和 排行榜

                if(!empty($seo['item']['title'])){
                    $site_title = trim(str_replace(array('{site_name}'), array($site_config['site_name']), $seo['item']['title']));
                }
                if(!empty($seo['item']['keywords'])){
                    $keywords = trim(str_replace(array('{site_name}'), array($site_config['site_name']), $seo['item']['keywords']));
                }
                if(!empty($seo['item']['description'])){
                    $description = trim(str_replace(array('{site_name}'), array($site_config['site_name']), $seo['item']['description']));
                }
                break;
            }

        }
        $site_seo = array(
            'title' =>  $site_title,
            'keywords' =>   $keywords,
            'description' =>   $description,
        );

        $this->assign('site_seo', $site_seo);
    }

}
