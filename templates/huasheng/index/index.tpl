{extend name="base" /}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url={$site_config.mobile_domain}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={$site_config.mobile_domain}" />
{/block}
{block name="body"}
<!--container-->
<div class="container clearfix">
    <!--mod-->
    <div class="wrap box1 clearfix">
        <!--category-->
        <div class="category">
            <ul class="clearfix">
                {foreach $site_config.category_list as $category}
                <li><a href="{:url("/classify/" . $category['alias'],"","html",true)}" target="_self">{$category.name}</a></li>
                {/foreach}
                <li><a href="{:url("/classify","","html",true)}">更多</a></li>
            </ul>
        </div>
        <!--focus-->
        <div class="focus">
            <div class="banner">
                <div class="banner-box">
                    <ul class="banner-img">
                        {foreach $site_config.slide_list as $item }
                        <li><a {eq name="$item.url" value=""}href="javascript:void(0)"{else/}href="{$item.url}"{/eq} target="{$item.target}"><img src="{$item.image | down_image}" alt="{$item.name}"></a></li>
                        {/foreach}
                    </ul>
                </div>
                <ul class="banner-nav">
                    {foreach $site_config.slide_list as $key => $item }
                    <li {eq name="$key" value="0"}class="selected"{/eq}>
                        <b>{$key + 1}</b>
                        <h4>{$item.name}</h4>
                        <p>{$item.content}</p>
                    </li>
                    {/foreach}
                </ul>
                <div class="banner-btn">
                    <a href="javascript:;" class="prevBtn" rel="nofollow"><i></i></a>
                    <a href="javascript:;" class="nextBtn" rel="nofollow"><i></i></a>
                </div>
                <div class="banner-load"></div>
            </div>
        </div>
    </div>

    <div class="wrap box3 clearfix">
        <div class="rec-book">
            <h3>编辑推荐</h3>
            <div id="carousel1" class="carousel">
                {block_list block_id="1"}
                {eq name="$index" value="0"}
                <div class="carousel-img">
                    <a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}" target="_blank" title="{$block.Title}"><img class="lazy" src="{$block.LocalImage | down_image}" alt="{$block.Title}"></a>
                </div>
                <ul class="carousel-nav">
                    <li>
                        <h4><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}" target="_blank">{$block.Title}</a></h4>
                        <p class="author"><a href="{:url('/author/' . urlencode($block.Author) )}">{$block.Author}</a></p>
                        <p class="info"><span class="type">{$block.Cid | show_cid_name}</span>{eq name="$block.Full" value="1"}<span class="finish">已完结</span>{else/}<span class="serial">连载中</span>{/eq}</p>
                        <p class="intro">{$block.Introduction}</p>
                        <a class="view" href="{:url("/book/" . $block['PrimaryId'],"","html",true)}" target="_blank">小说详情</a>
                    </li>
                </ul>
                {/eq}
                {/block_list}
            </div>
            <div class="rec-list">
                <ul>
                    {block_list block_id="1"}
                    {gt name="$index" value="0"}
                    <li>
                        <a class="pic" href="{:url("/book/" . $block['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$block.LocalImage | down_image}" alt="{$block.Title}" /></a>
                        <h5 class="tit"><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}" target="_blank">{$block.Title}</a></h5>
                        <p class="intro">{$block.Introduction}</p>
                        <p class="info">作者：<a href="{:url('/author/' . urlencode($block.Author) )}"><span>{$block.Author}</span></a><em>{$block.Cid | show_cid_name}</em></p>
                    </li>
                    {/gt}
                    {/block_list}
                </ul>
            </div>
        </div>
        <div class="latest-news">
            <h3>编辑推荐</h3>
            <ul>
                {block_list block_id="1"}
                <li><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}"  title="{$block.Title}" target="_blank">{$block.Title}</a></li>
                {/block_list}
            </ul>
        </div>
    </div>
    <div class="wrap box3 clearfix">
        <div class="rec-book">
            <h3>热门小说</h3>
            <div id="carousel2" class="carousel">
                {ranking_list limit="1"}
                <div class="carousel-img">
                    <a href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}" target="_blank" title="{$ranking.Title}"><img class="lazy" src="{$ranking.LocalImage | down_image}" alt="{$ranking.Title}"></a>
                </div>
                <ul class="carousel-nav">
                    <li>
                        <h4><a href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}" target="_blank">{$ranking.Title}</a></h4>
                        <p class="author"><a href="{:url('/author/' . urlencode($ranking.Author) )}">{$ranking.Author}</a></p>
                        <p class="info"><span class="type">{$ranking.Cid | show_cid_name}</span>{eq name="$ranking.Full" value="1"}<span class="finish">已完结</span>{else/}<span class="serial">连载中</span>{/eq}</p>
                        <p class="intro">{$ranking.Introduction}</p>
                        <a class="view" href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}" target="_blank">小说详情</a>
                    </li>
                </ul>
                {/ranking_list}
            </div>
            <div class="rec-list">
                <ul class="clearfix">
                    {ranking_list limit="7"}
                    {gt name="$index" value="0"}
                    <li>
                        <a class="pic" href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$ranking.LocalImage | down_image}" alt="{$ranking.Title}" /></a>
                        <h5 class="tit"><a href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}" target="_blank">{$ranking.Title}</a></h5>
                        <p class="intro">{$ranking.Introduction}</p>
                        <p class="info">作者：<a href="{:url('/author/' . urlencode($ranking.Author) )}"><span>{$ranking.Author}</span></a><em>{$ranking.Cid | show_cid_name}</em></p>
                    </li>
                    {/gt}
                    {/ranking_list}
                </ul>
            </div>
        </div>
        <div class="hot-tags">
            <h3>随机小说</h3>
            <p class="clearfix">
                {random_list  limit="20"}
                <span><a href="{:url("/book/" . $random['PrimaryId'],"","html",true)}"  title="{$random.Title}" target="_blank">{$random.Title}</a></span>
                {/random_list}
            </p>
        </div>
    </div>
    <!--/box3-->
    <!--box4-->
    <div class="wrap box4 clearfix">
        <div class="new-book">
            <h3>最新小说</h3>
            <ol class="clearfix">
                <li data-cid="0" class="on">最近更新</li>
                {foreach $site_config.category_list as $key => $item}
                {lt name="$key" value="8"}
                <li data-cid="{$item.cid}">{$item.name}</li>
                {/lt}
                {/foreach}
            </ol>
            <!--tab1-->
            <ul class="clearfix home_cid_list">
                {foreach $last_update_list as $novel}
                <li>
                    <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"><span>{$novel.Title}</span></a>
                    {eq name="$novel.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}
                </li>
                {/foreach}
            </ul>

        </div>
    </div>
    <!--/box4-->
    <!--friend-link-->
    <div class="wrap clearfix">
        <div class="friend-link">
            <h5>友情链接</h5>
            <ul class="clearfix">
                {foreach $site_config.links as $item}
                <li><a href="{$item.url}" target="_blank">{$item.name}</a></li>
                {/foreach}
            </ul>
        </div>
    </div>
    <!--/friend-link-->
</div>
<!--/container-->
{/block}
{block name="footer"}
<script src="__JS__/focus.js"></script>
{/block}