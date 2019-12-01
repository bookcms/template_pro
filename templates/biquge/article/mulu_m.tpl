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
    <link rel="stylesheet" type="text/css" href="__CSS__/list.css"/>
</head>
<body>
<div class="header" id="bqgmb_head">
    <div class="back"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">返回</a></div>
    <h1 id="bqgmb_h1">{$novel.Title}</h1>
    <div class="back_r"><a href="/">首页</a></div>
</div>
    <script>fixwidth();</script>
    <div style="margin-top:0px;padding-top:0px;" class="cover">
        <div id="intro" style="width:100%;margin-top:0px;padding-top:0px;" class="intro">{$novel.Title}章节列表 <span style="float:right;padding-right:10px;"><a href="#bottom" style="color:Red;">↓直达页面底部</a></span></div>
        <ul class="chapter">
            {foreach $novel.chapter_list as $chapter}
            <li><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></li>
            {/foreach}
        </ul>

        <div id="bottom" class="read">
            <?php echo $pages;?>
            {eq name="$pages" value=""}
            <h3>列表结束！（底部）</h3>
            <span><a href="#intro">[返回顶部]</a></span>
            {/eq}
        </div>
    </div>

    <div class="footer">
        <ul>
            <li><a href="{$site_config.mobile_domain}">首页</a></li>
            <li><a href="{$site_config.site_domain}">电脑版</a></li>
            <li><a href="{:url('/bookcase')}">书架</a></li>
        </ul>
    </div>
<script src="__JS__/common.js"></script>
</body>
</html>
