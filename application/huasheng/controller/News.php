<?php
namespace app\huasheng\controller;

use app\common\controller\Common;
use org\Page;
use think\Exception;
use think\facade\Cache;
use think\facade\Config;
use think\facade\Request;

class News extends Base
{

    /**
     * 资讯分页
     * @param int $page 当前页码
     * @return mixed
     * @throws Exception
     */
    public function index($page = 1)
    {
        $page_size = 15; //页码大小
        $offset = ((int)$page - 1) * $page_size;

        $model = model("news")->where(['Status' => 1,"SiteId" => $this->site_config['site_id']]);
        $total = $model->count();

        $list = $model->limit($offset,$page_size)->order('UpdateTime','DESC')->cache()->select()->toArray();

        $pages = new Page("news/list_{PAGE}",$page,$total,$page_size);
        if (isMobileDomain()) {
            $pages->setConfig("theme",'%NO_PREV% %UP_PAGE% %DOWN_PAGE%');
            $show = $pages->showMobile();
        }else {
            $show = $pages->show();
        }

        $this->assign("pages",$show);

        $this->site_seo('news_list',array('page' => $page));
        return $this->fetch('index',['total' => $total,'list' => $list,"current_page" => "news"]);
    }


    /**
     * 资讯详情
     * @param int $id 资讯id
     * @return mixed
     * @throws
     */
    public function detail($id = 0) {

        //资讯详情
        $news = model("news")->where(["SiteId" => $this->site_config['site_id'],'Status' => 1,'NewsId' => get_cut_value($id)])->cache()->find();

        $news['Article'] = '';
        if (!empty($news['PrimaryId'])) {
            $article = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('PrimaryId','eq',(int)$news['PrimaryId'])->cache()->find();
            if (!empty($article)) {

                $article = $article->toArray();
                //手动更新
                if ($article['OneSelf'] == 1) {
                    $all_chapter_list = get_custom_all_chapter_list($article['_id'],$article['SourceList'],0,0);
                }else {
                    $all_chapter_list = get_all_chapter_list($article['_id'],$article['SourceList'],0,0);
                }

                $article['LastUpdateChapterList'] = $all_chapter_list['last_update_chapter_list'];

                $news['Article'] = $article;
            }
        }

        $news['prev_news'] = model("news")->where('SiteId','eq',(int)$this->site_config['site_id'])->where('NewsId','lt', get_cut_value($id))->field('Title,NewsId')->order('NewsId',"DESC")->cache()->find();
        $news['next_news'] = model("news")->where('SiteId','eq',(int)$this->site_config['site_id'])->where('NewsId','gt', get_cut_value($id))->field('Title,NewsId')->order('NewsId',"ASC")->cache()->find();

        //设置小说点击量
        set_news_click(get_cut_value($id));
        add_redis_news_cid_ranking(get_cut_value($id),$news['Cid'],"top");

        $this->site_seo('news_detail',array("title" => $news['Title'],"chapter_title" => $news['ChapterTitle'],"introduction" => $news['Introduction']));
        return $this->fetch('detail',['news' => $news,"current_page" => "news"]);
    }

}

