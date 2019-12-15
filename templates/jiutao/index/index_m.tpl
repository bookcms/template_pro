{extend name="base_m" /}
{block name="nav"}
    <div class="header header-index">
        <a href="/" class="logo-a" title="{$site_config.site_name}"><h1 class="logo">{$site_config.site_name} </h1></a>
        <div class="header-operate">
            <a href="{:url('login/index')}" class="icon icon-person" title="用户登录"><svg class="jsGuestWrapper"><use xlink:href="#icon-person"></use></svg></a>
            <a id="toggle-nav" href="javascript:;" class="icon icon-more"></a>
        </div>
    </div>
    <div class="nav" id="nav-switch" style="display: none;">
        <ul>
            {foreach $site_config.category_list as $category_nav}
            <li>
                <a href="{:url('/classify/' . $category_nav['alias'])}" title="{$category_nav.name}">{$category_nav.name}</a>
            </li>
            {/foreach}
        </ul>
    </div>
    <div class="search-container">
        <form action="{:url('search')}" class="search-guide" method="post">
            <input type="search" placeholder="关键字搜索" name="keyword" />
            <button type="submit"></button>
        </form>
    </div>
    <div class="home-nav">
        <a href="/" class="guide-nav-a" title="首页"><i class="icon icon-home"></i><h4 class="guide-nav-h">首 页</h4></a>
        <a href="{:url('/classify/all')}" class="guide-nav-a" title="小说分类"><i class="icon icon-sort"></i><h4 class="guide-nav-h">分 类</h4></a>
        <a href="{:url('/top')}" class="guide-nav-a" title="小说排行榜"><i class="icon icon-rank"></i><h4 class="guide-nav-h">排 行</h4></a>
        <a href="{:url('/full')}" class="guide-nav-a" title="全本小说"><i class="icon icon-end"></i><h4 class="guide-nav-h">全 本</h4></a>
        <a href="{:url('/last_update')}" class="guide-nav-a" title="最近更新小说"><i class="icon icon icon-newbook"></i><h4 class="guide-nav-h">最 新</h4></a>
    </div>
{/block}
{block name="body"}
    <div class="novel">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title">&#28909;&#38376;&#25512;&#33616;</h3><span>精彩阅读不容错过</span>
            </div>
            <div class="novel-header-r">
                <a href="javascript:void(0)" title="小说推荐榜">&#26356;&#22810;<svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"></use></svg></a>
            </div>
        </div>
        <div class="novel-slide">
            <ol class="novel-slide-ol">
                {ranking_list limit="7" name="top"}
                <li class="novel-slide-li">
                    <a href="{:url('/book/' . $ranking['PrimaryId'],'','html',true)}" class="novel-slide-a" title="{$ranking.Title}">
                        <img src="__IMAGES__/default.jpg" data-echo="{$ranking.LocalImage | down_image}" class="novel-slide-img" alt="{$ranking.Title}">
                        <div class="novel-slide-caption">{$ranking.Title | msubstr=0,5}</div>
                        <p class="novel-slide-author"><span class="gray">{$ranking.Author}</span></p>
                    </a>
                </li>
                {/ranking_list}
            </ol>
        </div>
    </div>
    <div class="novel">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title">
                    &#28909;&#38376;&#23567;&#35828;
                </h3>
                <span class="novel-title-desc">精彩内容不容错过</span>
            </div>
            <div class="novel-header-r">
                <a href="/top/allvisit.html" class="novel-header-btn" title="小说点击总榜">
                    更多
                    <svg class="icon icon-arrow-r">
                        <use xlink:href="#icon-arrow-r">
                        </use>
                    </svg>
                </a>
            </div>
        </div>
        <ol class="book-ol book-ol-normal">
            {ranking_list limit="16" name="top"}
            {gt name="$index" value="7"}
            <li class="book-li">
                <a href="{:url('/book/' . $ranking['PrimaryId'],'','html',true)}" class="book-layout" title="{$ranking.Title}">
                    <img src="__IMAGES__/default.jpg" data-echo="{$ranking.LocalImage | down_image}" class="book-cover" alt="{$ranking.Title}">
                    <div class="book-cell">
                        <h4 class="book-title">{$ranking.Title}</h4>
                        <p class="book-desc">{$ranking.Introduction | msubstr=0,200}</p>
                        <div class="book-meta">
                            <div class="book-meta-l">
                                <span class="book-author"><svg class="icon icon-human"><use xlink:href="#icon-human"></use></svg>{$ranking.Author}</span>
                            </div>
                            <div class="book-meta-r">
                                    <span class="tag-small-group origin-right">
                                        <em class="tag-small yellow">{$ranking.Cid | show_cid_name}</em>
                                        <em class="tag-small red">{eq name="$ranking.Full" value="0"}连载中{else/}已完结{/eq}</em>
<!--                                        <em class="tag-small blue">301人看过</em>-->
                                    </span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            {/gt}
            {/ranking_list}
        </ol>
    </div>
    <div class="novel">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title" id="classic-element">
                    分类推荐
                </h3>
            </div>
        </div>

        {foreach $all_category_list as $index2 => $category_list}
        <div class="novel-tab">
            <nav class="btn-group" id="group{$index2}">
                {foreach $category_list as $key => $category}
                <h3 class="btn-group-cell"><a href="javascript:" class="btn-tab {eq name="$key" value='0'}active{/eq}" title="玄幻魔法">{$category.name}</a></h3>
                {/foreach}
            </nav>
        </div>
        <div class="novel-slide novel-category" id="tab{$index2}">
            {foreach $category_list as $key => $category}
            <ol class="novel-slide-ol {eq name="$key" value='0'}active{/eq}">
                {cid_ranking_list cid="$category.cid" limit='7' name='top'}
                <li class="novel-slide-li">
                    <a href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}" class="novel-slide-a" title="{$ranking.Title}">
                    <img src="__IMAGES__/default.jpg" data-echo="{$ranking.LocalImage | down_image}" width="90" height="125" class="novel-slide-img" alt="{$ranking.Title}">
                    <div class="novel-slide-caption">{$ranking.Title}</div>
                        <p class="novel-slide-author">
                            <span class="gray">{$ranking.Author}</span>
                        </p>
                    </a>
                </li>
                {/cid_ranking_list}
            </ol>
            {/foreach}
        </div>
        {/foreach}
    </div>
    <div class="novel">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title">最近更新</h3>
            </div>
            <div class="novel-header-r">
                <a href="/top/lastupdate.html" class="novel-header-btn" title="最近更新小说">更多<svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"></use></svg></a>
            </div>
        </div>
        <ul class="book-ol book-ol-normal">
            {foreach $last_insert_list as $novel}
            <li class="book-li">
                <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" class="book-layout" title="{$novel.Title}">
                    <img src="__IMAGES__/default.jpg" data-echo="{$novel.LocalImage | down_image}" class="book-cover" alt="{$novel.Title}">
                    <div class="book-cell">
                        <h4 class="book-title">{$novel.Title}</h4>
                        <p class="book-desc">{$novel.Introduction | msubstr=0,120} </p>
                        <div class="book-meta">
                            <div class="book-meta-l">
                                <span class="book-author"><svg class="icon icon-human"><use xlink:href="#icon-human"></use></svg>{$novel.Author}</span>
                            </div>
                            <div class="book-meta-r">
                                <span class="tag-small-group origin-right">
                                    <em class="tag-small yellow">{$novel.Cid | show_cid_name}</em>
                                    <em class="tag-small red"><font color="red">连载中</font></em>
                                    <em class="tag-small blue">{$novel.UpdateTime | date="Y-m-d"} </em>
                                </span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            {/foreach}
        </ul>
    </div>
{/block}
