<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
use org\RedisRanking\DummyDayDataSource;
use org\RedisRanking\Ranking\TotalRanking;
use org\RedisRanking\RankingManger;
use think\Db;
use think\facade\Cache;
use think\facade\Config;
use think\facade\Env;
use think\facade\Request;

/**
 * 显示采集源名称
 * @param string $url
 * @return string
 */
function show_source_name ($url = '') {
    return "xxx";
}

/**
 * 获取幻灯片
 * @param int $limit 条数
 * @return mixed
 */
function get_slide_list($limit = 4) {
    $site_config = get_site_config();
    return $site_config['slide_list'];
}

/**
 * 获取所有cid数组
 * @return array
 */
function get_all_cid_list() {
    $site_config = get_site_config();
    $cid_list = [];
    if (array_key_exists("category_list",$site_config)) {
        foreach ($site_config['category_list'] as $category) {
            $cid_list[] = $category['cid'];
        }
    }
    return $cid_list;
}

/**
 * 获取分类subId
 * @param int $cid
 * @return array|mixed
 */
function get_sub_cid_list($cid = 0) {
    $site_config = get_site_config();
    $cid_list = [];
    if (array_key_exists("category_list",$site_config)) {
        foreach ($site_config['category_list'] as $category) {
            if ($category['cid'] == $cid) {
                return $category['cid_list'];
            }
        }
    }
    return $cid_list;
}

/**
 * 获取所有子分类ID
 * @return array
 */
function get_all_sub_cid_list() {
    $site_config = get_site_config();
    $cid_list = [];
    if (array_key_exists("category_list",$site_config)) {
        foreach ($site_config['category_list'] as $category) {
            $cid_list = array_merge($cid_list,$category['cid_list']);
        }
    }
    return $cid_list;
}

/**
 * 获取小说源flag
 * @param int $source_key 数组下标
 * @param array $source_list 小说源
 * @return bool|mixed
 */
function get_offset_source_flag($source_key = 0,$source_list = []){
    if (count($source_list) == $source_key) return 'custom';

    if (count($source_list) > $source_key) {
        return get_flag_name($source_list[$source_key]);
    }
}

/**
 * 获得偏移章节id
 * @param int $sort 章节表id
 * @param array $source_list 小说表源
 * @param string $flag 章节flag
 * @return string
 */
function get_last_offset_sort($sort = 0,$source_list = [],$flag = ''){
    if ($flag == 'custom') {
        return "0_" . get_offset_value($sort);
    }

    if (strpos($flag,"_")) {
        $url = "http://" . str_replace("_",".",$flag);
    }
    foreach ($source_list as $key => $source) {
        if (parse_url($url)['host'] == parse_url($source)['host']) {
            return $key . "_" . get_offset_value($sort);
        }
    }
}

/**
 * 获得偏移章节id
 * @param int $sort 章节表id
 * @param array $source_list 小说表源
 * @param string $url 章节url
 * @return string
 */
function get_offset_sort($sort = 0,$source_list = [],$url = ''){

    if (empty($url) && count($source_list) == 0){
        return "0_" . get_offset_value($sort);
    }

    foreach ($source_list as $key => $source) {
        if (parse_url($url)['host'] == parse_url($source)['host']) {
            return $key . "_" . get_offset_value($sort);
        }
    }
}

/**
 * 获取分类
 * @param int $cid
 * @return array|mixed
 */
function get_category ($cid = 0){
    $site_config = get_site_config();

    foreach ($site_config['category_list'] as $category) {
        if (in_array($cid,$category['cid_list'])) {
            return  $category;
        }
    }

    return [
        'cid' => 0,
        'name' => "未知分类",
        'alias' => "",
        "cid_list" => []
    ];
}

/**
 * 获取所有的章节列表
 * @param string $oid 小说表oid
 * @param array $source_list 所有的源
 * @param int $page 当前页码
 * @param int $page_size 分页大小
 * @return array
 * @throws
 */
function get_all_chapter_list ($oid = '',$source_list = [],$page = 0,$page_size = 0) {

    $offset = ($page - 1) * $page_size;

    $chapter_total = 0;
    $chapter_table_name = '';

    foreach ($source_list as $url) {
        $table_name = get_chapter_table_name($url);
        $total = get_chapter_list_total($oid,$table_name);
        if ($total > $chapter_total) {
            $chapter_total = $total;
            $chapter_table_name = $table_name;
        }
    }

    if ($page == 0 && $page_size == 0) {
        $chapter_list = Db::name($chapter_table_name)->where('ArticleId','eq',$oid)->order('Sort','ASC')->cache()->select();
    }else {
        $chapter_total = Db::name($chapter_table_name)->where('ArticleId','eq',$oid)->cache()->count();
        $chapter_list = Db::name($chapter_table_name)->where('ArticleId','eq',$oid)->limit($offset,$page_size)->order('Sort','ASC')->cache()->select();
    }

    //最后更新
    $last_update_chapter_list = Db::name($chapter_table_name)->where('ArticleId','eq',$oid)->limit(12)->order('Sort','DESC')->cache()->select();

    //最后章节标题
    $last_chapter_title = '';
    $last_chapter_sort = 0;
    if (count($last_update_chapter_list) > 0) {
        $last_chapter_sort = $last_update_chapter_list[0]['Sort'];
        $last_chapter_title = $last_update_chapter_list[0]['Title'];
    }

    return [
        'chapter_total' => $chapter_total,
        'last_chapter_sort' => $last_chapter_sort,
        'last_chapter_title' => $last_chapter_title,
        'last_chapter_flag'  => str_replace("chapter_","",$chapter_table_name),
        'last_update_chapter_list' => $last_update_chapter_list,
        'chapter_list' => $chapter_list,
    ];
}


/**
 * 手动更新章节列表
 * @param string $oid 小说表oid
 * @param array $source_list 所有的源
 * @param int $page 当前页码
 * @param int $page_size 分页大小
 * @return array
 * @throws
 */
function get_custom_all_chapter_list ($oid = '',$source_list = [],$page = 0,$page_size = 0) {

    $offset = ($page - 1) * $page_size;

    $chapter_total = 0;

    if ($page == 0 && $page_size == 0) {
        $chapter_list = Db::name('chapter_custom')->where('ArticleId','eq',$oid)->order('Sort','ASC')->cache()->select();
    }else {
        $chapter_total = Db::name('chapter_custom')->where('ArticleId','eq',$oid)->cache()->count();
        $chapter_list = Db::name('chapter_custom')->where('ArticleId','eq',$oid)->limit($offset,$page_size)->order('Sort','ASC')->cache()->select();
    }

    //最后更新
    $last_update_chapter_list = Db::name('chapter_custom')->where('ArticleId','eq',$oid)->limit(12)->order('Sort','DESC')->cache()->select();

    //最后章节标题
    $last_chapter_title = '';
    $last_chapter_sort = 0;
    if (count($last_update_chapter_list) > 0) {
        $last_chapter_sort = $last_update_chapter_list[0]['Sort'];
        $last_chapter_title = $last_update_chapter_list[0]['Title'];
    }

    return [
        'chapter_total' => $chapter_total,
        'last_chapter_sort' => $last_chapter_sort,
        'last_chapter_title' => $last_chapter_title,
        'last_chapter_flag'  => 'custom',
        'last_update_chapter_list' => $last_update_chapter_list,
        'chapter_list' => $chapter_list,
    ];
}

/**
 * 获取章节列表
 * @param string $oid 小说mongodbId
 * @param string $flag 规则标记
 * @return array|PDOStatement|string|\think\Collection
 * @throws \think\db\exception\DataNotFoundException
 * @throws \think\db\exception\ModelNotFoundException
 * @throws \think\exception\DbException
 */
function get_flag_chapter_list ($oid = '',$flag = '') {
    return Db::name(sprintf("chapter_%s",$flag))->where('ArticleId','eq',$oid)->order('Sort','ASC')->field('Sort,Title,Url')->cache()->select();
}

/**
 * 获取下一章
 * @param string $flag 标记
 * @param int $oid 小说表id
 * @param int $chapter_id 章节id
 * @return array
 * @throws
 */
function get_next_chapter($flag = '',$oid = 0,$chapter_id = 0) {
    return Db::name(sprintf("chapter_%s",$flag))->where('ArticleId','eq',$oid)->where('Sort','gt',(int)$chapter_id)->field('Title,Sort,Url')->order('Sort',"ASC")->cache()->find();
}
/**
 * 获取上一章
 * @param string $flag 标记
 * @param int $oid 小说表id
 * @param int $chapter_id 章节id
 * @return array
 * @throws
 */
function get_pre_chapter($flag = '',$oid = 0,$chapter_id = 0) {
    return Db::name(sprintf("chapter_%s",$flag))->where('ArticleId','eq',$oid)->where('Sort','lt',(int)$chapter_id)->field('Title,Sort,Url')->order('Sort',"DESC")->cache()->find();
}

/**
 * 获取规则章节表数据
 * @param string $flag 规则
 * @param string $oid 小说表id
 * @param int $chapter_id 小说排序id
 * @return array
 * @throws
 */
function get_chapter_flag_details ($flag = '',$oid = '',$chapter_id = 0) {
    return Db::name(sprintf("chapter_%s",$flag))->where('ArticleId','eq',$oid)->where('Sort','eq',(int)$chapter_id)->cache()->find();
}

/**
 * 获取章节列表大小
 * @param string $oid 小说表主键 _id
 * @param string $table_name 章节表名
 * @return float|string
 */
function get_chapter_list_total ($oid = '',$table_name = ''){
    return Db::name($table_name)->where('ArticleId','eq',$oid)->cache()->count();
}

/**
 * 拼接url得到章节表名
 * @param string $url
 * @return string
 */
function get_chapter_table_name ($url = '') {
    return "chapter_" . get_flag_name($url);
}

/**
 * 解析url得到flag
 * @param string $url
 * @return bool|mixed
 */
function get_flag_name ($url = ''){
    if (empty($url) || strlen($url) == 0) {
        return 'custom';
    }else {
        return str_replace('.','_',parse_url($url)['host']);
    }
}

/**
 * 偏移增加value
 * @param int $value
 * @return int
 */
function get_offset_value ($value = 0){
    $site_config = get_site_config();
    return (int)$site_config['sort'] + (int)$value;
}

/**
 * 偏移减少value
 * @param int $value
 * @return int
 */
function get_cut_value ($value = 0){
    $site_config = get_site_config();
    return (int)((int)$value - (int)$site_config['sort']);
}

/**
 * 获取分类区块数据
 * @param int $cid
 * @param int $limit
 * @return array
 * @throws
 */
function get_cid_block_list ($cid = 0,$limit = 10){
    
    $block_list = [];
    $site_config = get_site_config();
    if (is_array($site_config['block_list'])) {
        foreach ($site_config['block_list'] as $item) {
            if ($item['cid'] == get_cut_value($cid)) {
                $block_list = model('article')->whereIn('PrimaryId',$item['article_list'])->order('Sort','DESC')->order('PrimaryId','DESC')->limit($limit)->cache()->select()->toArray();
                break;
            }
        }
    }

    return $block_list;
}

/**
 * 获取广告位
 * @param string $alias
 * @return mixed|string
 */
function get_ad ($alias = '') {
    if ($alias == '') return '';
    $config = get_site_config();
    foreach ($config['ad_list'] as $ad) {
        if ($ad['alias'] == trim($alias)) return $ad['content'];
    }
    return '';
}

/**
 * 随机数据
 * @param int $cid 分类id
 * @param int $limit 条数
 * @return array
 * @throws
 */
function get_random_list ($cid = 0,$limit = 10) {

    if ($cid == 0) {
        $cid_list =  get_all_sub_cid_list();
    }else {
        $category = get_category($cid);
        $cid_list = $category['cid_list'];
    }

    $model = model('article')->whereIn('Cid',$cid_list);
    $random_num = rand(1,$model->count());

    $list = $model->where("PrimaryId","lt",$random_num)->order('Sort','DESC')->order('PrimaryId','DESC')->limit($limit)->select()->toArray();

    return $list;
}

/**
 * 获取所有排行榜数据
 * @param int $cid 分类id
 * @param int $limit
 * @param string $name
 * @return array
 */
function get_redis_all_ranking_list ($cid = 0,$limit = 10,$name = "top") {
    $cid = (int)$cid;

    if ($cid != 0) {
        return get_redis_cid_ranking_list(show_cid($cid),$limit,$name);
    }else {
        $cid_list = get_all_cid_list();
        $list = [];
        foreach ($cid_list as $cid) {
            if (count($list) < (int)$limit) {
                $list = array_merge($list,get_redis_cid_ranking_list($cid,$limit,$name));
            }
        }
        return $list;
    }
}

/**
 * 热门全本
 * @param int $limit
 * @return array
 */
function get_hot_full_list ($limit = 10) {

    $cid_list = get_all_cid_list();
    $list = [];

    $limit = (int)$limit / count($cid_list);
    if ($limit < 0) $limit = 5;

    foreach ($cid_list as $cid) {
        $list = array_merge($list,get_redis_cid_ranking_list($cid,$limit,"top"));
    }

    return $list;

}

/**
 * 从redis获取排行榜数据
 * @param int $cid 分类id
 * @param int $limit 条数
 * @param string $name 排行榜标识
 * @return array
 * @throws
 */
function get_redis_cid_ranking_list ($cid = 0,$limit = 10,$name = ""){

    //排行榜计数
    $rankingManager = (new RankingManger())->setDataSource(new DummyDayDataSource())->setRankingClasses([TotalRanking::class])->setRankingName(sprintf("%s_%d",$name,$cid))->init();
    $top_list_key = $rankingManager->totalRanking->top($limit);
    $block_list = model('article')->whereIn('PrimaryId',array_keys($top_list_key))->limit($limit)->cache()->select()->toArray();

    $top_list = [];
    foreach (array_keys($top_list_key) as $top_key) {
        foreach ($block_list as $item) {
            if ($item['PrimaryId'] == get_offset_value($top_key)) {
                $top_list[] = $item;
            }
        }
    }

    return $top_list;
}

/**
 * 添加排行榜数据
 * @param int $primaryId 小说id
 * @param int $cid 分类id
 * @param string $ranking_name 排行榜类型
 * @return string
 */
function add_redis_cid_ranking ($primaryId = 0,$cid = 0,$ranking_name = ""){
    $cache_key = sprintf("novel_ranking_%s_%s",$primaryId,Request::ip());
    if (Cache::has($cache_key)) {
        return false;
    }else {
        //24小时算一次点击
        Cache::set($cache_key,$primaryId,86400);

        $rankingManager = (new RankingManger())->setDataSource(new DummyDayDataSource())->setRankingClasses([TotalRanking::class])->setRankingName(sprintf("%s_%d",$ranking_name,$cid))->init();
        return $rankingManager->totalRanking->add($primaryId,1);
    }

}

/**
 * 获取小说点击数量
 * @param int $primaryId
 * @return int
 */
function get_novel_click ($primaryId = 0){
    $rankingManager = (new RankingManger())->setDataSource(new DummyDayDataSource())->setRankingClasses([TotalRanking::class])->setRankingName("novel_click")->init();
    return $rankingManager->totalRanking->score($primaryId);
}

/**
 * 设置小说点击量
 * @param int $primaryId
 * @return string
 */
function set_novel_click ($primaryId = 0){
    $cache_key = sprintf("novel_click_%s_%s",$primaryId,Request::ip());
    if (Cache::has($cache_key)) {
        return false;
    }else {
        //24小时算一次点击
        Cache::set($cache_key,$primaryId,86400);

        $rankingManager = (new RankingManger())->setDataSource(new DummyDayDataSource())->setRankingClasses([TotalRanking::class])->setRankingName("novel_click")->init();
        return $rankingManager->totalRanking->add($primaryId,1);
    }
}

/**
 * 获取小说点击 在模板中调用
 * @param int $primaryId
 * @return int|null
 */
function show_novel_click ($primaryId = 0){
    $rankingManager = (new RankingManger())->setDataSource(new DummyDayDataSource())->setRankingClasses([TotalRanking::class])->setRankingName("novel_click")->init();
    return $rankingManager->totalRanking->score(get_cut_value($primaryId));
}


/**
 * 获取区块数据
 * @param int $block_id
 * @param int $limit
 * @return array
 * @throws
 */
function get_block_list ($block_id = 0,$limit = 10){

    $block_list = [];
    $site_config = get_site_config();
    if (is_array($site_config['block_list'])) {
        foreach ($site_config['block_list'] as $item) {
            if ($item['id'] == $block_id) {
                $block_list = model('article')->whereIn('PrimaryId',$item['article_list'])->order('Sort','DESC')->order('PrimaryId','DESC')->limit($limit)->cache()->select()->toArray();
                break;
            }
        }
    }

    return $block_list;
}

/**
 * 获取小说小气
 * @param \MongoDB\BSON\ObjectId $article_id
 * @return array
 * @throws
 */
function get_novel_item (MongoDB\BSON\ObjectId $article_id ){
    return model('article')->where('_id','eq',$article_id)->cache()->find()->toArray();
}

/**
 * 获取站点配置文件
 * @return mixed
 */
function get_site_config (){
    $config_path = Env::get('root_path') . "data/site_config.json";
    if (!file_exists($config_path)) {
        exit("站点配置文件不存在,请在BookCMS后台勾选站点,点击同步配置!");
    }

    $site_config = json_decode(file_get_contents($config_path),true);
    if (empty($site_config['site_seo'])) {
        exit("站点SEO配置不存在,请在BookCMS后台编辑SEO配置,然后勾选站点,点击同步配置!");
    }

    if (empty($site_config['category_list'])) {
        exit("站点分类不能为空,请编辑站点添加新分类,然后在BookCMS后台勾选站点,点击同步配置!");
    }

    foreach ($site_config['category_list'] as &$category) {
        $category['cid_list'] = array_map('intval', explode(',',$category['cid_list']));
        $category['cid'] = (int)$category['cid'] + (int)$site_config['sort'];
    }

    //自定义排序
    usort($site_config['category_list'],function ($left,$right){
        if ($left['cid'] == $right['cid']) {
            return 0;
        }
        return ($left['cid'] < $right['cid']) ? -1 : 1;
    });

    return $site_config;
}
/**
 * 显示分类名称
 * @param int $cid
 * @return string
 */
function show_cid_name ($cid = 0){
    $site_config = get_site_config();

    foreach ($site_config['category_list'] as $category) {
        if (in_array($cid,$category['cid_list'])) {
            return $category['name'];
        }
    }

    return "暂无分类";
}

/**
 * 显示分类ID
 * @param int $cid
 * @return string
 */
function show_cid ($cid = 0){
    $site_config = get_site_config();

    foreach ($site_config['category_list'] as $category) {
        if (in_array($cid,$category['cid_list'])) {
            return $category['cid'];
        }
    }

    return 0;
}

/**
 * 显示分类别名
 * @param int $cid
 * @return mixed|string
 */
function show_cid_alias ($cid = 0){
    $site_config = get_site_config();

    foreach ($site_config['category_list'] as $category) {
        if (in_array($cid,$category['cid_list'])) {
            return $category['alias'];
        }
    }

    return "";
}

/**
 * 请求服务器数据
 * @param string $url 接口地址
 * @param array $param  参数
 * @param string $server_url 服务器地址
 * @return mixed
 */
function curl_server($url = '',$param = array(),$server_url = '')
{
    $server_config = Config::pull("server");
    $curl_url = sprintf("%s/%s",$server_config['server_url'],$url);
    if($server_url != "") {
        $curl_url = sprintf("%s/%s",$server_url,$url);
    }

    $param = array_merge($param,array(
        'app_key' => $server_config['app_key'],
        'api_insert_key' => $server_config['api_insert_key'],
        'client_ip' => Request::ip(),
    ));

    return json_decode(curl_url($curl_url,$param),true);
}

/**
 * 请求远程地址
 * @param string $url 接口地址
 * @param array $param 数组参数
 * @param string $cookie
 * @param int $time_out  //超时
 * @return mixed
 */
function curl_url($url = '', $param = array(), $cookie = '',$time_out = 30)
{
    $header[] = "Content-type: application/x-www-form-urlencoded";
    $user_agent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_REFERER, $url);
    curl_setopt($ch, CURLOPT_TIMEOUT,$time_out);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_NOBODY, false);
    curl_setopt($ch, CURLOPT_USERAGENT, $user_agent);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_MAXREDIRS, 2);

    if (!empty($cookie)) {
        curl_setopt($ch, CURLOPT_COOKIE, $cookie);
    }

    if (!empty($param) && is_array($param)) {
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($param));
    }

    $html = curl_exec($ch);
    curl_close($ch);

    return $html;
}

/**
 * 熊掌号时间格式化
 * @param string $time 时间戳
 * @return string\
 */
function t_date($time = '') {
    return date("Y-m-d",$time) . "T" . date("H:i:s",$time);
}


/**
 * 下载图片
 * @param string $url
 * @return string
 */
function down_image($url = '') {

    $domain = str_replace(array('https://','http://'),'',Request::domain());
    $domain_arr = explode('.',$domain);

    if (is_array($domain_arr)) {
        return sprintf("//img.%s.%s/%s",$domain_arr[1],$domain_arr[2],str_replace("uploads/","",$url));
    }

    return "/static/nopic.gif";
}



/**
 * 下载文件
 * @param string $url
 * @return mixed
 */
function curl_down_file($url = '') {

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 10);
    curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.146 Safari/537.36");
    $data = curl_exec($ch);
    curl_close($ch);
    if (empty($data)) {
        $data = @file_get_contents($url);
    }
    return $data;
}

function book_arr2file($f, $arr = '')
{
    if (is_array($arr)) {
        $con = var_export($arr, true);
    } else {
        $con = $arr;
    }
    $con = "<?php\nreturn $con;\n?>";
    return book_write_file($f, $con);
}

function book_read_file($f)
{
    return @file_get_contents($f);
}

function book_write_file($fileName, $content = '')
{
    $dir = dirname($fileName);
    if (!is_dir($dir)) {
        book_mkdirss($dir);
    }
    return @file_put_contents($fileName, $content);
}

function book_mkdirss($path, $mode = 0777)
{
    if (!is_dir(dirname($path))) {
        book_mkdirss(dirname($path));
    }
    if (!file_exists($path)) {
        return mkdir($path, $mode);
    }
    return true;
}

/**
 * 生成随机数
 * @param int $length
 * @return string
 */
function make_rand($length = 8, $chars = null)
{
    if (is_null($chars)) {
        $chars = "abcdefghijklmnopqrstuvwxyz0123456789";
    }
    mt_srand(10000000 * (double)microtime());
    for ($i = 0, $str = '', $lc = strlen($chars) - 1; $i < $length; $i++) {
        $str .= $chars[mt_rand(0, $lc)];
    }
    return $str;
}

/**
 * 数组key转大小写
 * @param $array
 * @param int $case
 */
function array_case(&$array, $case = CASE_LOWER)
{
    $array = array_change_key_case($array, $case);
    foreach ($array as $key => $value) {
        if (is_array($value)) {
            array_case($array[$key], $case);
        }
    }
}

/**
 * 字符串截取
 * @param $str
 * @param int $start
 * @param $length
 * @param string $charset
 * @param bool $suffix
 * @return bool|string
 */
function msubstr($str, $start = 0, $length, $charset = "utf-8", $suffix = true)
{
    if (function_exists("mb_substr")) {
        if ($suffix)
            return mb_substr($str, $start, $length, $charset) . "...";
        else
            return mb_substr($str, $start, $length, $charset);
    } elseif (function_exists('iconv_substr')) {
        if ($suffix)
            return iconv_substr($str, $start, $length, $charset) . "...";
        else
            return iconv_substr($str, $start, $length, $charset);
    }
    $re['utf-8'] = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
    $re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
    $re['gbk'] = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
    $re['big5'] = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
    preg_match_all($re[$charset], $str, $match);
    $slice = join("", array_slice($match[0], $start, $length));
    if ($suffix) return $slice . "…";
    return $slice;
}

/**
 * 内容替换函数 本函数取自 ygbook
 * @param string $replace 替换规则 {filter replace='替换后内容'}<div class="ad">(.*)</div>{/filter}
 * @param string $content 待替换的内容
 * @return mixed|null|string|string[]
 */
function filter_content($replace = '', $content = '')
{
    $filterArray = explode("\n", $replace);
    foreach ($filterArray as $item) {
        preg_match("#^\\{filter\\s+replace\\s*=\\s*'([^']*)'\\s*\\}(.*)\\{/filter\\}#", $item, $matches);
        if (isset($matches[2]) && !empty($matches[2])) {
            $matches[2] = str_replace('~', '\\~', $matches[2]);
            $matches[2] = str_replace('"', '\\"', $matches[2]);
            $content = @preg_replace('~' . $matches[2] . '~iUs', $matches[1], $content);
        } else {
            $content = str_replace($item, '', $content);
        }
    }
    return trim($content);
}

/**
 * 判断是否移动端域名
 * @param string $prefix
 * @return bool
 */
function isMobileDomain($prefix = 'm')
{
    $domain = str_replace(array('https://','http://'),'',strtolower(Request::domain()));
    $domain = explode('.',$domain);
    if (is_array($domain) && $domain[0] == $prefix) {
        return true;
    }
    return false;
}


/**
 * 循环删除目录和文件
 * @param string $dir_name
 * @return bool
 */
function delete_dir_file($dir_name)
{
    $result = false;
    if (is_dir($dir_name)) {
        if ($handle = opendir($dir_name)) {
            while (false !== ($item = readdir($handle))) {
                if ($item != '.' && $item != '..') {
                    if (is_dir($dir_name . DIRECTORY_SEPARATOR . $item)) {
                        delete_dir_file($dir_name . DIRECTORY_SEPARATOR . $item);
                    } else {
                        unlink($dir_name . DIRECTORY_SEPARATOR . $item);
                    }
                }
            }
            closedir($handle);
            if (rmdir($dir_name)) {
                $result = true;
            }
        }
    }else if (is_file($dir_name)){
        $result = @unlink($dir_name);
    }

    return $result;
}

/**
 * 创建保存为桌面代码
 * @param String $filename 保存的文件名
 * @param String $url   访问的连接
 * @param String $icon   图标路径
 * @return string
 */
function createShortCut($filename = '', $url = '', $icon=''){
    // 创建基本代码
    $shortCut = "[InternetShortcut]\r\nIDList=[{000214A0-0000-0000-C000-000000000046}]\r\nProp3=19,2\r\n";
    $shortCut .= "URL=".$url."\r\n";
    if($icon){
        $shortCut .= "IconFile=".$icon."";
    }
    header("content-type:application/octet-stream");
    // 获取用户浏览器
    $user_agent = $_SERVER['HTTP_USER_AGENT'];
    $encode_filename = rawurlencode($filename);
    // 不同浏览器使用不同编码输出
    if(preg_match("/MSIE/", $user_agent)){
        header('content-disposition:attachment; filename="'.$encode_filename.'"');
    }else if(preg_match("/Firefox/", $user_agent)){
        header("content-disposition:attachment; filename*=\"utf8''".$filename.'"');
    }else{
        header('content-disposition:attachment; filename="'.$filename.'"');
    }
    return $shortCut;
}
