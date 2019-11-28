<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>{$site_seo.title}</title>
    <meta name="keywords" content="{$site_seo.keywords}">
    <meta name="description" content="{$site_seo.description}">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=0">
    <meta name="format-detection" content="telephone=no,email=no,address=no">
    <meta name="applicable-device" content="mobile">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="__CSS__/chapter_m.css">

</head>
<body id="chapter" article-id="{$novel.PrimaryId}" chapter-id="{$novel.chapter.Sort}" data-id="228124">
<div class="header">
    <i class="layui-icon i_back"></i>
    <p id="bookname">{$novel.Title}</p>
    <p id="author">{$novel.Author}</p>
</div>
<div id="main">
    <div class="path">
        <a href="{$site_config.site_domain}" class="layui-icon i_home"></a> &gt;
        <a href="{:url('/book/' .$novel['PrimaryId'],'','html',true)}">{$novel.Title}</a> &gt;
        <a href="{:url('/mulu/' .$novel['PrimaryId'],'','html',true)}">{$novel.Title}目录</a>
    </div>
    <h1 class="headline">{$novel.chapter['Title']}{$novel.chapter.page_str}</h1>
    <div class="pager">
        {neq name="$novel.pre_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" >上一章</a>{else/}<a href="javascript:void(0)" >暂无上一章</a>{/neq}
        <a href="{:url('/mulu/' .$novel['PrimaryId'],'','html',true)}">目 录</a>
        {neq name="$novel.next_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}">下一章</a>{else/}<a href="javascript:void(0)" >暂无下一章</a>{/neq}
    </div>
    <div class="content">
        <?php echo $novel['chapter']['content'];?>
    </div>
    <div class="pager">
        {neq name="$novel.pre_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" >上一章</a>{else/}<a href="javascript:void(0)" >暂无上一章</a>{/neq}
        <a href="{:url('/mulu/' .$novel['PrimaryId'],'','html',true)}">目 录</a>
        {neq name="$novel.next_chapter" value=""}<a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}">下一章</a>{else/}<a href="javascript:void(0)" >暂无下一章</a>{/neq}
    </div>
</div>
<script type="text/javascript" src="__JS__/chapter_m.js?v=0.1"></script>
<script>
    var update_url  = "{:url('/user/update_book')}";
    var novel_flag  = "{$novel.chapter.source_flag | base64_encode}";
    var novel_id  = "{$novel.PrimaryId}";
    var novel_chapter_id   = "{:get_offset_value($novel.chapter.Sort)}";
</script>

<div class="footer">
    <p>
        <a href="{$site_config.site_domain}">首页</a>|
        <a href="{:url('/ranking')}">排行榜</a>|
        <a href="{:url('/author/' . urlencode($novel.Author))}">{$novel.Author}</a>|
        <a href="{:url('login/index')}">用户中心</a>
    </p>
    <p>Copyright &copy;2018-{:date('Y')} <a href="{$site_config.site_domain}">{$site_config.site_name}</a></p>
</div>
</body>
</html>