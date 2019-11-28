{extend name="base_m" /}
{block name="mip"}
    {include file="mip" /}
{/block}

{block name="header"}
    <link rel="canonical" href="{:url("/book/" . $novel['PrimaryId'],"","html","www")}"/>
    <link rel="stylesheet" type="text/css" href="__CSS__/sort.css"/>
    <script src="__JS__/common.js"></script>
{/block}
{block name="body"}
<div class="cover">
    <div class="block">
        <div class="block_img2"><img alt="{$novel.Title}" src="{$novel.LocalImage | down_image}" border="0" width='85' height='120' onerror="this.src='__IMAGES__/nopic.gif'"/></div>
        <div class="block_txt2">
            <h2>{$novel.Title}</h2>
            <p>作者：{$novel.Author}</p>
            <p>分类：{$novel.category.name}</p>
            <p>状态：{eq name="$novel.Full" value="1"}完结{else/}连载中{/eq}</p>
            <p>更新：{$novel.UpdateTime | date="Y-m-d H:i:s"}</p>
            {if count($novel.chapter_list) > 0}
            <p>最新：<a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.last_update_chapter_list[0]['Title']}</a></p>
            {/if}
        </div>
    </div>

    <div style="clear:both"></div>
    <div class="ablum_read">
        <span style="background:#FFFFFF;float:left;width:3%"></span>
        <span class="margin_right"><a href="{:url("/book_list/" . $novel['PrimaryId'],"","html",true)}">开始阅读</a></span>
        <span class="margin_right"> <a href="javascript:void(0);" class="add-book" data-type="rack" data-id="{$novel.PrimaryId}" >加入书架</a></span>
        <span>    <a href="javascript:void(0);" class="add-book" data-type="collect" data-id="{$novel.PrimaryId}" >加入收藏</a> </span>
    </div>
    <div class="intro" id="intro" name="intro">{$novel.Title}小说简介</div>
    <div class="intro_info">{$novel.Introduction}</div>
    <div class="intro">{$novel.Title}最新章节</div>
    <ul class="chapter">
        {foreach $novel.last_update_chapter_list as $chapter}
        <li> <a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></li>
        {/foreach}
    </ul>
    <div class="intro"><a href="{:url("/book_list/" . $novel['PrimaryId'],"","html",true)}">查看完整目录</a></div>

</div>
{/block}
{block name="footer"}
<script src="__STATIC__/js/bookcase.js"></script>
<script id="chapter_html" type="text/html">
    <dd><a href="{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html" target="_blank">{title}</a></dd>
</script>
<script id="new_chapter_html" type="text/html">
    <li><a href="{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html" target="_blank">{title}</a></li>
</script>
<script>
    var primary_id = "{$novel.PrimaryId}";
    var article_url = "{$novel.SourceUrl | base64_encode}";
    var last_chapter_url = "{$last_chapter.Url | base64_encode}";
    var last_chapter_sort = "{:get_offset_value($last_chapter.Sort)}";
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";

    layui.use(['layer', 'jquery'], function () {
        var layer = layui.layer;
        var $ = layui.jquery;

        $(".add-book").click(function () {
            var id = $(this).data('id');
            var type = $(this).data('type');
            $.post("{:url('/user/add_book')}", {id:id,type:type},function (info) {
                if (info.code == 0) {
                    layer.msg(info.msg + ",加入成功");
                } else {
                    layer.msg(info.msg + ",加入失败");
                }
            });
        });
    });
</script>
<script src="__STATIC__/js/details_m.js"></script>
{/block}
