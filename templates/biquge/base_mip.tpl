<!DOCTYPE html>
<html mip>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="max-age=0"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="MobileOptimized" content="240"/>
    <meta name="applicable-device" content="mobile"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    {block name="mip"}{/block}
    {block name="header"}{/block}
    <link rel="stylesheet" type="text/css" href="{$site_config.mobile_domain}__CSS__/mobile.css"/>
	<link rel="stylesheet" type="text/css" href="https://c.mipcdn.com/static/v2/mip.css">
</head>
<body>
<div class="header">
    <div class="logo"><a href="{$site_config.mobile_domain}" title="{$site_config.site_name}">{$site_config.site_name}移动版</a></div>
    <div class="reg"><div id="login_top"></div></div>
</div>
<div class="nav">
    <ul>
        <li><a href="{$site_config.mobile_domain}{:url('/sort')}">分类</a></li>
        <li><a href="{$site_config.mobile_domain}{:url('/last_insert')}">新书</a></li>
        <li><a href="{$site_config.mobile_domain}{:url('/full')}">全本</a></li>
        <li><a href="{$site_config.mobile_domain}{:url('/top')}">排行榜</a></li>
        <li><a href="{$site_config.mobile_domain}{:url('/user/rack_list')}">书架</a></li>
        <div class="cc"></div>
    </ul>
</div>


{block name="body"}{/block}

<div class="footer">
    <ul>
        <li><a href="{$site_config.mobile_domain}">首页</a></li>
        <li><a href="{$site_config.site_domain}">电脑版</a></li>
        <li><a href="{:url('/user/index')}">用户中心</a></li>
    </ul>
</div>
{block name="footer"}{/block}
<mip-stats-baidu>
    <script type="application/json">
        {
            "token": "",
            "_setCustomVar": [1, "login", "1", 2],
            "_setAutoPageview": [true]
        }
    </script>
</mip-stats-baidu>
<script src="https://c.mipcdn.com/static/v2/mip.js"></script>
</body>
</html>
