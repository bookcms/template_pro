<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=utf-8"/>
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">

    <link rel="shortcut icon" href="/favicon.ico"/>
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="max-age=0"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="MobileOptimized" content="240"/>
    <meta name="applicable-device" content="mobile"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <link rel="canonical" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_value($novel.chapter['Sort']),"","html","www")}"/>
    <link rel="stylesheet" type="text/css" href="__CSS__/read.css"/>
    <script type="text/javascript" src="__JS__/zepto.js"></script>
    <script src="__JS__/common.js"></script>
</head>
<body id="nr_body" class="nr_all c_nr">
<div class="header" id="_bqgmb_head">
    <div class="back"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">返回</a></div>
    <h1 id="_bqgmb_h1">{$novel['Title']}</h1>
    <div class="back_r"><a href="/">首页</a></div>
    <script>fixwidth();</script>
</div>
<div class="nr_set">
    <div id="lightdiv" class="set1" onclick="nr_setbg('light')">关灯</div>
    <div id="huyandiv" class="set1" onclick="nr_setbg('huyan')">护眼</div>
    <div class="set2">
        <div>字体：</div>
        <div id="fontbig" onclick="nr_setbg('big')">大</div>
        <div id="fontmiddle" onclick="nr_setbg('middle')">中</div>
        <div id="fontsmall" onclick="nr_setbg('small')">小</div>
    </div>
    <div class="cc"></div>
</div>
<div class="nr_title" id="nr_title">{$novel.chapter['Title']}{$novel.chapter.page_str}</div>
<div class="nr_page">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td class="prev">{neq name="$novel.pre_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" target="_top" class="pre" >上一章</a>{else/}<a href="javascript:void(0)" class="pre no_pre_chapter" >暂无上一章</a>{/neq}</td>
            <td class="mulu"><a href="{:url('/book_list/' . $novel['PrimaryId'],'html',true)}">返回目录</a></td>
            <td class="next">{neq name="$novel.next_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}" rel="next">下一章</a>{else/}<a href="javascript:void(0)" class="no_next_chapter" rel="next">暂无下一章</a>{/neq}</td>
        </tr>
    </table>
</div>
<div id="nr" class="nr_nr">
    <div id="nr1">
        <?php echo $novel['chapter']['content'];?>
    </div>
    <div class="clear"></div>
    <?php echo $showPage;?>
</div>
<div class="nr_page">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td class="prev">{neq name="$novel.pre_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" target="_top" class="pre" >上一章</a>{else/}<a href="javascript:void(0)" class="pre no_pre_chapter" >暂无上一章</a>{/neq}</td>
            <td class="mulu"><a href="{:url('/book_list/' . $novel['PrimaryId'],'html',true)}">返回目录</a></td>
            <td class="next">{neq name="$novel.next_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}" rel="next">下一章</a>{else/}<a href="javascript:void(0)" class="no_next_chapter" rel="next">暂无下一章</a>{/neq}</td>
        </tr>
    </table>
</div>

<div class="footer">
    <ul>
        <li><a href="{$site_config.mobile_domain}">首页</a></li>
        <li><a href="{$site_config.site_domain}">电脑版</a></li>
        <li><a href="{:url('/bookcase')}">书架</a></li>
    </ul>
</div>
<script src="__STATIC__/layui/layui.js" type="text/javascript"></script>
<script>
    var source_flag  = "{$novel.chapter.source_flag | base64_encode}";
    var article_id  = "{$novel.PrimaryId}";
    var chapter_id   = "{:get_offset_value($novel.chapter.Sort)}";
</script>
<script>
    layui.use(['layer', 'jquery'], function () {
        var layer = layui.layer;
        var $ = layui.jquery;

        //更新当前章节阅读位置
        $.post("{:url('/user/update_book')}", {article_id:article_id,chapter_id:chapter_id,flag:source_flag});

        $(".no_pre_chapter").on("click",function () {
            layer.msg("暂无上一章");
        });
        $(".no_next_chapter").on("click",function () {
            layer.msg("暂无下一章");
        });
    });
</script>

</body>
</html>
