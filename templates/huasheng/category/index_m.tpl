{extend name="base_m" /}
{block name="header"}
{/block}
{block name="body"}
<div class="header">
    <a href="javascript:history.go(-1);"><span class="icon-back"></span></a>
    <h1>{eq name="$current_alias" value="all"}小说大全{else/}{$current_classify.name}小说{/eq}{neq name="$page" value="1"}-当前第{$page}页{/neq}</h1>
    <span class="icon-grouop"><span class="icon-search"></span><span class="icon-menu"></span></span>
</div>
{include file="top_menu" /}

<!--wrap-->
<div class="wrap">
    <!--main-->
    <!-- book-nav -->
    <div class="mod mod-nav">
        <div id="book-nav" class="book-nav">
            <ul class="clearfix">
                {foreach $classify as $item}
                <li {eq name="$item.alias" value="$current_alias"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                {/foreach}
            </ul>
        </div>
    </div>
    <!-- book-subnav -->
    <div class="mod mod-subnav">
        <div class="book-subnav">
            <p>更新时间：</p>
            <ul class="clearfix">
                {foreach $classify_update_times as $item}
                <li {eq name="$item.time" value="$current_update_time"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                {/foreach}
            </ul>
            <p>写作进程：</p>
            <ul class="clearfix">
                {foreach $classify_status as $item}
                <li {eq name="$item.status" value="$current_status"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                {/foreach}
            </ul>
        </div>
    </div>
    <!-- book-list -->
    <div class="mod mod-book">
        <div class="book-list">
            <ul class="clearfix">
                {foreach $list as $novel}
                <li>
                    <img class="pic lazy" src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" />
                    <a class="tit" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <p class="intro">{$novel.Introduction}</p>
                    <p class="info"><span>作者：{$novel.Author}</span><em class="type">{$novel.Cid | show_cid_name}</em>{eq name="$novel.Full" value="1"}<em class="finish">已完结</em>{else/}<em class="serial">连载中</em>{/eq}</p>
<!--                    <p class="update"><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">最新更新 </a></p>-->
                </li>
                {/foreach}
            </ul>
            <?php echo $pages;?>
        </div>
        <!--/main-->
    </div>
</div>
{/block}