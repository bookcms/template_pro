<?php

namespace app\common\controller;

use org\SiteMap;
use think\Controller;
use think\Exception;
use think\facade\Cache;
use think\facade\Config;
use think\facade\Env;
use think\facade\Log;
use think\facade\Request;

class Common extends Controller
{
    protected $site_config = null;
    protected $current_cate = null;

    protected function initialize()
    {
        parent::initialize();
        $this->site_config = get_site_config();

        $this->assign("site_config", $this->site_config);

        $runtime_path = Env::get('runtime_path');
        if ( delete_dir_file(	$runtime_path . 'temp/') ) {
//            echo "del";
        }

    }

    /**
     * 获取模板
     * @param string $template 模板名称
     * @param array $vars 模板参数
     * @param array $config
     * @return mixed
     */
    protected function fetch($template = '', $vars = [], $config = [])
    {
        $domain = str_replace(array('https://','http://'),'',Request::domain());
        $domain = explode('.',$domain);
        if (is_array($domain) && $domain[0] == 'm') {
            $template .= '_m';
        }
        return parent::fetch($template, $vars, $config);
    }


    /**
     * 生成静态
     * @param string $htmlFile 文件名称
     * @param string $htmlPath 文件路径
     * @param string $templateFile 模板文件
     * @return bool
     */
    protected function buildHtml($htmlFile='',$htmlPath='',$templateFile='') {
        $content    =   $this->fetch($templateFile);
        $htmlPath   =   !empty($htmlPath) ? $htmlPath : Env::get('root_path') . '/public/'; // 项目目录下的html目录
        $htmlFile   =   $htmlPath.$htmlFile.'.html';
        $dir   =  dirname($htmlFile);
        if(!is_dir($dir)){
            mkdir($dir,0777,true);
        }
        if(file_put_contents($htmlFile,$content) === false) {
            return false;
        } else {
            return true;
        }
    }


    /**
     * 输出json 数据
     * @param array $data
     * @param int $code
     * @param string $msg
     */
    protected function echoJson($data = array(),$code = 200,$msg = 'ok')
    {
        $data = array(
            'code' => $code,
            'msg' => $msg,
            'data' => $data
        );
        header('Content-Type: application/json; charset=utf-8');
        exit(json_encode($data));
    }


    /**
     * 生成setmap
     */
    public function base_build_site_map () {

        if (array_key_exists("site_map",$this->site_config)) {
            $site_map_count = (int)$this->site_config['site_map']['site_map_num'];

            //单条
            if ($this->site_config['site_map']['site_map_type'] == '1') {
                $full_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Status','eq',1)->limit($site_map_count)->order('PrimaryId','desc')->select()->toArray();

                $site = new Sitemap();

                foreach ($full_list as $item)
                {
                    $url = Request::domain() . str_replace("{novel_id}",$item['PrimaryId'],$this->site_config['site_map']['site_map_url']);
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
    public function base_build_site_index_map ($page = 1) {

        if (array_key_exists("site_map",$this->site_config)) {
            $page_size = (int)$this->site_config['site_map']['site_map_num'];
            $offset = ($page - 1) * $page_size;

            $full_list = model("article")->whereIn("Cid",get_all_sub_cid_list())->where('Status','eq',1)->limit($offset,$page_size)->order('PrimaryId','desc')->select()->toArray();

            $site = new Sitemap();
            foreach ($full_list as $item) {
                $url = Request::domain() . str_replace("{novel_id}",$item['PrimaryId'], $this->site_config['site_map']['site_map_url']);
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
}
