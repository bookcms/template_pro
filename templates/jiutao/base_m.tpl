<!DOCTYPE html>
<html>
<head>
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta name="apple-touch-fullscreen" content="yes" />
    <meta name="applicable-device" content="pc,mobile" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    {block name="mip"}{/block}
    <link rel="stylesheet" href="__CSS__/mobile.css">
    {block name="header"}{/block}
</head>

<body>
<div class="content">
    {block name="nav"}{/block}
    {block name="body"}{/block}
</div>

<a href="{:url('/user/rack_list')}" id="aside-trigger" onclick="setHistoryDiv();" class="readhistory"  title="最近阅读"><span class="btn-circle">最近阅读</span></a>
<a href="javascript:scrollTo(0,0);" class="backtop-circle" title="返回顶部"><svg class="icon icon-backtop"><use xlink:href="#icon-backtop"></use></svg></a>
<div class="footer">
    <div class="footer-link">
        <a href="{:url('/info/about')}">关于网站</a>
        <a href="{:url('/info/disdaimer')}">免责声明</a>
        <a href="{:url('/info/contact')}">意见反馈</a>
        <a href="{$site_config.site_domain}" title="{$site_config.site_name}电脑版">电脑版</a>
    </div>
    <div class="footer-copy">
        &copy; {$site_config.site_name} </div>
</div>

<script type="text/javascript" src="__JS__/svg.js"></script>
<script type="text/javascript" src="__JS__/jqscript.js"></script>
{block name="footer"}{/block}
<div style="display: none">
    <?php echo $site_config['extend']['m_tong_ji']; ?>
</div>

</body>
</html>