{extend name="base" /}
{block name="uaredirect"}
<script type="text/javascript">uaredirect("{:url('/search',array(),'html','m')}");</script>
{/block}
{block name="body"}
<!--/header-->
<!--container-->
<div class="container clearfix">
    <div class="bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        <a href="{:url("/classify","","html",true)}">全部</a>
    </div>
    <div class="wrap clearfix">
        <!--main-->
        <div class="book-list">
            <h2>{$keyword}-相关小说</h2>
            <ul class="clearfix">
                {foreach $list as $novel}
                <li>
                    <a class="pic" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$novel.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$novel.Title}"></a>
                    <h5 class="tit"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></h5>
                    <p class="info">作者：<a href="{:url('/author/' . urlencode($novel.Author) )}" target="_blank"><span>{$novel.Author}</span></a><span>分类：{$novel.Cid | show_cid_name}</span>{eq name="$novel.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}</p>
                    <p class="intro">{$novel.Introduction}</p>
                    <!--<p class="update"><a href="/book/14821/chapter/.html">最新更新 </a></p>-->
                    <a class="view" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" target="_blank">阅读最新</a>
                </li>
                {/foreach}
            </ul>
        </div>
        <!--main-->
    </div>
</div>
<!--/container-->
{/block}