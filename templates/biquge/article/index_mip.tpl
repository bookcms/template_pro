{extend name="base_mip" /}
{block name="mip"}
    {include file="mip" /}
{/block}

{block name="header"}
    <link rel="canonical" href="{:url("/book/" . $novel['PrimaryId'],"","html","www")}"/>
    <link rel="stylesheet" type="text/css" href="{$site_config.mobile_domain}__CSS__/sort.css"/>
{/block}
{block name="body"}
<div class="cover">
    <div class="block">
        <div class="block_img2"><mip-img alt="{$novel.Title}" src="{$novel.LocalImage | down_image}" border="0" width='85' height='120'/></div>
        <div class="block_txt2">
            <h2>{$novel.Title}</h2>
            <p>作者：{$novel.Author}</p>
            <p>分类：{$novel.category.name}</p>
            <p>状态：{eq name="$novel.Full" value="1"}完结{else/}连载中{/eq}</p>
            <p>更新：{$novel.UpdateTime | date="Y-m-d H:i:s"}</p>
            {if count($novel.chapter_list) > 0}
            <p>最新：<a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html","m")}">{$novel.last_update_chapter_list[0]['Title']}</a></p>
            {/if}
        </div>
    </div>

    <div class="ablum_read">
        <span class="margin_right"><a href="{:url("/book_list/" . $novel['PrimaryId'],"","html",true)}">开始阅读</a></span>
    </div>
    <div class="intro" id="intro" name="intro">{$novel.Title}小说简介</div>
    <div class="intro_info">{$novel.Introduction}</div>
    <div class="intro">{$novel.Title}最新章节</div>
    <ul class="chapter">
        {foreach $novel.last_update_chapter_list as $chapter}
        <li> <a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html","m")}">{$chapter.Title}</a></li>
        {/foreach}
    </ul>
    <div class="intro"><a href="{:url("/book_list/" . $novel['PrimaryId'],"","html","m")}">查看完整目录</a></div>

</div>
{/block}
{block name="footer"}

{/block}
