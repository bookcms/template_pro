<?php

namespace app\jiutao\controller;

use app\common\controller\Common;

class Base extends Common
{

    protected function initialize()
    {
        parent::initialize();
        $this->assign("current_page","home");
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
