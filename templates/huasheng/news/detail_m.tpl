{extend name="base_m" /}
{block name="body"}
<!--header-->
<div class="header">
    <a href="javascript:history.go(-1);"><span class="icon-back"></span></a>
    <span class="icon-grouop"><span class="icon-search"></span><span class="icon-menu"></span></span>
</div>
{include file="top_menu" /}
<!--wrap-->
<div class="wrap">
    <!--main-->
    <!-- new-news -->
    <div class="mod mod-news-info">
        <div class="news-info book-info">
            <div class="title">
                <h1>{$news.Title}</h1>
                <p><span><aria>时间：</aria>{$news.CreateTime | date="Y-m-d H:i:s"}</span><span><aria>编辑：</aria>{$news.Author}</span></p>
            </div>
            {neq name="$news.Article" value=""}
            <dl class="base clearfix">
                <dt>
                    <img class="lazy" src="{$news.Article.LocalImage | down_image}" alt="{$news.Article.Title}" />
                    {eq name="$news.Article.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}
                </dt>
                <dd>
                    <h2>{$news.Article.Title}</h2>
                    <p class="info">
                        <span>分类：{$news.Article.Cid | show_cid_name}</span>
                        <span>作者：{$news.Article.Author}</span>
                        <span>时间：{$news.Article.CreateTime | date="Y-m-d H:i:s"}</span>
                    </p>
                </dd>
            </dl>
            <div class="btns">
                <ul>
                    <li><a class="read-online" href="{:url("/book/" . $news.Article.PrimaryId,"","html",true)}">在线阅读</a></li>
                </ul>
            </div>
            {/neq}
            {neq name="$news.Introduction" value=""}
            <div class="description">{$news.Introduction}</div>
            {/neq}

            <div class="content">
                {neq name="$news.ChapterTitle" value=""}
                <h3>{$news.ChapterTitle}</h3>
                {/neq}
                <?php echo $news['Content'];?>
            </div>
            <div class="porn">
                <ul>
                    {neq name="$news.prev_news" value=""}<li>上一篇：<a href="{:url("/news/" . $news['prev_news']['NewsId'],"","html",true)}">{$news.prev_news.Title}</a></li>{else/}<li>上一篇：没有上一篇!</li>{/neq}
                    {neq name="$news.next_news" value=""}<li>下一篇：<a href="{:url("/news/" . $news['next_news']['NewsId'],"","html",true)}">{$news.next_news.Title}</a></li>{else/}<li>下一篇：没有下一篇!</li>{/neq}
                </ul>
            </div>
        </div>
    </div>

    {neq name="$news.Article" value=""}
    <!-- rerated-news -->
    <div class="mod rerated-news">
        <div class="mod-head">
            <h3>最新章节</h3>
        </div>
        <div class="news-list">
            <ul class="clearfix">
                {foreach $news.Article.LastUpdateChapterList as $chapter}
                <li><a target="_blank" href="{:url("/chapter/" . $news.Article['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$news.Article['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a><span>{$chapter.CreateTime | date="Y-m-d H:i:s"}</span></li>
                {/foreach}
            </ul>
        </div>
    </div>
    {/neq}
    <div class="mod rerated-news">
        <div class="mod-head">
            <h3>相关文章</h3>
        </div>
        <div class="news-list">
            <ul class="clearfix">
                {random_new_list limit="10"}
                <li><a target="_blank" href="{:url("/news/" . $random_new['NewsId'],"","html",true)}">{$random_new.Title}</a><span>{$random_new.CreateTime | date="Y-m-d"}</span></li>
                {/random_new_list}
            </ul>
        </div>
    </div>
    <!-- new-book -->
    <div class="mod new-book">
        <div class="mod-head">
            <h3>随机小说</h3>
        </div>
        <div class="book-slide">
            <ul class="clearfix">
                {random_list limit="8"}
                <li><a href="{:url("/book/" . $random['PrimaryId'],"","html",true)}"><img class="lazy" src="{$random.LocalImage | down_image}" alt="{$random.Title}" /><span>{$random.Title}</span><em><aria>作者：</aria>{$random.Author}</em></a></li>
                {/random_list}
            </ul>
        </div>
    </div>
    <!--/main-->
</div>
{/block}
