{extend name="base_m" /}
{block name="header"}
<link rel="stylesheet" href="//unpkg.com/swiper/css/swiper.min.css">
{/block}
{block name="body"}
<!--header-->
<div class="header">
    <h1 class="logo">{$site_config.site_name}</h1>
    <span class="icon-grouop"><span class="icon-bookshelf"></span></span>
</div>
<!--wrap-->
<div class="wrap">
    <!--slide-->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            {foreach $site_config.slide_list as $item }
            <div class="swiper-slide"><a target="{$item.target}" {eq name="$item.url" value=""}href="javascript:void(0)"{else/}href="{$item.url}"{/eq}><img src="{$item.image | down_image}" alt="{$item.name}" /><span>{$item.name}</span></a></div>
            {/foreach}
        </div>
    </div>
    <!-- search -->
    <div class="bar">
        <form method="get" name="search" action="{:url("/search")}">
            <input type="text" name="k" id="q" placeholder="请输入书名/作者" class="search-key">
            <button type="submit" class="search-btn" id="search-btn">Go</button>
        </form>
    </div>

    <!-- nav -->
    <div class="nav">
        <a href="{:url("/top")}"><img class="nav-img" src="__IMAGES__/nav-top.png" alt="排行榜"/><span>排行榜</span></a>
        <a href="#"><img class="nav-img" src="__IMAGES__/nav-tags.png" alt="书架"/><span>书架</span></a>
        <a href="#"><img class="nav-img" src="__IMAGES__/nav-news.png" alt="收藏"/><span>收藏</span></a>
        <a href="{:url("/classify")}"><img class="nav-img" src="__IMAGES__/nav-book.png" alt="小说库"/><span>小说库</span></a>
    </div>

    <!-- rec-book -->
    <div class="mod rec-book">
        <div class="mod-head">
            <h3>编辑推荐</h3>
        </div>
        <div class="book-slide">
            <ul class="clearfix">
                {block_list block_id="1"}
                <li>
                    <a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}">
                        <img class="lazy" src="{$block.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$block.Title}"/>
                        <span>{$block.Title}</span>
                        <em><aria>作者：</aria>{$block.Author}</em>
                    </a>
                </li>
                {/block_list}
            </ul>
        </div>
    </div>
    <!-- /rec-book -->
    <!-- hot-book -->
    <div class="mod hot-book">
        <div class="mod-head">
            <h3>热门小说</h3>
        </div>
        <div class="book-slide">
            <ul class="clearfix">
                {ranking_list limit="10"}
                <li>
                    <a href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}">
                    <img class="lazy" src="{$ranking.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$ranking.Title}"/>
                    <span>{$ranking.Title}</span>
                    <em><aria>作者：</aria>{$ranking.Author}</em>
                    </a>
                </li>
                {/ranking_list}
            </ul>
        </div>
    </div>
    <!-- /hot-book -->

    {foreach $site_config.category_list as $category}
    <!-- new-book -->
    <div class="mod new-book">
        <div class="mod-head">
            <h3>{$category.name}</h3>
            <a href="{:url("/classify/" . $category['alias'] ,"","html",true)}">更多</a>
        </div>
        <div class="book-list">
            <ul class="clearfix">
                {novel_list cid_list="$category.cid_list" limit="5"}
                <li>
                    <img class="pic lazy" src="{$novel.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$novel.Title}"/>
                    <a class="tit" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <p class="intro">{$novel.Introduction}</p>
                    <p class="info"><span><aria>作者：</aria>{$novel.Author}</span><em class="type">{$novel.Cid | show_cid_name}</em>  {eq name="$novel.Full" value="1"}<em class="finish">已完结</em>{else/}<em class="serial">连载中</em>{/eq}</p>
                </li>
                {/novel_list}
            </ul>
        </div>
    </div>
    <!-- /new-book -->
    {/foreach}

    <!-- new-book -->
    <div class="mod new-book">
        <div class="mod-head">
            <h3>最新小说</h3>
            <a href="{:url("/classify","","html",true)}">更多</a>
        </div>
        <div class="book-list">
            <ul class="clearfix">
                {foreach $last_insert_list as $novel}
                <li>
                    <img class="pic lazy" src="{$novel.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$novel.Title}"/>
                    <a class="tit" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <p class="intro">{$novel.Introduction}</p>
                    <p class="info"><span><aria>作者：</aria>{$novel.Author}</span><em class="type">{$novel.Cid | show_cid_name}</em>  {eq name="$novel.Full" value="1"}<em class="finish">已完结</em>{else/}<em class="serial">连载中</em>{/eq}</p>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
    <!-- /new-book -->

</div>
{/block}
{block name="footer"}
<script src="//unpkg.com/swiper/js/swiper.min.js"> </script>
<script>
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";

    var mySwiper = new Swiper ('.swiper-container', {
        direction: 'horizontal', // 垂直切换选项
        loop: true, // 循环模式选项
        autoplay: true,
    })
</script>
{/block}