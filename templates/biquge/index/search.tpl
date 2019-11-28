{extend name="base" /}
{block name="body"}
<div id="main">
    <div id="hotcontent">
        <div class="l2">
            <h2>搜索"{$keyword}"相关小说"</h2>

            {foreach $list as $novel}
            <div class="item">
                <div class="image">
                    <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" width="120" height="150" onerror="this.src='__IMAGES__/nopic.gif'"/></a></div>
                <dl>
                    <dt><span>{$novel.Author}</span><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></dt>
                    <dd>
                        {$novel.Introduction}
                    </dd>
                </dl>
                <div class="clear">
                </div>
            </div>
            {/foreach}
        </div>
    </div>
    <div class="clear"></div>
</div>
{/block}