{extend name="base" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__CSS__/author.css"/>
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect('{:url("/author/" . urlencode($author),array(),"html","m")}');</script>
{/block}
{block name="body"}
<div class="author-info">
    <h2><a href="{:url('/author/' . urlencode($author))}">{$author}</a>简介：</h2>
    <p><a href="{:url('/author/' . urlencode($author))}" title="{$author}">{$author}</a>是一名出色的小说作者，他的作品包括：
        {foreach $list as $novel}
        <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title} 作者：{$novel.Author}">{$novel.Title}</a>、
        {/foreach}
        等，本本精品，字字珠玑，{$author}的小说情节跌宕起伏、扣人心弦，情节与文笔俱佳。<a href="{$site_config.site_domain}" title="{$site_config.site_name}">{$site_config.site_name}</a>强烈建议您到正版网站阅读{$author}的作品，您的每一次阅读都是对作者<a href="{:url('/author/' . urlencode($author))}">{$author}</a>的认可！如果您在<a href="{$site_config.site_domain}" title="{$site_config.site_name}">{$site_config.site_name}</a>阅读<strong>{$author}</strong>作品时，遇到问题，请及时反馈，我们将第一时间解决，争取为您奉上更新更精彩的作品。
    </p>
</div>
<div class="author-list-title"><a href="{:url('/author/' . urlencode($author))}">{$author}</a>作品集</div>
<div class="author-list author-list-top cf">
    {foreach $list as $novel}
    <dl>
        <dt><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" onerror="this.src='__IMAGES__/nopic.gif'" /></a></dt>
        <dd><h3><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></h3><span>{$novel.Author}</span>
            <p>{$novel.Introduction}</p></dd>
    </dl>
    {/foreach}
</div>
{/block}