{extend name="base" /}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url='{:url("/search/" . urlencode($keyword),array(),"html","m")}'" />
{/block}
{block name="body"}

<div class="main">
    <div class="layui-main">
        <div class="box left w_840">
            <div class="title lite">
                <h1>搜索 “{$keyword}” 结果</h1>
            </div>
            <ul class="library">
                {foreach $list as $novel}
                <li>
                    <a class="bookimg" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                    <a class="bookname" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <span class="layui-badge {eq name="$novel.Full" value='0'}layui-bg-blue{/eq}">{eq name="$novel.Full" value='0'}连载中{else/}已完结{/eq}</span>
                    <p>作者：<a class="author" href="{:url('/author/' . urlencode($novel.Author))}">{$novel.Author}</a><i>|</i>{$novel.Cid | show_cid_name}<i>|</i>{$novel.UpdateTime | date="Y-m-d"}</p>
                    <p class="intro">{$novel.Introduction}</p>
                    <a class="chapter" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.LastChapterTitle}</a>
                </li>
                {/foreach}
            </ul>
            <div class="clear"></div>
        </div>
<!--        <div class="box right w_260">-->
<!--            <div class="title lite">-->
<!--                <p>热门搜索</p>-->
<!--            </div>-->
<!--            <ul class="list">-->

<!--                <li>-->
<!--                    <p class="bookname"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">猛兽博物馆</a></p>-->
<!--                    <p class="author">作者：<a href="/author/953">暗黑茄子</a></p>-->
<!--                </li>-->

<!--            </ul>-->
<!--        </div>-->
    </div>
</div>

{/block}