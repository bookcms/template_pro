<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    <meta name="applicable-device" content="pc">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta http-equiv="Cache-Control" content="no-transform " />
    <meta http-equiv="mobile-agent" content="format=html5; url='{$site_config.mobile_domain}'" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    {block name="mip"}{/block}
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css" />
    <script src="__JS__/uaredirect.js" type="text/javascript"></script>
    {block name="uaredirect"}{/block}
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/pc.css">
    {block name="header"}{/block}
</head>
<body {block name="body_class"}{/block}>
<div class="header">
    <div class="layui-main">
        <a class="logo" href="{$site_config.site_domain}" title="{$site_config.site_name}_免费在线读书网_TXT免费下载"><i class="iconfont icon-logo"></i>{$site_config.site_name}</a>

        {if session('login_token') != null}
        <a class="history" href="{:url('/login/logout')}">退出登录</a> &nbsp; | &nbsp;  <a class="history" href="{:url('/user/index')}">用户中心</a>
        {else/}
        <a class="history" href="{:url('/login/index')}">用户登录</a>
        {/if}

        <ul class="nav">
            <li {eq name="$current_page" value="home"}class="on"{/eq}><a href="{$site_config.site_domain}" title="{$site_config.site_name}_免费在线读书网_TXT免费下载">首页</a></li>
            <li {eq name="$current_page" value="category"}class="on"{/eq}><a href="{:url('/classify/all')}" title="书库大全">书库大全</a></li>
            <li {eq name="$current_page" value="top"}class="on"{/eq}><a href="{:url('/top')}" title="排行榜">排行榜</a></li>
            <li {eq name="$current_page" value="full"}class="on"{/eq}><a href="{:url('/full')}" title="完本">完本小说</a></li>
        </ul>
        <form action="{:url('/search')}" class="search">
            <input type="text" name="keyword" placeholder="请输入搜索内容！" autocomplete="off">
            <button type="submit" class="layui-icon i_search"></button>
        </form>
    </div>
</div>
{block name="body"}{/block}
<div class="footer">
    <p><a href="{$site_config.site_domain}" rel="index">{$site_config.site_name}</a>所有内容使用搜索引擎转码技术抓取自网络，如有侵犯版权，请来信告知，本站立即处理。</p>
    <p>Powered by BookCMS v{$site_config.version} Copyright © 2018-{:date('Y')} <a href="{$site_config.site_domain}" rel="index">{$site_config.site_name}</a> All rights reserved.</p>
</div>
<script type="text/javascript" src="__STATIC__/js/common_pc.js"></script>
{block name="footer"}{/block}
<div style="display: none">
    <?php echo $site_config['extend']['pc_tong_ji']; ?>
</div>
</body>
</html>