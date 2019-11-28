{extend name="base" /}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{:url('/full',array(),'html','m')}");</script>
{/block}
{block name="body"}
<div id="main">
    <div id="hotcontent">
        <div class="ll">

            {block_list block_id="4" limit="6"}
            <div class="item">
                <div class="image">
                    <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}" width="120" height="150" onerror="this.src='__IMAGES__/nopic.gif'"/></a></div>
                <dl>
                    <dt><span>{$novel.Author}</span><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></dt>
                    <dd>{$novel.Introduction}</dd>
                </dl>
                <div class="clear">
                </div>
            </div>
            {/block_list}


        </div>
    </div>
    <div id="newscontent">
        <div class="full">
            <h2>好看的完本小说最近更新列表</h2>
            <ul>
                {foreach $full_list as $novel}
                <li><span class="s1"><a href="{:url("/" . show_cid_alias($novel.Cid) ,"","",true)}" target="_blank">[{$novel.Cid | show_cid_name}]</a></span><span class="s2"><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" target="_blank">{$novel.Title}</a></span><span class="s3"><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" target="_blank">{$novel.LastChapterTitle}</a></span><span class="s5">{$novel.Author}&nbsp;&nbsp;&nbsp;{$novel.UpdateTime | date="Y-m-d"}</span></li>
                {/foreach}
            </ul>
        </div>
        <div class="clear"></div>
        <?php echo $pages;?>
    </div>
</div>

{/block}