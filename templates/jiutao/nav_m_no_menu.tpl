<div class="header">
    <a href="/" class="header-back jsBack"><svg class="icon icon-arrow-l"><use xlink:href="#icon-arrow-l"></use></svg>主页</a>
    <div class="header-operate">
        <a href="{:url('/login/index')}" class="icon icon-person" title="用户登录"><svg class="jsGuestWrapper"><use xlink:href="#icon-person"></use></svg></a>
        <a href="javascript:" id="toggle-search" class="icon icon-search" title="搜索"><svg><use xlink:href="#icon-search"></use></svg></a>
        <a id="toggle-nav" href="javascript:;" class="icon icon-more" title="分类"></a>
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
<div class="search-container" id="search-block" style="display: none">
    <form action="{:url('/search')}" class="search-guide" method="get">
        <input type="search" placeholder="关键字搜索" name="keyword" />
        <button type="submit"></button>
    </form>
</div>