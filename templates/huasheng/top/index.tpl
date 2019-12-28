{extend name="base" /}
{block name="uaredirect"}
<script type="text/javascript">uaredirect("{:url('/top',array(),'html','m')}");</script>
{/block}
{block name="body"}
<!--container-->
<div class="container" style="overflow: hidden;">
    <div class="bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        <a href="{:url("/top","","html",true)}">排行榜</a>
    </div>
    <div class="wrap clearfix">
        <!--primary-->
        <div class="top-list">
            <div class="clearfix">
                {foreach $list as $top}
                <div class="rank-item">
                    <h3>{$top.name}</h3>
                    <ul>
                        {foreach $top.top_list as $key => $novel}
                        {eq name="$key" value="0"}
                        <li class="s{$key + 1}">
                            <em class="num">{$key + 1}</em>
                            <a class="pic" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$novel.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$novel.Title}"></a>
                            <h5 class="tit"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></h5>
                            <p class="author">作者：{$novel.Author}</p>
                            <p class="status">状态：{eq name="$novel.Full" value="0"}连载中{else/}已完结{/eq}</p>
                        </li>
                        {else/}
                        <li class="s{$key + 1}">
                            <em class="num">{$key + 1}</em>
                            <h5 class="tit"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></h5>
                        </li>
                        {/eq}
                        {/foreach}
                    </ul>
                </div>
                {/foreach}
            </div>
        </div>
        <!--/primary-->
    </div>
</div>
<!--/container-->
{/block}