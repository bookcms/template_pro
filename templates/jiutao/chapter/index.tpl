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
    <meta http-equiv="mobile-agent" content="format=html5; url={:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),"","html","m")}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),"","html","m")}" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link href="/static/layui/css/layui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/pc.css">
    <script src="__JS__/uaredirect.js" type="text/javascript"></script>
    <script type="text/javascript">uaredirect("{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),array(),"html","m")}");</script>
</head>
<body id="chapter" article-id="{$novel.PrimaryId}" zz-id="{:url('/author/' . urlencode($novel.Author))}"  chapter-id="{:get_offset_sort($novel['chapter']['Sort'])}" data-id="{$novel.LocalImage | down_image}" ondragstart="return false;" oncopy="return false;" oncut="return false;" oncontextmenu="return false;">
<div class="header">
    <div class="layui-main">
        <a class="logo" href="{$site_config.site_domain}"><i class="iconfont icon-logo"></i>{$site_config.site_name}</a>
        <a class="history" href="{:url('/user/rack_list')}"><i class="layui-icon i_history"></i>阅读历史</a>
        <ul class="nav">
            <li {eq name="$current_cate.alias" value="home"}class="on"{/eq}><a href="{$site_config.site_domain}" title="{$site_config.site_name}_免费在线读书网_TXT免费下载">首页</a></li>
            <li {eq name="$current_cate.alias" value="classify"}class="on"{/eq}><a href="{:url('/classify')}" title="书库大全">书库大全</a></li>
            <li {eq name="$current_cate.alias" value="ranking"}class="on"{/eq}><a href="{:url('/top')}" title="排行榜">排行榜</a></li>
            <li {eq name="$current_cate.alias" value="full"}class="on"{/eq}><a href="{:url('/full')}" title="完本">完本</a></li>
        </ul>
        <form action="{:url('/search')}" class="search" >
            <input type="text" name="keyword" placeholder="请输入搜索内容！" autocomplete="off">
            <button type="submit" class="layui-icon i_search"></button>
        </form>
    </div>
</div>
<div class="main">
    <div class="layui-main">
        <div class="box">
            <div class="path"><a href="{$site_config.site_domain}" class="layui-icon i_home"></a><i>&gt;</i><a href="{:url("/" . $novel.category.alias,"","",true)}">{$novel.Cid | show_cid_name}</a><i>&gt;</i><a href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}">{$novel.Title}</a><i>&gt;</i><a href="{:url("/mulu/" . $novel['PrimaryId'],array(),"html",true)}">最新章节列表</a></div>
        </div>
        <div class="area">
<!--            <div class="nr_title" id="nr_title">-->
<!--	            <span class="xialas">换源:-->
<!--		            <select onchange="window.location=this.value;">-->
<!--                           <option value="javascript:void(0);" title="{$novel.Title} 八一中文 第一千五百九十五章 没有选择（下午做点儿什么吃呢？）">八一中文</option>-->
<!--                           <option value="/7_L65133.html" title="{$novel.Title} 新笔趣阁 第一千五百九十五章 没有选择（下午做点儿什么吃呢？）">新笔趣阁</option>-->
<!--                    </select>-->
<!--		        </span>-->
<!--            </div>-->
            <h1>{$novel.chapter['Title']}{$novel.chapter.page_str}</h1>
            <div class="light">
                作品：<a id="bookname" href="{:url('/book/' .$novel['PrimaryId'])}">{$novel.Title}</a><i>|</i>
                作者：<a id="author" href="{:url('/author/' . urlencode($novel.Author))}">{$novel.Author}</a><i>|</i>
                分类：<a href="{:url("/" . $novel.category.alias,"","",true)}">{$novel.Cid | show_cid_name}</a><i>|</i>
                更新：{$novel.UpdateTime | date="Y-m-d H:i"}<i>|</i>
                下载：<a href="{:url('/txt/' .$novel['PrimaryId'],'','html',true)}" title="{$novel.Title} TXT下载">{$novel.Title}TXT下载</a>
            </div>
            <div id="content">
                <?php echo $novel['chapter']['content'];?>
            </div>
            <div class="page">
                {neq name="$novel.pre_chapter" value=""}
                <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}">上一章【快捷键：←】</a>
                {else/}
                <a href="javascript:void(0)">暂无上一章【快捷键：←】</a>
                {/neq}
                <a href="{:url('/mulu/' .$novel['PrimaryId'],'','html',true)}">目 录【快捷键：Enter】</a>
                {neq name="$novel.next_chapter" value=""}
                <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}">下一章【快捷键：→】</a>
                {else/}
                <a id="page2" href="javascript:void(0)">暂无下一章【快捷键：→】</a>
                {/neq}

            </div>
        </div>
    </div>
</div>
<div class="footer">
    <p>Copyright &copy; 2018-{:date('Y')} <a href="{$site_config.site_domain}">{$site_config.site_name}</a> All Rights Reserved</p>
</div>

<ul id="setting" class="hide" style="display: none;">
    <li class="theme"><p>主题模式：</p><a class="day on"></a><a class="night"></a><a class="pink"></a><a class="yellow"></a><a class="blue"></a><a class="green"></a><a class="gray"></a></li>
    <li class="style"><p>字体样式：</p><a class="yahei on">雅黑</a><a class="songti">宋体</a><a class="kaishu">楷书</a></li>
    <li class="size"><p>字体大小：</p><a class="iconfont icon-dec"></a><a class="num">18</a><a class="iconfont icon-inc"></a></li><li class="default"><p></p><a>恢复默认</a></li>
</ul>
<ul class="bar left_bar">
    <li><a class="iconfont icon-read" href="{:url('/mulu/' .$novel['PrimaryId'],'','html')}">目录</a></li>
    <li><a class="iconfont icon-setting" href="javascript:void(0)">设置</a></li>
    <li><a class="iconfont icon-info" href="{:url('/book/' .$novel['PrimaryId'],'','html')}">详情</a></li>
    <li><a class="iconfont icon-tingshu" href="javascript:void(0)">朗读</a></li>
</ul>
<ul class="bar right_bar">
<!--    <li><a class="layui-icon i_phone" href="javascript:void(0)" onclick="phone()">手机</a></li>-->
<!--    <li><a class="layui-icon i_mark" href="javascript:void(0)" onclick="mark(7)">书架</a></li>-->

    {neq name="$novel.pre_chapter" value=""}
    <a class="layui-icon i_prev" href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}"></a>
    {else/}
    <li><a class="layui-icon i_prev" href="javascript:void(0)"></a></li>
    {/neq}

    {neq name="$novel.next_chapter" value=""}
    <a class="layui-icon i_next" href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}"></a>
    {else/}
    <li><a class="layui-icon i_next" href="javascript:void(0)"></a></li>
    {/neq}

    <li><a class="iconfont icon-top" href="#"></a></li>
</ul>
<script type="text/javascript" src="__STATIC__/js/common_pc.js"></script>
</body>
</html>
