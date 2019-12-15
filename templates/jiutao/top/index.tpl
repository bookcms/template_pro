{extend name="base" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__STATIC__/css/top_pc.css">
{/block}
{block name="uaredirect"}
<script type="text/javascript">uaredirect("{:url('/top',array(),'html','m')}");</script>
{/block}
{block name="body"}
<div class="main">
    <div class="layui-main">
        <div class="box">
            <div class="path">
                <ul class="nav">
                    {foreach $ranking_list as $ranking}
                    <li><a href="javascript:void(0)">{$ranking.name}</a><span class="layui-badge-rim">{$ranking.total}</span></li>
                    {/foreach}
                </ul>
            </div>
        </div>
        {foreach $ranking_list as $index => $ranking}
        <div class="box left w_265">
            <div class="title lite">
                <h2>{$ranking.name}</h2>
                <a href="javascript:void(0)" class="more">更多 &gt;</a>
            </div>
            <div class="list bg">
                <ul class="mini">
                    {foreach $ranking.top_list as $key => $novel}
                    {lt name="$key" value="1"}
                    <li class="on">
                        <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                        <p class="bookname"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></p>
                        <p class="intro">{$novel.Introduction | msubstr=0,20}</p>
                        <p class="author">作者：<a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></p>
                    </li>
                    {/lt}
                    {/foreach}
                    {foreach $ranking.top_list as $key => $novel}
                    {gt name="$key" value="1"}
                    <li>
                        <p class="bookname"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></p>
                        <p class="author"><a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></p>
                    </li>
                    {/gt}
                    {/foreach}
                </ul>
            </div>
        </div>
        {/foreach}
    </div>
</div>
{/block}
