<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    {block name="mip"}{/block}
    <link rel="stylesheet" href="/static/layui/css/layui.css"/>
    <link rel="stylesheet" href="__CSS__/style.css"/>
    {block name="header"}{/block}
    <script src="/static/js/uaredirect.js" type="text/javascript"></script>
    {block name="uaredirect"}{/block}
    <script type="text/javascript" src="__JS__/header.js"></script>
</head>
<body>
<div id="wrapper">
    <div class="ywtop">
        <div class="ywtop_con">
            <div class="ywtop_sethome">
                <a target="_blank" href="{:url('/desktop')}">将{$site_config.site_name}快捷键下载到桌面</a>
            </div>
            <div class="ywtop_addfavorite">
                <a href="javascript:window.external.addFavorite('{$site_config.site_domain}','{$site_config.site_name}_书友最值得收藏的网络小说阅读网')">收藏笔趣阁</a>
            </div>
            <div class="nri">
                <div class="txtt">

                    {if session('login_token') != null}
                        <a href="{:url('/user/index')}">用户中心</a>&nbsp;|&nbsp; <a href="{:url('/login/logout')}">退出登录</a>
                    {else/}
                        <a href="{:url('/login/index')}">用户登录</a>&nbsp;|&nbsp;<a href="{:url('/login/reg')}">用户注册</a>
                    {/if}

                </div>
            </div>
        </div>
    </div>
    <div class="header">
        <div class="header_logo">
            <a href="{$site_config.site_domain}" title="{$site_config.site_name}"><img src="__IMAGES__/logo.png" alt="{$site_config.site_name}"></a>
        </div>
        <script>panel();</script>
    </div>
    <div class="nav">
        <ul>
            <li><a {eq name="$current_cate.alias" value="home"}class="current"{/eq} href="{$site_config.site_domain}">首页</a></li>
            {foreach $site_config.category_list as $category_nav}
            {if !in_array($category_nav.cid,[])}
            <li><a {eq name="$current_cate.alias" value="$category_nav.alias"}class="current"{/eq} href="/{$category_nav.alias}" target="_self">{$category_nav.name}</a></li>
            {/if}
            {/foreach}
            <li><a {eq name="$current_cate.alias" value="ranking"}class="current"{/eq} href="{:url('/top')}" target="_self" title="{$site_config.site_name}-排行榜">排行榜</a></li>
            <li><a {eq name="$current_cate.alias" value="full"}class="current"{/eq} href="{:url('/full')}" target="_self">全本</a></li>
<!--            <li><a {eq name="$current_cate.alias" value="bookcase"}class="current"{/eq} href="{:url('/bookcase')}" target="_self" title="{$site_config.site_name}-临时书架">临时书架</a></li>-->
        </ul>
    </div>
    {block name="body"}{/block}
</div>
<div id="footer">
    <p>
        <a href="{$site_config.site_domain}" rel="index">{$site_config.site_name}</a>所有内容使用搜索引擎转码技术抓取自网络，如有侵犯版权，请来信告知，本站立即处理。<br>
        Powered by BookCMS Copyright © 2018-{:date('Y')} <a href="{$site_config.site_domain}" rel="index">{$site_config.site_name}</a> All rights reserved.
    </p>
</div>
<script src="/static/layui/layui.js" type="text/javascript"></script>
<script src="__STATIC__/js/languages.js" type="text/javascript"></script>
{block name="footer"}{/block}
<div style="display: none">
    <?php echo $site_config['extend']['pc_tong_ji']; ?>
</div>
</body>
</html>