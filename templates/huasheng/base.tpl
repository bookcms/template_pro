<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    <link href="/favicon.ico" rel="shortcut icon" />
    {block name="mip"}{/block}
    {block name="header"}{/block}
    <script src="/static/js/uaredirect.js" type="text/javascript"></script>
    {block name="uaredirect"}{/block}
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css" />
    <link href="__CSS__/base.css" rel="stylesheet" type="text/css" />
    <link href="__CSS__/pc.css" rel="stylesheet" type="text/css" />
</head>
<body {block name="body_class"}{/block}>
<!--header-->
<div class="header {block name="chapter_header"}{/block}">
    <div class="inner">
        <div class="logo"><a href="{$site_config.site_domain}"><img src="__IMAGES__/logo.png" alt="{$site_config.site_name}"></a></div>
        <div class="nav">
            <ul class="clearfix">
                <li {eq name="$current_page" value="home" }class="on"{/eq}><a href="{$site_config.site_domain}">首页</a></li>
                <li {eq name="$current_page" value="news" }class="on"{/eq}><a href="{:url("/news")}">资讯</a></li>
                <li {eq name="$current_page" value="classify" }class="on"{/eq}><a href="{:url("/classify")}">小说库</a></li>
                <li {eq name="$current_page" value="full" }class="on"{/eq}><a href="{:url("/full")}">全本</a></li>
                <li {eq name="$current_page" value="top" }class="on"{/eq}><a href="{:url("/top")}">排行榜</a></li>
            </ul>
        </div>
        <div class="search">
            <form  method="get" name="search"  action="{:url("/search")}">
                <input type="text" name="k" id="q"  placeholder="请输入书名/作者/标签" class="search-key">
                <button type="submit" class="search-btn" id="search-btn">搜索</button>
            </form>
        </div>
        <div class="other">
            <a class="link-wap" href="{$site_config.mobile_domain}">手机版</a>
            <a class="link-bookshelf" href="javascript:void(0);">书架</a>
        </div>
    </div>
</div>
<!--/header-->
{block name="body"}{/block}
<!--footer-->
<div class="footer">
    <div style="display: none"><?php echo $site_config['extend']['pc_tong_ji']?></div>
    <p><a href="{$site_config.site_domain}" rel="index">{$site_config.site_name}</a>所有内容使用搜索引擎转码技术抓取自网络，如有侵犯版权，请来信告知，本站立即处理。</p>
    <p>Powered by BookCMS v{$site_config.version} Copyright © 2018-{:date('Y')} <a href="{$site_config.site_domain}" rel="index">{$site_config.site_name}</a> All rights reserved.</p>
</div>
<!--/footer-->
<script type="text/javascript" src="/static/layui/layui.js"></script>
<script type="text/javascript">
    layui.config({
        base: '/static/layui/modules/'
    });
</script>
<script src="__JS__/function.js"></script>
{block name="footer"}{/block}
<div style="display: none">
    <?php echo $site_config['extend']['pc_tong_ji']; ?>
</div>
</body>
</html>