{extend name="base_m" /}
{block name="mip"}
    {include file="mip" /}
{/block}

{block name="header"}
    <link rel="canonical" href="{:url("/book/" . $novel['PrimaryId'],"","html","www")}"/>
    <style>
        .cor-introduce{
            line-height: 24px;
            color: #999;
            position: relative;
            overflow: hidden;
            text-indent: 2em;
        }
        .introduce-more-box{
            text-align: right;
        }
        .intro-more{
            color: #02baf0;
            line-height: 24px;
            font-size: .705rem
        }
    </style>
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
                            <a href="{:url("/txt/" . $novel['PrimaryId'],"","html",true)}" onclick="toggleChapter(1);" class="btn-normal white" title="{$novel.Title}TXT下载 "> 下载本书</a>
                        </li>
                        <li class="btn-group-cell">
                            <a href="javascript:void(0)"  data-type="rack" data-id="{$novel.PrimaryId}" class="btn-normal white add-book" title="把{$novel.Title} 加入书架">加入书架</a>
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
    </div>
    <div class="novel tred">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title" onclick="addFav();">最新章节</h3>
                <span>共约{:count($novel.chapter_list)}章</span>
            </div>
            <div class="novel-header-r">
                <a href="{:url("/mulu/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title} 完整目录 ">查看完整目录<svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"></use></svg></a>
            </div>
        </div>
        <ol class="novel-text-list">
            {foreach $novel.last_update_chapter_list as $chapter}
            <li><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}" title="{$chapter.Title}"> {$chapter.Title}<svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"></use></svg></a></li>
            {/foreach}
        </ol>
    </div>
    <div class="novel">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title">猜你喜欢</h3><a name="txt"></a>
            </div>
        </div>
        <div class="novel-slide">
            <ol class="novel-slide-ol">
                {ranking_list cid="$novel.Cid" limit="7"}
                <li class="novel-slide-li">
                    <a href="{:url("/book/" . $ranking['PrimaryId'],array(),"html",true)}" class="novel-slide-a" title="{$ranking.Title}">
                        <img src="__IMAGES__/default.jpg" data-echo="{$ranking.LocalImage | down_image}" class="novel-slide-img" alt="{$ranking.Title}">
                        <div class="novel-slide-caption">{$ranking.Introduction | msubstr=0,120}</div>
                        <p class="novel-slide-author"><span class="gray">{$ranking.Author}</span>
                        </p>
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
                    好书推荐
                </h3>
            </div>
        </div>
        <ol class="book-ol book-ol-normal">
            {random_list cid="$novel.Cid" limit="7"}
            <li class="book-li">
                <a href="{:url("/book/" . $random['PrimaryId'],array(),"html",true)}" class="book-layout" title="{$random.Title} ">
                    <img src="__IMAGES__/default.jpg" data-echo="{$random.LocalImage | down_image}" class="book-cover" alt="{$random.Title}">
                    <div class="book-cell">
                        <h4 class="book-title">{$random.Title}</h4>
                        <p class="book-desc">{$random.Introduction | msubstr=0,120}</p>
                        <div class="book-meta">
                            <div class="book-meta-l">
                                <span class="book-author"><svg class="icon icon-human"><use xlink:href="#icon-human"></use></svg>{$random.Author}</span>
                            </div>
                            <div class="book-meta-r">
                                <span class="tag-small-group origin-right">
                                    <em class="tag-small gray">{$random.Cid | show_cid_name}</em>
                                    <em class="tag-small red">{eq name="$random.Full" value="0"}连载中{else/}已完结{/eq}</em>
<!--                                            <em class="tag-small blue">7人看过</em>-->
                                </span>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
            {/random_list}
        </ol>

    </div>
{/block}
{block name="footer"}
<script src="__STATIC__/layui/layui.js" type="text/javascript"></script>

<script id="chapter_html" type="text/html">
    <dd><a href="{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html" target="_blank">{title}</a></dd>
</script>
<script id="new_chapter_html" type="text/html">
    <li><a href="{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html" target="_blank">{title}</a></li>
</script>

<script>
    var primary_id = "{$novel.PrimaryId}";
    var article_url = "{$novel.source_url | base64_encode}";
    var last_chapter_url = "{$last_chapter.Url | base64_encode}";
    var last_chapter_sort = "{:get_offset_value($last_chapter.Sort)}";
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";

    layui.use(['layer', 'jquery'], function () {
        var layer = layui.layer;
        var $ = layui.jquery;

        $(".add-book").click(function () {
            var id = $(this).data('id');
            var type = $(this).data('type');
            $.post("{:url('/user/add_book')}", {id:id,type:type},function (info) {
                if (info.code == 0) {
                    layer.msg(info.msg + ",加入成功");
                } else {
                    layer.msg(info.msg + ",加入失败");
                }
            });
        });


        $(function() {
            //实际高度
            var infoHeight = $(".cor-introduce").height();
            // alert(infoHeight)
            //默认高度
            var defHeight = 72;
            // 如果高度超出
            if (infoHeight > defHeight) {
                // 给p设置默认高度,隐藏超出部分
                $('.cor-introduce').css('height', defHeight + 'px');
                //加按钮
                $(".introduce-more-box").append('<a href="javascript:;" class="iconfont intro-more">展开&#xeb0b;</a>');

                // 点击按钮
                $(".intro-more").click(function() {
                    var curHeight = $('.cor-introduce').height();
                    if (curHeight == defHeight) {
                        $(".cor-introduce").height("auto");
                        $(this).html('<a href="javascript:;" class="iconfont intro-more">收起&#xeb0a;</a>')
                    } else {
                        $('.cor-introduce').height(defHeight);
                        $(this).html('<a href="javascript:;" class="iconfont intro-more">展开&#xeb0b;</a>');
                    };
                });
            }
        })
    });
</script>
<script src="__STATIC__/js/details_m.js"></script>
{/block}
