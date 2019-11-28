{extend name="base" /}
{block name="header"}
{/block}
{block name="body"}
<!--/header-->
<!--container-->
<div class="container clearfix">
    <div class="bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        <a href="{:url("/classify","","html",true)}">小说库</a>
    </div>
    <div class="wrap clearfix">
        <!--main-->
        <div class="book-nav">
            <div class="clearfix">
                <p>小说类型：</p>
                <ul class="clearfix">
                    {foreach $classify as $item}
                    <li {eq name="$item.alias" value="$current_alias"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="clearfix">
                <p>更新时间：</p>
                <ul class="clearfix">
                    {foreach $classify_update_times as $item}
                    <li {eq name="$item.time" value="$current_update_time"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="clearfix">
                <p>写作进度：</p>
                <ul class="clearfix">
                    {foreach $classify_status as $item}
                    <li {eq name="$item.status" value="$current_status"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
        <div class="book-list">
            <h2>{eq name="$current_alias" value="all"}全部小说{else/}{$current_classify.name}小说{/eq}</h2>
            <ul class="clearfix">
                {foreach $list as $novel}
                <li>
                    <a class="pic" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                    <h5 class="tit"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></h5>
                    <p class="info">作者：<a href="{:url('/author/' . urlencode($novel.Author) )}" target="_blank"><span>{$novel.Author}</span></a><span>分类：{$novel.Cid | show_cid_name}</span>{eq name="$novel.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}</p>
                    <p class="intro">{$novel.Introduction}</p>
                    <a class="view" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" target="_blank">阅读最新</a>
                </li>
                {/foreach}
            </ul>
        </div>
        <?php echo $pages;?>
        <!--main-->
    </div>
</div>
<!--/container-->
{/block}