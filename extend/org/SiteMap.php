<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/8/27 0027
 * Time: 下午 15:05
 */
namespace org;
use think\facade\Request;

/**
 * <url>
        * <loc>http://www.dadiba.net</loc>
        * <priority>1.00</priority>
        * <lastmod>2015-06-15T13:21:34+08:00</lastmod>
        * <changefreq>Always</changefreq>
    * </url>
*/
/**
 * Sitemap输出和生成类
 * @author
 */
class SiteMap
{
    //类定义开始
    private $config = array(
        'encoding' => 'UTF-8',
        'ver' => '1.0'
    );
    private $content = '';
    // Items部分
    private $items = array();
    private $map_index_items = array();

    public function __get($name)
    {
        if (isset($this->config[$name])) {
            return $this->config[$name];
        }
        return null;
    }

    public function __set($name, $value)
    {
        if (isset($this->config[$name])) {
            $this->config[$name] = $value;
        }
    }

    public function __isset($name)
    {
        return isset($this->config[$name]);
    }

    public function content($name)
    {
        if (empty($this->content)) $this->Build();
        $this->content;
    }

    /**
     * 架构函数
     * @access public
     * @param array $config 上传参数
     */
    public function __construct()
    {
    }

    /**************************************************************************/
    // 函数名: AddItem
    // 功能: 添加一个节点
    //$changefreq | always 经常,hourly 每小时,daily 每天,weekly 每周,monthly 每月,yearly 每年,never 从不
    /**************************************************************************/

    function AddItem($loc, $priority, $changefreq = 'Always',$time = 0)
    {
        $arr = array(
            1,
            0.9,
            0.8,
            0.7,
            0.6,
            0.5
        );

        if ($time == 0) {
            $time = time();
        }

        $this->items[] = array(
            'loc' => $loc,
            'priority' => $arr[$priority],
            'lastmod' => date('Y-m-d H:i:s',$time),
            'changefreq' => $changefreq
        );
    }
    /**************************************************************************/
    // 函数名: Build
    // 功能: 生成sitemap xml文件内容
    /**************************************************************************/
    function Build()
    {
        $s = "<?xml version='1.0' encoding='{$this->encoding}'?>\r\n";
        $s .= "\t<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">\r\n";
        // items
        for ($i = 0; $i < count($this->items); $i++) {
            $s .= "\t\t<url>\n";
            $s .= "\t\t\t<loc>{$this->items[$i]['loc']}</loc>\r\n";
            $s .= "\t\t\t<priority>{$this->items[$i]['priority']}</priority>\r\n";
            $s .= "\t\t\t<lastmod>{$this->items[$i]['lastmod']}</lastmod>\r\n";
            $s .= "\t\t\t<changefreq>{$this->items[$i]['changefreq']}</changefreq>\r\n";
            $s .= "\t\t</url>\n";
        }
        // close
        $s .= "\t</urlset>";
        $this->content = $s;
    }

    /**
     * 输出单条map地址
     */
    function Show()
    {
        header("Content-Type: text/xml; charset=utf-8");
        if (empty($this->content)) $this->Build();
        exit($this->content);
    }

    function BuildMapIndex($index = 0)
    {
        $s = "<?xml version='1.0' encoding='{$this->encoding}'?>\r\n";
        $s .= "\t<sitemapindex>\r\n";
        $time = date('Y-m-d',time());

        // items
        for ($i = 0; $i < $index; $i++) {
            $s .= "\t\t<sitemap>\n";
            $url = Request::domain() . sprintf("/sitemap_%d.xml",$i + 1);
            $s .= "\t\t\t<loc>{$url}</loc>\r\n";
            $s .= "\t\t\t<lastmod>{$time}</lastmod>\r\n";
            $s .= "\t\t</sitemap>\n";
        }
        // close
        $s .= "\t</sitemapindex>";
        $this->content = $s;
    }

    /**
     * 显示多条map地址
     */
    function ShowIndex()
    {
        header("Content-Type: text/xml; charset=utf-8");
        if (empty($this->content)) $this->BuildMapIndex();
        exit($this->content);
    }

    /**************************************************************************/
    // 函数名: SaveToFile
    // 功能: 将产生的sitemap 内容保存到文件
    // 参数: $fname 要保存的文件名
    /**************************************************************************/
    function SaveToFile($fname)
    {
        if (empty($this->content)) $this->Build();
        $handle = fopen($fname, 'w+');
        if ($handle === false) return false;
        fwrite($handle, $this->content);
        fclose($handle);
    }

    /**************************************************************************/
    // 函数名: getFile
    // 功能: 从文件中获取输出
    // 参数: $fname 文件名
    /**************************************************************************/
    function getFile($fname)
    {
        $handle = fopen($fname, 'r');
        if ($handle === false) return false;
        while (!feof($handle)) {
            echo fgets($handle);
        }
        fclose($handle);
    }
}