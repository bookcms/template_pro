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
                {foreach $site_config.category_list as $item}
                <li><a href="{:url("/classify/" . $item.alias,"","html",true)}" target="_self">{$item.name}</a></li>
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
                {block_list block_id="1006"}
                {eq name="$index" value="0"}
                <div class="carousel-img">
                    <a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank" title="{$item.title}"><img class="lazy" src="{$item.local_image | down_image}" alt="{$item.title}"></a>
                </div>
                <ul class="carousel-nav">
                    <li>
                        <h4><a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></h4>
                        <p class="author"><a href="{:url('/author/' . urlencode($item.author) )}">{$item.author}</a></p>
                        <p class="info"><span class="type">{$item.cid | show_cid_name}</span>{eq name="$item.Full" value="1"}<span class="finish">已完结</span>{else/}<span class="serial">连载中</span>{/eq}</p>
                        <p class="intro">{$item.introduction}</p>
                        <a class="view" href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">小说详情</a>
                    </li>
                </ul>
                {/eq}
                {/block_list}
            </div>
            <div class="rec-list">
                <ul>
                    {block_list block_id="1006"}
                    {gt name="$index" value="0"}
                    <li>
                        <a class="pic" href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank"><img class="lazy" src="{$item.local_image | down_image}" alt="{$item.title}" /></a>
                        <h5 class="tit"><a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></h5>
                        <p class="intro">{$item.introduction}</p>
                        <p class="info">作者：<a href="{:url('/author/' . urlencode($item.author) )}"><span>{$item.author}</span></a><em>{$item.cid | show_cid_name}</em></p>
                    </li>
                    {/gt}
                    {/block_list}
                </ul>
            </div>
        </div>
        <div class="latest-news">
            <h3>小说资讯</h3>
            <ul>
                {foreach $hot_new_list as $item}
                <li><em>{$item.create_time | date="Y-m-d"}</em><a href="{:url("/news/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></li>
                {/foreach}
            </ul>
        </div>
    </div>
    <div class="wrap box3 clearfix">
        <div class="rec-book">
            <h3>热门小说</h3>
            <div id="carousel2" class="carousel">
                {block_list block_id="1006"}
                {eq name="$index" value="0"}
                <div class="carousel-img">
                    <a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank" title="{$item.title}"><img class="lazy" src="{$item.local_image | down_image}" alt="{$item.title}"></a>
                </div>
                <ul class="carousel-nav">
                    <li>
                        <h4><a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></h4>
                        <p class="author"><a href="{:url('/author/' . urlencode($item.author) )}">{$item.author}</a></p>
                        <p class="info"><span class="type">{$item.cid | show_cid_name}</span>{eq name="$item.Full" value="1"}<span class="finish">已完结</span>{else/}<span class="serial">连载中</span>{/eq}</p>
                        <p class="intro">{$item.introduction}</p>
                        <a class="view" href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">小说详情</a>
                    </li>
                </ul>
                {/eq}
                {/block_list}
            </div>
            <div class="rec-list">
                <ul class="clearfix">
                    {block_list block_id="1006"}
                    {gt name="$index" value="0"}
                    <li>
                        <a class="pic" href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank"><img class="lazy" src="{$item.local_image | down_image}" alt="{$item.title}" /></a>
                        <h5 class="tit"><a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></h5>
                        <p class="intro">{$item.introduction}</p>
                        <p class="info">作者：<a href="{:url('/author/' . urlencode($item.author) )}"><span>{$item.author}</span></a><em>{$item.cid | show_cid_name}</em></p>
                    </li>
                    {/gt}
                    {/block_list}
                </ul>
            </div>
        </div>
        <div class="hot-tags">
            <h3>热门标签</h3>
            <p class="clearfix">
                {foreach $hot_tags_list as $key => $item}
                {gt name="$key" value="7"}<span><a href="{:url("/tags/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></span>{/gt}
                {/foreach}
            </p>
        </div>
    </div>
    <!--/box3-->
    <!--box4-->
    <div class="wrap box4 clearfix">
        <div class="new-topic">
            <h3>热门标签</h3>
            <ul class="clearfix">
                {foreach $hot_tags_list as $key => $item}
                {lt name="$key" value="8"}
                <li><a href="{:url("/tags/" . $item['id'],"","html",true)}" target="_blank"><img class="lazy" src="{$item.image | down_image}" alt="{$item.title}"><span>{$item.title}</span></a></li>
                {/lt}
                {/foreach}
            </ul>
        </div>
        <div class="new-book">
            <h3>最新小说</h3>
            <ol class="clearfix">
                <li data-cid="0" class="on">全部</li>
                {foreach $site_config.category_list as $item}
                <li data-cid="{$item.id}">{$item.name}</li>
                {/foreach}
            </ol>
            <!--tab1-->
            <ul class="clearfix home_cid_list">
                {foreach $home_cid_list as $item}
                <li>
                    <a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank"><img class="lazy" src="{$item.local_image | down_image}" alt="{$item.title}"><span>{$item.title}</span></a>
                    {eq name="$item.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}
                </li>
                {/foreach}
            </ul>

        </div>
    </div>
    <!--/box4-->
    <!--box5-->
    <div class="wrap box5 clearfix">
        <div class="rank">
            <h3>推荐榜</h3>
            <ul>
                {block_list block_id="1006" limit="10"}
                {eq name="$index" value="0"}
                <li class="s{$index + 1}">
                    <em class="num">{$index + 1}</em>
                    <a class="pic" href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank"><img class="lazy" src="{$item.local_image | down_image}" alt="{$item.title}"></a>
                    <h5 class="tit"><a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></h5>
                    <p class="author">作者：{$item.author}</p>
                    <p class="status">状态：{eq name="$item.Full" value="1"}已完结{else/}连载中{/eq}</p>
                </li>
                {else/}
                <li class="s{$index + 1}">
                    <em class="num">{$index + 1}</em>
                    <h5 class="tit"><a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></h5>
                </li>
                {/eq}
                {/block_list}
            </ul>
        </div>
        <div class="rank">
            <h3>人气周榜</h3>
            <ul>
                <li class="s1">
                    <em class="num">1</em>
                    <a class="pic" href="/book/2644.html" target="_blank"><img class="lazy" src="http://img.p.com/uploads/allimg/180621/30-1P621110G30-L.jpg" alt="首长爹地放肆宠"></a>
                    <h5 class="tit"><a href="/book/2644.html" target="_blank">首长爹地放肆宠</a></h5>
                    <p class="author">作者：心心</p>
                    <p class="status">状态：已完结</p>
                </li>
                <li class="s2">
                    <em class="num">2</em>
                    <h5 class="tit"><a href="/book/12491.html" target="_blank">我与空姐的荒岛求生记</a></h5>
                </li>
                <li class="s3">
                    <em class="num">3</em>
                    <h5 class="tit"><a href="/book/5183.html" target="_blank">重生之都市修仙</a></h5>
                </li>
                <li class="s4">
                    <em class="num">4</em>
                    <h5 class="tit"><a href="/book/260.html" target="_blank">桃色小乡村</a></h5>
                </li>
                <li class="s5">
                    <em class="num">5</em>
                    <h5 class="tit"><a href="/book/7420.html" target="_blank">公媳诱惑</a></h5>
                </li>
                <li class="s6">
                    <em class="num">6</em>
                    <h5 class="tit"><a href="/book/2493.html" target="_blank">你是夏日繁花</a></h5>
                </li>
                <li class="s7">
                    <em class="num">7</em>
                    <h5 class="tit"><a href="/book/5534.html" target="_blank">荒岛上的故事</a></h5>
                </li>
                <li class="s8">
                    <em class="num">8</em>
                    <h5 class="tit"><a href="/book/7024.html" target="_blank">浮华逝梦</a></h5>
                </li>
                <li class="s9">
                    <em class="num">9</em>
                    <h5 class="tit"><a href="/book/517.html" target="_blank">重生暖婚：甜妻，新上线</a></h5>
                </li>
                <li class="s10">
                    <em class="num">10</em>
                    <h5 class="tit"><a href="/book/3815.html" target="_blank">缺失的爱</a></h5>
                </li>
            </ul>
        </div>
        <div class="rank">
            <h3>人气月榜</h3>
            <ul>
                <li class="s1">
                    <em class="num">1</em>
                    <a class="pic" href="/book/2644.html" target="_blank"><img class="lazy" src="http://img.p.com/uploads/allimg/180621/30-1P621110G30-L.jpg" alt="首长爹地放肆宠"></a>
                    <h5 class="tit"><a href="/book/2644.html" target="_blank">首长爹地放肆宠</a></h5>
                    <p class="author">作者：心心</p>
                    <p class="status">状态：已完结</p>
                </li>
                <li class="s2">
                    <em class="num">2</em>
                    <h5 class="tit"><a href="/book/12491.html" target="_blank">我与空姐的荒岛求生记</a></h5>
                </li>
                <li class="s3">
                    <em class="num">3</em>
                    <h5 class="tit"><a href="/book/260.html" target="_blank">桃色小乡村</a></h5>
                </li>
                <li class="s4">
                    <em class="num">4</em>
                    <h5 class="tit"><a href="/book/7420.html" target="_blank">公媳诱惑</a></h5>
                </li>
                <li class="s5">
                    <em class="num">5</em>
                    <h5 class="tit"><a href="/book/2493.html" target="_blank">你是夏日繁花</a></h5>
                </li>
                <li class="s6">
                    <em class="num">6</em>
                    <h5 class="tit"><a href="/book/5534.html" target="_blank">荒岛上的故事</a></h5>
                </li>
                <li class="s7">
                    <em class="num">7</em>
                    <h5 class="tit"><a href="/book/7024.html" target="_blank">浮华逝梦</a></h5>
                </li>
                <li class="s8">
                    <em class="num">8</em>
                    <h5 class="tit"><a href="/book/517.html" target="_blank">重生暖婚：甜妻，新上线</a></h5>
                </li>
                <li class="s9">
                    <em class="num">9</em>
                    <h5 class="tit"><a href="/book/3815.html" target="_blank">缺失的爱</a></h5>
                </li>
                <li class="s10">
                    <em class="num">10</em>
                    <h5 class="tit"><a href="/book/3402.html" target="_blank">完美人生</a></h5>
                </li>
            </ul>
        </div>
        <div class="rank">
            <h3>人气总榜</h3>
            <ul>
                <li class="s1">
                    <em class="num">1</em>
                    <a class="pic" href="/book/5183.html" target="_blank"><img class="lazy" src="http://img.p.com/uploads/allimg/180804/36-1PP41136150-L.jpg" alt="重生之都市修仙"></a>
                    <h5 class="tit"><a href="/book/5183.html" target="_blank">重生之都市修仙</a></h5>
                    <p class="author">作者：洛书</p>
                    <p class="status">状态：连载中</p>
                </li>
                <li class="s2">
                    <em class="num">2</em>
                    <h5 class="tit"><a href="/book/10523.html" target="_blank">鸿运官路</a></h5>
                </li>
                <li class="s3">
                    <em class="num">3</em>
                    <h5 class="tit"><a href="/book/4446.html" target="_blank">棺叩首</a></h5>
                </li>
                <li class="s4">
                    <em class="num">4</em>
                    <h5 class="tit"><a href="/book/6513.html" target="_blank">浮生难寄相思泪</a></h5>
                </li>
                <li class="s5">
                    <em class="num">5</em>
                    <h5 class="tit"><a href="/book/364.html" target="_blank">快穿：我只想种田</a></h5>
                </li>
                <li class="s6">
                    <em class="num">6</em>
                    <h5 class="tit"><a href="/book/398.html" target="_blank">重生宠婚：顾少，小心爱！</a></h5>
                </li>
                <li class="s7">
                    <em class="num">7</em>
                    <h5 class="tit"><a href="/book/1363.html" target="_blank">帝君宠：养只狐妃来暖床</a></h5>
                </li>
                <li class="s8">
                    <em class="num">8</em>
                    <h5 class="tit"><a href="/book/13029.html" target="_blank">全才无双</a></h5>
                </li>
                <li class="s9">
                    <em class="num">9</em>
                    <h5 class="tit"><a href="/book/7411.html" target="_blank">灵异直播间</a></h5>
                </li>
                <li class="s10">
                    <em class="num">10</em>
                    <h5 class="tit"><a href="/book/4379.html" target="_blank">日日思君不见君</a></h5>
                </li>
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
<script src="__JS__/focus.js"></script>
<!--/container-->
{/block}