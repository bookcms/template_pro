{extend name="base_m" /}
{block name="mip"}
{include file="mip" /}
{/block}

{block name="body"}
    <div class="content page-book-detail">
        <div class="header book-detail-header">
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
                    <a href="/{$category_nav.alias}" title="{$category_nav.name}">{$category_nav.name}</a>
                </li>
                {/foreach}
            </ul>
        </div>
        <div class="search-container" id="search-block" style="display: none">
            <form action="{:url('search')}" class="search-guide" method="post">
                <input type="search" placeholder="关键字搜索" name="keyword" />
                <button type="submit"></button>
            </form>
        </div>
        <div class="novel novel-merge book-detail-x">
            <img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" class="book-cover-blur">
            <div class="book-detail-info">
                <div class="book-layout">
                    <img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" class="book-cover" />
                    <div class="book-cell">
                        <h1 class="book-title" id="book-detail" data-bid="79213" data-cid="17" data-bookname="{$novel.Title}">{$novel.Title} </h1>
                        <p class="book-meta">
                            <svg class="icon icon-human"><use xlink:href="#icon-author"></use></svg>
                            <a href="{:url('/author/' . urlencode($novel['Author']))}" title="{$novel.Author}品集">{$novel.Author} </a>
                        </p>
                        <p class="book-meta">
                            分类：<a href="/{$novel.Cid | show_cid_alias}" title="{$novel.Cid | show_cid_name}">{$novel.Cid | show_cid_name}<svg class="icon"><use xlink:href="#icon-jump"></use></svg></a>
                        </p>
                        <p class="book-meta">
                            时间：{$novel.UpdateTime | date="Y-m-d H:i"}                         </p>
                        <p class="book-meta">
                            最新：<a href="{:url("/chapter/" . $novel.PrimaryId . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" title="{$novel.Title} {$novel.LastChapterTitle}">{$novel.LastChapterTitle}</a>
                        </p>
                        <span {eq name="$novel.Full" value="0"}class="novel_success1"{else/}class="novel_success2"{/eq}></span>
                    </div>
                </div>
                <div class="book-detail-btn">
                    <ul class="btn-group">
                        <li class="btn-group-cell">
                            <a href="{:url("/chapter/" . $novel.PrimaryId . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" id="continue-reading" class="btn-normal" title="立即阅读{$novel.Title} "> 阅读最新</a>
                        </li>
                        <li class="btn-group-cell">
                            <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"  class="btn-normal white" title="{$novel.Title}TXT下载 ">本书介绍</a>
                        </li>
                        <li class="btn-group-cell">
                            <a href="javascript:void(0)" class="btn-normal white" title="把{$novel.Title} 加入书架">加入书架</a>
                        </li>
                    </ul>
                </div>
                <div id="last-read"></div>
            </div>
        </div>
        <div class="novel novel-merge">
            <div class="book-summary">
                <p class="cor-introduce">{$novel.Introduction} </p>
                <div class="introduce-more-box"></div>
            </div>
        </div>

        <div class="novel">
            <div class="novel-header">
                <div class="novel-header-l">
                    <h3 class="novel-title">
                        ZIP下载列表
                    </h3>
                    <span class="novel-title-desc">
                                点击下方“打包下载”下载该书。
                            </span>
                </div>
            </div>
            <div class="down-link" style="background-color: rgb(242, 250, 242);">
                        <span>
                            <div class="downtype"><font color="#969ba3">格式</font></div>
                            <div class="downsize" title="此为文件的大小。">大小</div>
                            <div class="downfrom" title="下载来源">下载来源</div>
                            <div class="uptime">打包时间</div>
                            <div class="zip-download">
                                <font color="#969ba3">ZIP下载</font>
                            </div>
                        </span>
            </div>
            <p class="error1">很抱歉！ZIP下载资源已失效或缺失,请选择<a href="/2_R1.html" title="在线阅读神级奶爸">在线阅读</a>。</p>
        </div>
        <div class="novel">
            <div class="novel-header">
                <div class="novel-header-l">
                    <h3 class="novel-title">
                        TXT下载列表
                    </h3>
                    <span class="novel-title-desc">
                                点击下方“全本下载”下载该书。
                            </span>
                </div>
            </div>
            <div class="down-link" style="background-color: rgb(242, 250, 242);">
                        <span>
                            <div class="downtype"><font color="#969ba3">格式</font></div>
                            <div class="downsize" title="此为文件的大小。">大小</div>
                            <div class="downfrom" title="下载来源">下载来源</div>
                            <div class="uptime">打包时间</div>
                            <div class="zip-download">
                                <font color="#969ba3">TXT下载</font>
                            </div>
                        </span>
            </div>

            <p class="error1">很抱歉！TXT下载资源已失效或缺失,请选择<a href="/2_R1.html" title="在线阅读神级奶爸">在线阅读</a>。</p>
        </div>
<!--        <div class="novel">-->
<!--            <div class="novel-header">-->
<!--                <div class="novel-header-l">-->
<!--                    <h3 class="novel-title">-->
<!--                        下载排行榜-->
<!--                    </h3>-->
<!--                    <a name="txt">-->
<!--                    </a>-->
<!--                </div>-->
<!--            </div>-->
<!--            <div class="novel-slide">-->
<!--                <ol class="novel-slide-ol">-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/8" class="novel-slide-a" title="豪婿（超级女婿）">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/cover/02/82/97/0282979766e4187b22fdcc74b01059d0.jpg" class="novel-slide-img" alt="豪婿（超级女婿）">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                豪婿（超级                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            绝人                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/151" class="novel-slide-a" title="我跟天庭抢红包">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/cover/25/6c/00/256c000f71fb1859d1d5621f9f883db2.jpg" class="novel-slide-img" alt="我跟天庭抢红包">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                我跟天庭抢                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            韭上非                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/2" class="novel-slide-a" title="神级奶爸">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/cover/2d/46/53/2d4653f9a4d8bdd7280332c306f7af28.jpg" class="novel-slide-img" alt="神级奶爸">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                神级奶爸                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            单王张                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/11" class="novel-slide-a" title="继承三千年">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/cover/13/99/2c/13992c0947a0126ee098e64ca5fd7ad6.jpg" class="novel-slide-img" alt="继承三千年">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                继承三千年                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            暗石                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/4256" class="novel-slide-a" title="抗战之最强兵王">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/image/nocover.jpg" class="novel-slide-img" alt="抗战之最强兵王">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                抗战之最强                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            天马流星                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/4045" class="novel-slide-a" title="极品护花高手">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/image/nocover.jpg" class="novel-slide-img" alt="极品护花高手">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                极品护花高                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            千叶传奇                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/60" class="novel-slide-a" title="他来自炼狱">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/cover/3f/92/e8/3f92e852207e619de82edcc23cbe549a.jpg" class="novel-slide-img" alt="他来自炼狱">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                他来自炼狱                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            摸爬滚打                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li class="novel-slide-li">-->
<!--                        <a href="/txt/4024" class="novel-slide-a" title="重生之都市魔尊">-->
<!--                            <img src="/public/image/d.jpg" data-echo="/public/cover/d2/d0/7c/d2d07c7a50542cabeb6576f12ab479bf.jpg" class="novel-slide-img" alt="重生之都市魔尊">-->
<!--                            <div class="novel-slide-caption">-->
<!--                                重生之都市                                </div>-->
<!--                            <p class="novel-slide-author">-->
<!--                                        <span class="gray">-->
<!--                                            夜九仙                                    </span>-->
<!--                            </p>-->
<!--                        </a>-->
<!--                    </li>-->
<!--                </ol>-->
<!--            </div>-->
<!--        </div>-->
    </div>



{/block}
