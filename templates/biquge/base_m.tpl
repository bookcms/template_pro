<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=utf-8"/>
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="max-age=0"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta name="MobileOptimized" content="240"/>
    <meta name="applicable-device" content="mobile"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent"/>
    <link rel="shortcut icon" href="/favicon.ico"/>
    {block name="mip"}{/block}
    {block name="header"}{/block}
    <link rel="stylesheet" type="text/css" href="__CSS__/mobile.css"/>
    <script src="__JS__/wap.js"></script>
</head>
<body>
<div class="header">
    <div class="logo"><a href="{$site_config.mobile_domain}" title="{$site_config.site_name}">{$site_config.site_name}移动版</a></div>
    <div class="reg"><div id="login_top"></div></div>
</div>
<div class="nav">
    <ul>
        <li><a href="{:url('/sort')}">分类</a></li>
        <li><a href="{:url('/last_insert')}">新书</a></li>
        <li><a href="{:url('/full')}">全本</a></li>
        <li><a href="{:url('/ranking')}">排行榜</a></li>
        <li><a href="{:url('/user/rack_list')}">书架</a></li>
        <div class="cc"></div>
    </ul>
</div>

<div class="search">
    <form name="articlesearch" action="{:url('/search')}">
        <table cellpadding="0" cellspacing="0" style="width:100%;">
            <tr>
                <td style="background-color:#fff; border:1px solid #CCC;"><input style="height:20px;line-height:20px;" id="s_key" name="keyword" type="text" class="key" value="输入书名后搜索，宁可少字不要错字" onFocus="this.value=''"/></td>
                <td style="width:35px; background-color:#0080C0; background-image:url('__IMAGES__/search.png'); background-repeat:no-repeat; background-position:center"><input type="submit" value="" class="go"></td>
            </tr>
        </table>
    </form>
</div>

{block name="body"}{/block}

<div class="footer">
    <ul>
        <li><a href="{$site_config.mobile_domain}">首页</a></li>
        <li><a href="{$site_config.site_domain}">电脑版</a></li>
        <li><a href="{:url('/user/index')}">用户中心</a></li>
    </ul>
</div>
<script src="__STATIC__/layui/layui.js" type="text/javascript"></script>
<script src="__STATIC__/js/languages.js" type="text/javascript"></script>
<script type="text/javascript" src="__JS__/svg.js"></script>
{block name="footer"}{/block}
<div style="display: none">
    <?php echo $site_config['extend']['m_tong_ji']; ?>
</div>
</body>
</html>
