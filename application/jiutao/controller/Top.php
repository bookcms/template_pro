<?php
namespace app\jiutao\controller;

use app\common\controller\Common;
use org\RedisRanking\DummyDayDataSource;
use org\RedisRanking\Ranking\DailyRanking;
use org\RedisRanking\Ranking\MonthlyRanking;
use org\RedisRanking\Ranking\TotalRanking;
use org\RedisRanking\Ranking\WeeklyRanking;
use org\RedisRanking\RankingManger;

class Top extends Base
{
    protected function initialize()
    {
        parent::initialize();
    }

    /**
     * 排行榜
     * @return mixed
     */
    public function index () {

        //获取所有分类
        $site_config = get_site_config();
        $category_list = $site_config['category_list'];

        $ranking_list = array();

        foreach ($category_list as $category) {
            $ranking_list[] = array(
                'cid' => $category['cid'],
                'name' => $category['name'],
                'total' => model('article')->whereIn('Cid',$category['cid_list'])->cache(md5('article_cid_total_' . $category['cid']))->count(),
                'top_list' => get_redis_cid_ranking_list($category['cid'],15,"top"),
//                'collect_list' => get_redis_cid_ranking_list($category['cid'],15,"collect"),
//                'block_list' => get_cid_block_list($category['cid'],15),
            );
        }

        $this->assign("current_page",'top');
        $this->site_seo('top');

        return $this->fetch('index',['ranking_list' => $ranking_list]);
    }


}
