{extend name="base" /}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url={$site_config.mobile_domain}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={$site_config.mobile_domain}" />
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{$site_config.mobile_domain}");</script>
{/block}
{block name="body"}

    <div id="main">
        <div id="hotcontent">
            <div class="l">
                {block_list block_id="1" limit="4"}
                <div class="item">
                    <div class="image">
                        <a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}"><img src="{$block.LocalImage | down_image}" alt="{$block.Title}" width="120" height="150" onerror="this.src='__IMAGES__/nopic.gif'"/></a></div>
                    <dl>
                        <dt><span>{$block.Author}</span><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}">{$block.Title}</a></dt>
                        <dd>{$block.Introduction}</dd>
                    </dl>
                    <div class="clear">
                    </div>
                </div>
                {/block_list}
            </div>
            <div class="r">
                <h2>上期强推</h2>
                <ul>
                    {block_list block_id="2" limit="8"}
                    <li><span class="s2"><a href="{:url("/book/" . $block['PrimaryId'],"","html",true)}">{$block.Title}</a></span><span class="s5">{$block.Author}</span></li>
                    {/block_list}
                </ul>
            </div>
            <div class="clear">
            </div>
        </div>
        {foreach $all_category_list as $category_list}
        <div class="novelslist">
            {foreach $category_list as $index => $category}
            <div class="content {eq name="$index" value="2"}border{/eq} ">
                <h2><a href="/{$category.alias}" target="_blank">{$category.name}</a></h2>
                {novel_list cid_list="$category.cid_list" offset="0" limit="1"}
                <div class="top">
                    <div class="image">
                        <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" width="67" height="82" onerror="this.src='__IMAGES__/nopic.gif'"/></a></div>
                    <dl>
                        <dt><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"> {$novel.Title}</a></dt>
                        <dd>{$novel.Introduction}</dd>
                    </dl>
                    <div class="clear">
                    </div>
                </div>
                {/novel_list}
                <ul>
                    {novel_list cid_list="$category.cid_list" offset="1" limit="10"}
                    <li><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>/<a href="{:url('/author/' . urlencode($novel['Author']) )}">{$novel.Author}</a></li>
                    {/novel_list}
                </ul>
            </div>
            {/foreach}
            <div class="clear"></div>
        </div>
        {/foreach}
        <div id="newscontent">
            <div class="l">
                <h2> 最近更新小说列表</h2>
                <ul>
                    {foreach $lastUpdateData as $novel}
                    <li><span class="s1"><a href="{:url("/" . show_cid_alias($novel.Cid) ,"","",true)}" target="_blank">[{$novel.Cid | show_cid_name}]</a></span><span class="s2"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></span><span class="s3"><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" target="_blank">{$novel.LastChapterTitle}</a></span><a href="{:url('/author/' . urlencode($novel['Author']))}"><span class="s4">{$novel.Author}</span></a><span class="s5">{$novel.UpdateTime | date="Y-m-d"}</span></li>
                    {/foreach}
                </ul>
            </div>
            <div class="r">
                <h2>
                    最新入库小说</h2>
                <ul>
                    {foreach $lastInsertData as $novel}
                    <li><span class="s1"><a href="{:url("/" . show_cid_alias($novel.Cid),"","",true)}" target="_blank">[{$novel.Cid | show_cid_name}]</a></span><span class="s2"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></span><a href="{:url('/author/' . urlencode($novel['Author']) )}"><span class="s5">{$novel.Author}</span></a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
    <div id="firendlink">
        友情连接：
        {foreach $site_config.links as $link}
        <a href="{$link.url}" target="_blank">{$link.name}</a>
        {/foreach}
    </div>
{/block}