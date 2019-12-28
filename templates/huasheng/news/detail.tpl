{extend name="base" /}
{block name="body"}
<!--container-->
<div class="container clearfix">
    <div class="bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        <a href="{:url("/news","","html",true)}">资讯</a> &gt;
        <a href="{:url("/news/" . $news['NewsId'] ,"html",true)}">{$news.Title}</a>
    </div>
    <div class="wrap clearfix">
        <!--primary-->
        <div class="news-info">
            <div class="title">
                <h1>{$news.Title}</h1>
                <p>
                    <span>时间：<em>{$news.CreateTime | date="Y-m-d H:i:s"}</em></span>
                    <span>阅读：<em>{$news.NewsId | show_news_click}</em></span>
                    <span>编辑：<em>{$news.Author}</em></span>
                </p>
            </div>
            {neq name="$news.Introduction" value=""}
            <div class="description">{$news.Introduction}</div>
            {/neq}

            {neq name="$news.Article" value=""}
            <div class="cover">
                <p class="pic"><a title="{$news.Article.Title}" href="{:url("/book/" . $news['Article']['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$news.Article.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$news.Article.Title}"></a></p>
                <p class="stars">推荐指数：<span class="star"><i style="width:80%;">8分</i></span></p>
                <p class="read"><a href="{:url("/book/" . $news['Article']['PrimaryId'],"","html",true)}" target="_blank">{$news.Article.Title}在线阅读全文</a></p>
            </div>
            {/neq}

            <div class="content">
                {neq name="$news.ChapterTitle" value=""}
                <h3>{$news.ChapterTitle}</h3>
                {/neq}
                <?php echo $news['Content'];?>
            </div>
            {neq name="$news.Article" value=""}
            <div class="book">
                <dl class="clearfix">
                    <dt><a href="{:url("/book/" . $news['Article']['PrimaryId'],"","html",true)}" target="_blank"><img class="lazy" src="{$news.Article.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$news.Article.Title}"></a></dt>
                    <dd>
                        <h4>{$news.Article.Title}</h4>
                        <p class="info"><span>作者：{$news.Article.Author}</span><span>类型：{$news.Article.Cid | show_cid_name}</span><span>状态：{eq name="$news.Article.Full" value="1"}已完结{else/}连载中{/eq}</span></p>
                        <p class="intro">{$news.Article.Introduction}</p>
                        <p class="star"><i style="width:80%;"></i></p>
                        <a class="view" href="{:url("/book/" . $news['Article']['PrimaryId'],"","html",true)}" target="_blank">小说详情</a>
                    </dd>
                </dl>
            </div>
            <div class="related">
                <h3>最新章节</h3>
                <ul class="clearfix">
                    {foreach $news.Article.LastUpdateChapterList as $chapter}
                    <li><a target="_blank" href="{:url("/chapter/" . $news['Article']['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$news['Article']['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a><span>{$chapter.CreateTime | date="Y-m-d H:i:s"}</span></li>
                    {/foreach}
                </ul>
            </div>
            {/neq}
            <div class="porn">
                <ul class="clearfix">
                    {neq name="$news.prev_news" value=""}<li>上一篇：<a href="{:url("/news/" . $news['prev_news']['NewsId'],"","html",true)}">{$news.prev_news.Title}</a></li>{else/}<li>上一篇：暂无</li>{/neq}
                    {neq name="$news.next_news" value=""}<li>下一篇：<a href="{:url("/news/" . $news['next_news']['NewsId'],"","html",true)}">{$news.next_news.Title}</a></li>{else/}<li>下一篇：暂无</li>{/neq}
                </ul>
            </div>
            <div class="related">
                <h3>相关文章</h3>
                <ul class="clearfix">
                    {random_new_list limit="5" }
                    <li><a target="_blank" href="{:url("/news/" . $random_new['NewsId'],"","html",true)}">{$random_new.Title}</a><span>{$random_new.CreateTime | date="Y-m-d"}</span></li>
                    {/random_new_list}
                </ul>
            </div>
        </div>
        <!--/primary-->
        <!--side-->
        <div class="side-bar">
            <!--hot-news-->
            <div class="hot-news">
                <h3>热门资讯</h3>
                <ul>
                    {hot_new_list cid="$news.Cid" limit="5" }
                    <li class="s{$index + 1}"><em>{$index + 1}</em><a href="{:url("/news/" . $hot_new['NewsId'],"","html",true)}" target="_blank">{$hot_new.Title}</a></li>
                    {/hot_new_list}
                </ul>
            </div>
            <!--new-book-->
            <div class="new-book">
                <h3>随机小说</h3>
                <ul>
                    {random_list limit="10"}
                    <li>
                        <a class="pic" title="{$random.Title}" href="{:url("/book/" . $random['PrimaryId'],"","html",true)}"><img src="{$random.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'" alt="{$random.Title}"></a>
                        <h5><a href="{:url("/book/" . $random['PrimaryId'],"","html",true)}" title="{$random.Title}">{$random.Title}</a></h5>
                        <p>分类：{$random.Cid | show_cid_name}</p>
                        <p>状态：{eq name="$random.Full" value="1"}已完结{else/}连载中{/eq}</p>
                    </li>
                    {/random_list}
                </ul>
            </div>
        </div>
        <!--/side-->
    </div>
</div>
<!--/container-->
{/block}