<?php
namespace app\woaidushu\controller;

use org\ChapterPage;
use think\facade\Cache;

class Chapter extends Base
{

    public function index($primary_id = 0,$chapter_id = 0)
    {
        //章节分页
        $chapter_ids = explode("_",$chapter_id);
        $page = 1;
        $pageStr = "";

        //章节源数组下标
        $source_key = 0;

        if (count($chapter_ids) == 2) {
            $source_key = $chapter_ids[0];
            $chapter_id = $chapter_ids[1];
        }else if (count($chapter_ids) == 3) {
            $source_key = $chapter_ids[0];
            $chapter_id = $chapter_ids[1];
            $page = $chapter_ids[2];
        }else {
            //抛出异常
            throw new \think\exception\HttpException(404, '章节不存在');
        }

        //计算章节id
        $chapter_id = get_cut_value($chapter_id);
        $novel = model('article')->where('PrimaryId','eq',get_cut_value($primary_id))->cache()->find()->toArray();
        $source_flag = get_offset_source_flag($source_key,$novel['SourceList']);

        $chapter = get_chapter_flag_details($source_flag,$novel['_id'],$chapter_id);
        //章节列表
        $novel['chapter_list'] = get_flag_chapter_list($novel['_id'],$source_flag);

        $novel['pre_chapter'] = "";
        $novel['next_chapter'] = "";

        if (!empty($chapter)) {
            $novel['next_chapter'] = get_next_chapter(get_flag_name($chapter['Url']),$novel['_id'],$chapter_id);
            $novel['pre_chapter'] = get_pre_chapter(get_flag_name($chapter['Url']),$novel['_id'],$chapter_id);
        }else {
            //获取章节缓存
            $cache_key = "cache_chapter_" . get_cut_value($primary_id) . "_" . $source_key . "_";
            if (Cache::has($cache_key . get_offset_value($chapter_id))) {
                $cache_chapter =  Cache::get($cache_key . get_offset_value($chapter_id));

                //当前章节
                $chapter['Title'] = $cache_chapter['title'];
                $chapter['Url']  = $cache_chapter['url'];
                $chapter['Sort']  = explode("_",$cache_chapter['sort'])[1];

                //获取下一章节
                $next_cache_key = $cache_key . (get_offset_value($chapter_id) + 1);
                if (Cache::has($next_cache_key)) {
                    $next_cache_chapter = Cache::get($next_cache_key);
                    $next_chapter = array(
                        'Sort' => get_cut_value(explode("_",$next_cache_chapter['sort'])[1]),
                        'Title' => $next_cache_chapter['title'],
                        'Url' => $next_cache_chapter['url'],
                    );
                    $novel['next_chapter'] = $next_chapter;
                }

                //获取上一章节
                $prev_cache_key = $cache_key . (get_offset_value($chapter_id) - 1);
                if (Cache::has($prev_cache_key)) {
                    $pre_cache_chapter = Cache::get($prev_cache_key);
                    $pre_chapter = array(
                        'Sort' => get_cut_value(explode("_",$pre_cache_chapter['sort'])[1]),
                        'Title' => $pre_cache_chapter['title'],
                        'Url' => $pre_cache_chapter['url'],
                    );
                    $novel['pre_chapter'] = $pre_chapter;
                }

            }else {
                //抛出异常
                throw new \think\exception\HttpException(404, '章节不存在');
            }
        }

        $chapter_data = curl_server("api_v1/spider_chapter_content",array(
            'article_id' => json_decode(json_encode($novel['_id']),true)['$oid'],
            'sort' => $chapter['Sort'],
            'chapter_url' => $chapter['Url'],
        ),"http://127.0.0.1:1122");

        $chapter['content'] = trim(preg_replace('/<\/*div.*?>/u',"",$chapter_data['data']));

        //章节分页
        $showPage = "";
        $chapter_page_size = 500;
        if (!empty($this->site_config['extend']['chapter_page_content_num'])) {
            $chapter_page_size = $this->site_config['extend']['chapter_page_content_num'];
        }

        if ($this->site_config['extend']['chapter_page_content_switch'] == 'on') {
            $cp = new ChapterPage(sprintf("chapter/%d/%d_%d_{PAGE}",$primary_id,$source_key,get_offset_value($chapter_id)),$chapter['content'],$page,$chapter_page_size);
            $pages = $cp->cutStr();

            if (count($pages) > 0 && $page <= count($pages)) {
                $chapter['content'] = $pages[$page - 1];
                if (isMobileDomain()) {
                    $showPage = $cp->showPrvNext2();
                }else {
                    $showPage = $cp->pageNav();
                }
            }
            //内容分页标题页码
            $pageStr = sprintf("(%d)",$page);
        }

        //分类
        $novel['category'] = get_category($novel['Cid']);
        //章节信息
        $chapter['page_str'] = $pageStr;
        $chapter['source_flag'] = $source_flag;
        $novel['chapter'] = $chapter;
        $novel['chapter']['page'] = $page;


        $this->site_seo('chapter',array('chapter' => $novel['chapter'],'article' => $novel,'category_name' =>  $novel['category']['name']));
        $this->assign("showPage",$showPage);
        return $this->fetch("index",['current_cate' => $novel['category'] ,"novel" => $novel]);
    }


}

