<?php
/**
 * Created by PhpStorm.
 * User: bookcms
 * Date: 2019-02-09
 * Time: 11:26
 */

namespace org;

class ChapterPage {
    private $content;       //被切分的内容
    private $pageArr;       //被切分文字的数组格式
    private $sum_word;      //总字数(UTF-8格式的中文字符也包括)
    private $sum_page;      //总页数
    private $page_word;     //一页多少字
    private $cut_tag;       //自动分页符
    private $cut_custom;    //手动分页符
    private $page;         //当前切分的页数，第几页
    private $url;

    function __construct($url = '',$content,$page = 1,$page_word = 1000){
        $this->page =  intval(trim($page));;
        $this->url = url("/" . $url);
        $this->page_word = $page_word;
        $this->cut_tag = array("</table>", "</div>", "</p>", "<br/>", "”。", "。", ".", "！", "……", "？", ",");
        $this->cut_custom = "{nextpage}";
        $this->content = $content;
    }
    //统计总字数
    function getPageWord(){
        $this->sum_word = $this->strlenUtf8($this->content);
        return $this->sum_word;
    }
    /*  统计UTF-8编码的字符长度
     *  一个中文，一个英文都为一个字
     */
    function strlenUtf8($str){
        $i = 0;
        $count = 0;
        $len = strlen ($str);
        while ($i < $len){
            $chr = ord ($str[$i]);
            $count++;
            $i++;
            if ($i >= $len)
                break;
            if ($chr & 0x80){
                $chr <<= 1;
                while ($chr & 0x80) {
                    $i++;
                    $chr <<= 1;
                }
            }
        }
        return $count;
    }
    //设置自动分页符号
    function setCutTag($tag_arr=array()){
        $this->cut_tag = $tag_arr;
    }
    //设置手动分页符
    function setCutCustom($cut_str){
        $this->cut_custom = $cut_str;
    }

    function showCpage($page=0){
        $this->cutStr();
        $page = $page ? $page : $this->page;
        return $this->pageArr[$page];
    }

    function cutStr(){
        $str_len_word = strlen($this->content);     //获取使用strlen得到的字符总数
        $i = 0;
        if ($str_len_word<=$this->page_word){   //如果总字数小于一页显示字数
            $page_arr[$i] = $this->content;
        }else{
            if (strpos($this->content, $this->cut_custom)){
                $page_arr = explode($this->cut_custom, $this->content);
            }else{
                $str_first = substr($this->content, 0, $this->page_word);   //0-page_word个文字    cutStr为func.global中的函数
                foreach ($this->cut_tag as $v){
                    $cut_start = strrpos($str_first, $v);       //逆向查找第一个分页符的位置
                    if ($cut_start){
                        $page_arr[$i++] = substr($this->content, 0, $cut_start).$v;
                        $cut_start = $cut_start + strlen($v);
                        break;
                    }
                }
                if (($cut_start+$this->page_word)>=$str_len_word){  //如果超过总字数
                    $page_arr[$i++] = substr($this->content, $cut_start, $this->page_word);
                }else{
                    while (($cut_start+$this->page_word)<$str_len_word){
                        foreach ($this->cut_tag as $v){
                            $str_tmp = substr($this->content, $cut_start, $this->page_word);        //取第cut_start个字后的page_word个字符
                            $cut_tmp = strrpos($str_tmp, $v);       //找出从第cut_start个字之后，page_word个字之间，逆向查找第一个分页符的位置
                            if ($cut_tmp){
                                $page_arr[$i++] = substr($str_tmp, 0, $cut_tmp).$v;
                                $cut_start = $cut_start + $cut_tmp + strlen($v);
                                break;
                            }
                        }
                    }
                    if (($cut_start+$this->page_word)>$str_len_word){
                        $page_arr[$i++] = substr($this->content, $cut_start, $this->page_word);
                    }
                }
            }
        }
        $this->sum_page = count($page_arr);     //总页数
        $this->pageArr = $page_arr;
        return $page_arr;
    }

    //显示上一条，下一条
    function pageNav(){
        $str = '<div class="pages"><ul>';

        for($i = 1; $i <= $this->sum_page; $i++){
            if($i == $this->page) {
                $str.= "<li><span class='current'>".$i."</span></li>";
            }else{
                $str.= "<li><a class='num' href='". str_replace("{PAGE}",$i,$this->url) ."'>".$i."</a></li>";
            }
        }

        return $str . "</ul></div>";
    }
    function showPrvNext2(){
        $str = '<div class="pages"><ul>';

        if ($this->sum_page>1 and $this->page>1){
            $str.= "<li><a href='". str_replace("{PAGE}",$this->page-1,$this->url) ."'>上一页</a></li>";
        }
        if ($this->sum_page>1 and $this->page<$this->sum_page){
            $str .= "<li><a href='". str_replace("{PAGE}",$this->page+1,$this->url) ."'>下一页</a></li>";
        }
        return $str . "</ul></div>";
    }

    function showPageSelect(){
        if ($this->sum_page>1){
            $str = "   <select onchange='location.href=this.options[this.selectedIndex].value'>";
            for ($i=1; $i<=$this->sum_page; $i++){
                $str.= "<option value='". str_replace("{PAGE}",$i,$this->url) ."' ".(($this->page)==$i ? " selected='selected'":"").">第".$i."页</option>";
            }
            $str.= "</select>";
        }
        return $str;
    }
    function showPageSelectWap(){
        if ($this->sum_page>1){
            $str = "<select value='".($this->page-1)."'>";
            for ($i=1; $i<=$this->sum_page; $i++){
                $str.= "<option onpick='". str_replace("{PAGE}",$i,$this->url) ."'>第".$i."节</option>";
            }
            $str.= "</select>";
        }
        return $str;
    }
}