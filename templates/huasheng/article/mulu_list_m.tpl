{extend name="base_m" /}
{block name="body"}
<!--header-->
<div class="header">
    <a href="javascript:history.go(-1);"><span class="icon-back"></span></a>
    <h1>{$novel.Title}</h1>
    <span class="icon-grouop"><span class="icon-search"></span><span class="icon-menu"></span></span>
</div>
{include file="top_menu" /}

<div class="wrap wrap-info">
    <!--main-->
    <!--attentions-->
    <div class="mod mod-attentions">
        <div class="mod-head">
            <h3>全部章节：</h3>
        </div>
        <!--attentions-->
        <div class="attentions">
            <ul class="clearfix">
                {foreach $novel.chapter_list as $chapter}
                <li> <a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></li>
                {/foreach}
            </ul>
        </div>
    </div>
    <!--chapters-->
    <!--/main-->
</div>
{/block}