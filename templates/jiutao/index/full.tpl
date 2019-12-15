{extend name="base" /}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{:url('/full',array(),'html','m')}");</script>
{/block}
{block name="body"}
<div class="main">
    <div class="layui-main">
        <div class="box left w_740" style="margin-top: 21px">
            <div class="title caption">
                <h1>完本小说</h1>
            </div>
            <div class="table">
                <table class="layui-table" lay-even lay-skin="nob">
                    <thead>
                    <tr>
                        <th width="65">分类</th>
                        <th width="125">书名</th>
                        <th>最新章节</th>
                        <th width="90">作者</th>
                        <th width="100">更新</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach $full_list as $novel}
                    <tr>
                        <td><a class="light" href="{:url("/" . show_cid_alias($novel.Cid) ,"","",true)}">{$novel.Cid | show_cid_name}</a></td>
                        <td><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></td>
                        <td><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.LastChapterTitle}</a></td>
                        <td><a href="/author/150">{$novel.Author}</a></td>
                        <td>{$novel.UpdateTime | date="Y-m-d"}</td>
                    </tr>
                    {/foreach}
                    </tbody>
                </table>
            </div>
            <div class="clear"></div>
            <?php echo $pages;?>
        </div>
        <div class="box right w_360">
            <div class="title tab">
                <ul class="nav">
                    <li class="on"><a id="votenum" href="javascript:void(0)">推荐榜</a></li>
                </ul>
                <h2>热门全本</h2>
            </div>
            <div class="list tab">
                <ul class="rank">
                    {hot_full_list limit="26"}
                    <li {eq name="$index" value="0"}class="on"{/eq}>
                    <a href="{:url('/book/' . $hot_full['PrimaryId'],'','html',true)}"><img src="{$hot_full.LocalImage | down_image}" alt="{$hot_full.Title}"></a>
                        {if $index == 0}<i class="layui-bg-red">{$index+1}</i>{elseif $index == 1 /}<i class="layui-bg-orange">{$index+1}</i>{elseif $index == 2 /}<i class="layui-bg-blue">{$index+1}</i>{else/}<i class="layui-bg-cyan">{$index+1}</i>{/if}
                        <p class="bookname"><a href="{:url('/book/' . $hot_full['PrimaryId'],'','html',true)}" title="{$hot_full.Title}在线阅读_{$hot_full.Title}TXT免费下载">{$hot_full.Title}</a></p>
                        <p class="intro">{$hot_full.Introduction | msubstr=0,20}</p>
                        <p class="author">作者：<a href="{:url('/author/' . urlencode($hot_full['Author']) )}" title="{$hot_full.Author}作品全集">{$hot_full.Author}</a></p>
                        <p>分类：<a href="{:url("/" . show_cid_alias($hot_full.Cid),"","",true)}" title="更多{:show_cid_name($hot_full.Cid)}小说">{:show_cid_name($hot_full.Cid)}</a></p>
                    </li>
                    {/hot_full_list}
                </ul>
            </div>
        </div>
    </div>
</div>

{/block}