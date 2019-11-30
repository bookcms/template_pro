<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=utf-8" />
    <title>排行榜</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <link rel="stylesheet" type="text/css" href="__CSS__/ranking_m.css" />
</head>
<body>
<header class="channelHeader">
    <div class="tabArea tab-navarea">
        <div class="tab-nav tab-nav2 clearfix">
            <h2 style="width: 16%"><a href="{:url('/')}" class="iconback"><svg class="lnr lnr-chevron-left-circle"><use xlink:href="#lnr-chevron-left-circle"></use></svg></a></h2>
            {foreach $ranking_nav_list as $ranking}
            <h2 style="width: 24%"><a href="{:url('/top',array('type' => $ranking['type']))}" {eq name="$type" value="$ranking.type"}class="tab-nav-cur"{/eq} >{$ranking.name}</a></h2>
            {/foreach}
        </div>
    </div>

</header>

<nav class="sortChannel_nav">
    {foreach $site_config.category_list as $category}
    <a {eq name="$cid" value="$category.cid"}class="on"{/eq} href="{:url('/top',array('type' =>$type,'cid' => $category['cid']))}">{$category.name}</a>
    {/foreach}
</nav>
<div class="recommend">
    <div id="main">
        {foreach $ranking_list as $novel}
        <div class="hot_sale">
            <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">
                <img class="lazy" data-original="{$novel.LocalImage | down_image}" src="__IMAGES__/default_cover.svg" onerror="this.src = '/static/images/nopic.gif'">
                <p class="title">{$novel.Title}</p>
                <p class="author">{$novel.Author}</p>
            </a>
            <p class="review">
                <span class="longview"><svg class="lnr lnr-chevron-down-circle"><use xlink:href="#lnr-chevron-down-circle"></use></svg></span>
                简介：{$novel.Introduction}
            </p>
        </div>
        {/foreach}
    </div>

</div>

<div class="footer">
    <ul>
        <li><a href="{$site_config.mobile_domain}">首页</a></li>
        <li><a href="{$site_config.site_domain}">电脑版</a></li>
        <li><a href="{:url('/user/index')}">用户中心</a></li>
    </ul>
</div>

<script language="javascript" type="text/javascript" src="__JS__/lazyload_m.js"></script>
<script type="text/javascript" src="__JS__/svg.js"></script>
<script type="text/javascript" language="javascript">
    $(function () {
        $("img.lazy").lazyload();
    });
</script>
</body>
</html>
