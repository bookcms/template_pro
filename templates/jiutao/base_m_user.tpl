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
    <link href="//cdn.bootcss.com/weui/1.1.2/style/weui.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/user_m.css">
    {block name="header"}{/block}
</head>

<body>
<div class="wrapper">
    {block name="body"}{/block}
    <!-- footer -->
    <div class="footer">
        <div class="copyright">&copy; {$site_config.site_name}</div>
    </div>
</div>
<script src="__STATIC__/layui/layui.js" type="text/javascript"></script>
{block name="footer"}{/block}
<div style="display: none">
    <?php echo $site_config['extend']['m_tong_ji']; ?>
</div>
</body>
</html>