<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <link rel="canonical" href="{$site_config.mobile_domain}">
    <link href="__CSS__/mobile.css" rel="stylesheet" type="text/css" />
    {block name="mip"}{/block}
    {block name="header"}{/block}
</head>
<body>
{block name="body"}{/block}
<!--footer-->
<div class="footer">
    <div class="links">
        <a href="{$site_config.mobile_domain}">首页</a>
        <a href="{:url("/top","","html",true)}">排行榜</a>
        <a href="{:url("/classify","","html",true)}">小说库</a>
<!--        <a href="{:url("/user","","html",true)}">用户中心</a>-->
    </div>
    <div class="copyright">
        <p><a href="{$site_config.mobile_domain}" rel="index">{$site_config.site_name}</a>所有内容使用搜索引擎转码技术抓取自网络，如有侵犯版权，请来信告知，本站立即处理。</p>
        <p>Powered by BookCMS v{$site_config.version} Copyright © 2018 <a href="{$site_config.site_domain}" rel="index">{$site_config.site_name}</a> All rights reserved.</p>
    </div>
</div>
<!--/footer-->
<div style="display: none"><?php echo $site_config['extend']['m_tong_ji']?></div>
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript" src="__JS__/mobile.js"></script>
<script>
    layui.use(['jquery'], function(){
        var $ = layui.jquery;
        $(function () {
            // $(".icon-search").on("click",function () {
            //     $(".search").toggleClass("show");
            // });
            // $(".icon-menu").on("click",function () {
            //     $(".menu").toggleClass("show");
            // });
        });
    });
</script>
{block name="footer"}{/block}
</body>
</html>