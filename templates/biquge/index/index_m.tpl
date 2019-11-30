{extend name="base_m" /}
{block name="header"}
    <link rel="canonical" href="{$site_config.site_domain}"/>
{/block}
{block name="body"}

<div class="article">
    <h2 class="title"><span>封面强推</span></h2>
    {block_list block_id="1"}
    <div class="block">
        <div class="block_img"><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}"><img height=100 width=80 src="{$block.LocalImage | down_image}" onerror="this.src='__IMAGES__/nopic.gif'"/></a>
        </div>
        <div class="block_txt">
            <p><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}"><h2>{$block.Title}</h2></a></p>
            <p>作者：<a href="{:url('/author/' . urlencode($block['Author']) )}">{$block.Author}</a></p>
            <p><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}">{$block.Introduction}</a></p>
        </div>
        <div style="clear:both"></div>
    </div>
    {/block_list}

</div>
{foreach $site_config.category_list as $category}
<div class="article">
    <h2 class="title"><span><a href="/{$category.alias}">{$category.name}</a></span><a href="/{$category.alias}">更多...</a></h2>
    <div class="block">
        <ul>
            {novel_list cid_list='$category.cid_list' offset="0" limit="6"}
            <li><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" class="blue">{$novel.Title}</a>/<a href="{:url('/author/' . urlencode($novel['Author']) )}">{$novel.Author}</a></li>
            {/novel_list}
        </ul>
    </div>
</div>
{/foreach}
{/block}