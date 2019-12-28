{extend name="base_m" /}
{block name="body"}
<!--header-->
<div class="header">
    <a href="/"><span class="icon-back"></span></a>
    <h1>排行榜</h1>
    <span class="icon-grouop"><span class="icon-search"></span><span class="icon-menu"></span></span>
</div>
{include file="top_menu" /}

<!--wrap-->
<div class="wrap">
    <!--main-->
    {foreach $list as $top}
    <!--top-index-->
    <div class="mod mod-top-index">
        <div class="mod-head">
            <h2>{$top.name}</h2>
        </div>
        <div class="top-index">
            <ul class="clearfix">
                {foreach $top.top_list as $key => $novel}
                {eq name="$key" value="0"}
                <li class="s{$key + 1}">
                    <img class="pic" src="{$novel.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$novel.Title}" />
                    <a class="tit" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <p class="intro">{$novel.Introduction}</p>
                    <p class="info"><span><aria>作者：</aria>{$novel.Author}</span><em class="type">{$novel.Cid | show_cid_name}</em>{eq name="$novel.Full" value="0"}<em class="serial">连载中</em>{else/}<em class="finish">已完结</em>{/eq}</p>
                    <i class="num"><em>{$key + 1}</em></i>
                </li>
                {else/}
                <li class="s{$key + 1}">
                    <h5 class="tit"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></h5>
                    <i  class="num"><em>{$key + 1}</em></i>
                </li>
                {/eq}
                {/foreach}
            </ul>
        </div>
    </div>
    {/foreach}
    <!--/main-->
</div>
{/block}