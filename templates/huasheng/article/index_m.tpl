{extend name="base_m" /}
{block name="mip"}
    {include file="mip" /}
{/block}
{block name="body"}
<!--header-->
<div class="header">
    <a href="javascript:history.go(-1);"><span class="icon-back"></span></a>
    <h1>{$novel.Title}</h1>
    <span class="icon-grouop"><span class="icon-search"></span><span class="icon-menu"></span></span>
</div>
{include file="top_menu" /}

<div class="wrap wrap-info">
    <!--main-->
    <!--info-->
    <div class="mod mod-info">
        <div class="book-info">
            <dl class="base clearfix">
                <dt>
                    <img class="lazy" src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" />
                    {eq name="$novel.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}
                </dt>
                <dd>
                    <h2>{$novel.Title}</h2>
                    <p class="info">
                        <span>时间：{$novel.UpdateTime | date="Y-m-d H:i:s"}</span>
                        <span>分类：{$novel.Cid | show_cid_name}</span>
                        <span>作者：{$novel.Author}</span>
                    </p>
                </dd>
            </dl>
            <div class="btns">
                <ul>
                    <li><a class="read-online" href="{$novel.FirstChapterUrl}">在线阅读</a></li>
                </ul>
            </div>
            <div class="intro">
                <p>{$novel.Introduction}</p>
            </div>
            <!--tags-->
            <!--<div class="tags clearfix">-->
                <!--<p>-->
                    <!--<span>本书标签：</span>-->
                    <!--<a href="/tags/5.html">都市小说</a><a href="/tags/86.html">辣文合集</a>                </p>-->
            <!--</div>-->
        </div>
    </div>
    <!--attentions-->
    <div class="mod mod-attentions">
        <div class="mod-head">
            <h3>最新章节：</h3>
        </div>
        <!--attentions-->
        <div class="attentions">
            <ul class="clearfix">
                {foreach $novel.LastUpdateChapterList as $chapter}
                <li> <a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></li>
                {/foreach}
            </ul>
        </div>
    </div>
    <!--chapters-->
    <!--review-->
    <div class="mod mod-review">
        <div class="review-more"><a href="{:url("/mulu/" . $novel['PrimaryId'])}">查看全部章节</a></div>
    </div>
    <!-- rec-book -->
    <div class="mod rec-book">
        <div class="mod-head">
            <h3>{$novel.Cid | show_cid_name}</h3>
        </div>
        <div class="book-list">
            <ul class="clearfix">
                {random_list cid="$novel.Cid" limit="5"}
                <li>
                    <img class="pic lazy" src="{$random.LocalImage | down_image}" alt="{$random.Title}" />
                    <a class="tit" href="{:url("/book/" . $random['PrimaryId'])}">{$random.Title}</a>
                    <p class="intro">{$random.Introduction}</p>
                    <p class="info"><span><aria>作者：</aria>{$random.Author}</span><em class="type">{$random.Cid | show_cid_name}</em>{eq name="$random.Full" value="1"}<em class="finish">已完结</em>{else/}<em class="serial">连载中</em>{/eq}</p>
                </li>
                {/random_list}
            </ul>
        </div>
    </div>
    <!--/main-->
</div>
{/block}
