{extend name="base_m" /}
{block name="header"}
{/block}
{block name="body"}
<div class="header">
    <a href="javascript:history.go(-1);"><span class="icon-back"></span></a>
    <h1>{$author}的小说作品</h1>
    <span class="icon-grouop"><span class="icon-search"></span><span class="icon-menu"></span></span>
</div>
{include file="top_menu" /}

<!--wrap-->
<div class="wrap">
    <!-- book-list -->
    <div class="mod mod-book">
        <div class="book-list">
            <ul class="clearfix">
                {foreach $list as $novel}
                <li>
                    <img class="pic lazy" src="{$novel.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$novel.Title}" />
                    <a class="tit" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <p class="intro">{$novel.Introduction}</p>
                    <p class="info"><span>作者：{$novel.Author}</span><em class="type">{$novel.Cid | show_cid_name}</em>{eq name="$novel.Full" value="1"}<em class="finish">已完结</em>{else/}<em class="serial">连载中</em>{/eq}</p>
                </li>
                {/foreach}
            </ul>
        </div>
        <!--/main-->
    </div>
</div>
{/block}