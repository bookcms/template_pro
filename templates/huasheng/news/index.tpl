{extend name="base" /}
{block name="header"}
{/block}
{block name="body"}
<!--container-->
<div class="container clearfix">
    <div class="bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        <a href="{:url("/news","","html",true)}">资讯</a>
    </div>
    <div class="wrap clearfix">
        <!--primary-->
        <div class="news-list">
            <h2>共<em>{$total}</em>篇文章</h2>
            <ul class="list">
                {foreach $list as $news}
                <li>
                    <a class="pic" title="{$news.Title}" href="{:url("/news/" . $news['NewsId'],"","html",true)}" target="_blank"><img class="lazy" src="{$news.LocalImage | down_image}" alt="{$news.Title}"></a>
                    <h5 class="tit"><a href="{:url("/news/" . $news['NewsId'],"","html",true)}" target="_blank">{$news.Title}</a></h5>
                    <p class="info"><span>发布时间：<em>{$news.CreateTime | date="Y-m-d"}</em></span><span>编辑：{$news.Author}</span></p>
                    <p class="text">{$news.Introduction}</p>
                </li>
                {/foreach}
            </ul>

            <?php echo $pages;?>
        </div>
        <!--/primary-->

        <!--side-->
        <div class="side-bar">
            <!--hot-news-->
            <div class="hot-news">
                <h3>随机资讯</h3>
                <ul>
                    {random_new_list limit="10"}
                    <li class="s{$index + 1}"><em>{$index + 1}</em><a href="{:url("/news/" . $random_new['NewsId'],"","html",true)}" target="_blank">{$random_new.Title}</a></li>
                    {/random_new_list}
                </ul>
            </div>
            <!--new-book-->
            <div class="new-book">
                <h3>随机小说</h3>
                <ul>
                    {random_list limit="10"}
                    <li>
                        <a class="pic" title="{$random.Title}" href="{:url("/book/" . $random['PrimaryId'],"","html",true)}"><img src="{$random.LocalImage | down_image}" alt="{$random.Title}"></a>
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