{extend name="base_m" /}
{block name="header"}
{/block}
{block name="body"}
<!--header-->
<div class="header">
    <a href="javascript:history.go(-1);"><span class="icon-back"></span></a>
    <h1>资讯</h1>
    <span class="icon-grouop"><span class="icon-search"></span><span class="icon-menu"></span></span>
</div>
{include file="top_menu" /}

<!--wrap-->
<div class="wrap">
    <!--main-->
    <!-- new-news -->
    <div class="mod mod-news">
        <div class="news-list">
            <ul class="clearfix">
                {foreach $list as $news}
                <li><a href="{:url("/news/" . $news['NewsId'],"","html",true)}">{$news.Title}</a><span>{$news.CreateTime | date="Y-m-d"}</span></li>
                {/foreach}
            </ul>
            <?php echo $pages;?>
        </div>
    </div>
    <!-- /new-news -->
    <!-- hot-news -->
    <div class="mod hot-news">
        <div class="mod-head">
            <h3>热门资讯</h3>
        </div>
        <div class="news-list">
            <ul class="clearfix">
                {hot_new_list limit="10" }
                <li><a href="{:url("/news/" . $hot_new['NewsId'],"","html",true)}">{$hot_new.Title}</a><span>{$hot_new.CreateTime | date="Y-m-d"}</span></li>
                {/hot_new_list}
            </ul>
        </div>
    </div>
    <!-- /hot-news -->
    <!--/main-->
</div>
{/block}