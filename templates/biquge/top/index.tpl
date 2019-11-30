{extend name="base" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__STATIC__/css/top_pc.css">
{/block}
{block name="uaredirect"}
<script type="text/javascript">uaredirect("{:url('/top',array(),'html','m')}");</script>
{/block}
{block name="body"}
<div id="main">
    {foreach $ranking_list as $index => $ranking}
    <div class="index_toplist mbottom {if ($index + 1) % 3 != 0 }mright{/if}">
        <div class="top-tab">
            <span>{$ranking.name}排行</span>
            <span class="tabRight">
                <span onmouseover="setTab('cid_{$ranking.cid}',1,3,'cur','')" class="cur" id="cid_{$ranking.cid}_1">阅读</span>
                <span onmouseover="setTab('cid_{$ranking.cid}',2,3,'cur','')" id="cid_{$ranking.cid}_2" class="">收藏</span>
                <span onmouseover="setTab('cid_{$ranking.cid}',3,3,'cur','')" id="cid_{$ranking.cid}_3" class="">推荐</span>
            </span>
        </div>
        <div id="tab-data">
            <div class="top-book-list" id="con_cid_{$ranking.cid}_1" style="display: block;">
                <ul>
                    {foreach $ranking.top_list as $key => $novel}
                    <li><span class="hits">{$novel.UpdateTime | date="m-d"}</span><span class="author">{$novel.Author}</span><span class="num">{$key + 1}.</span><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title}" target="_blank">{$novel.Title}</a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="top-book-list" id="con_cid_{$ranking.cid}_2" style="display: none;">
                <ul>
                    {foreach $ranking.collect_list as $key => $novel}
                    <li><span class="hits">{$novel.UpdateTime | date="m-d"}</span><span class="author">{$novel.Author}</span><span class="num">{$key + 1}.</span><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title}" target="_blank">{$novel.Title}</a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="top-book-list" id="con_cid_{$ranking.cid}_3" style="display: none;">
                <ul>
                    {foreach $ranking.block_list as $key => $novel}
                    <li><span class="hits">{$novel.UpdateTime | date="m-d"}</span><span class="author">{$novel.Author}</span><span class="num">{$key + 1}.</span><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title}" target="_blank">{$novel.Title}</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
    {/foreach}
</div>
{/block}
{block name="footer"}
<script type="text/javascript">
    //滑动门
    function setTab(name, cur_sel, n, currentClass, otherClass) {
        for (i = 1; i <= n; i++) {
            var menu = document.getElementById(name + '_' + i);
            var con = document.getElementById("con_" + name + "_" + i);
            menu.className = i == cur_sel ? currentClass : otherClass;
            con.style.display = i == cur_sel ? "block" : "none";
        }
    }
</script>
{/block}

