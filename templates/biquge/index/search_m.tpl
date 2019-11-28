{extend name="base_m" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__CSS__/sort.css" />
<script src="__JS__/common.js"></script>
{/block}
{/block}
{block name="body"}

<div class="toptab"><span class="active">搜索小说“{$keyword}”</span></div>
{foreach $list as $novel}
<div class="bookbox">
    <div class="bookimg"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img alt="{$novel.Title}" src="{$novel.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'"></a></div>
    <div class="bookinfo"><h4 class="bookname"><i class="iTit"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></i></h4>
        <div class="author">作者：{$novel.Author}</div>
        <div class="cl0"></div>
        <div class="update"><span>更新至：</span><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.LastChapterTitle}</a></div>
        <div class="cl0"></div>
        <div class="intro_line"><span>简介：</span>{$novel.Introduction}</div>
    </div>
</div>
{/foreach}

{/block}