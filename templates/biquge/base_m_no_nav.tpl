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
    <a href="javascript:history.go(-1);" class="iconback"><svg class="lnr lnr-chevron-left-circle"><use xlink:href="#lnr-chevron-left-circle"></use></svg></a>
    <div class="right">
        <a href="/" class="iconhome">
            <svg class="lnr lnr-home"><use xlink:href="#lnr-home"></use></svg>
        </a>
    </div>
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
