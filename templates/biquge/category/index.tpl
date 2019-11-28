{extend name="base" /}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{:url('/' . $category['alias'],array(),'','m')}");</script>
{/block}
{block name="body"}
    <div id="main">
        <div id="hotcontent">
            <div class="ll">
                {foreach $novel_list['block'] as $index => $novel}
                {lt name="$index" value="6"}
                <div class="item">
                    <div class="image">
                        <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" width="120" height="150" onerror="this.src='__IMAGES__/nopic.gif'" /></a></div>
                    <dl>
                        <dt><a href="{:url('/author/' . urlencode($novel.Author) )}"><span>{$novel.Author}</span></a><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></dt>
                        <dd>{$novel.Introduction}</dd>
                    </dl>
                    <div class="clear"></div>
                </div>
                {/lt}
                {/foreach}
            </div>
        </div>
        <div id="newscontent">
            <div class="l">
                <h2>{$category.name}最近更新列表</h2>
                <ul>
                    {foreach $novel_list['list'] as $novel}
                    <li><span class="s1"><a href="{:url("/" . show_cid_alias($novel.Cid),"","",true)}" target="_blank">[{$category.name}]</a></span><span class="s2"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></span><span class="s3"><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" target="_blank">{$novel.LastChapterTitle}</a></span><span class="s4"><a href="{:url('/author/' . urlencode($novel.Author) )}">{$novel.Author}</a></span><span class="s5">{$novel.UpdateTime | date="Y-m-d"}</span></li>
                    {/foreach}
                </ul>
            </div>

            <div class="r">
                <h2>好看的{$category.name}小说</h2>
                <ul>
                    {foreach $novel_list['block'] as $index => $novel}
                    {gt name="$index" value="6"}
                    <li><span class="s1">[{$category.name}]</span><span class="s2"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></span><a href="{:url('/author/' . urlencode($novel['Author']) )}"><span class="s5">{$novel.Author}</span></a></li>
                    {/gt}
                    {/foreach}
                </ul>
            </div>
            <div class="clear"></div>
            <?php echo $pages;?>
        </div>
    </div>
{/block}