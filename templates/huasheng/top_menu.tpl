<div class="search lightbox">
    <div class="search-mask"></div>
    <div class="search-panel">
        <div class="search-form">
            <form method="get" name="search" action="{:url("/search","","","m")}">
                <input type="text" name="k" id="q" placeholder="请输入书名/作者/标签" class="search-key">
                <button type="submit" class="search-btn" id="search-btn">Go</button>
            </form>
        </div>
        <div class="search-bar">大家都在看</div>
        <div class="search-tags">
            <a href="/search?k=欲乱情迷">欲乱情迷</a>
            <a href="/search?k=妻子不爱我">妻子不爱我</a>
        </div>
    </div>
</div>

<!--menu-->
<div class="menu lightbox">
    <div class="menu-mask"></div>
    <div class="menu-panel">
        <div class="menu-list">
            <a href="{$site_config.mobile_domain}"><img src="__IMAGES__/nav-home.png" alt="首页" /><span>首页</span></a>
            <a href="{:url("/news","","html",true)}"><img  class="nav-img" src="__IMAGES__/nav-news.png" alt="资讯" /><span>资讯</span></a>
            <a href="{:url("/top","","html",true)}"><img  class="nav-img" src="__IMAGES__/nav-top.png" alt="排行榜" /><span>排行榜</span></a>
            <a href="{:url("/classify","","html",true)}"><img class="nav-img" src="__IMAGES__/nav-book.png" alt="小说库" /><span>小说库</span></a>
        </div>
    </div>
</div>