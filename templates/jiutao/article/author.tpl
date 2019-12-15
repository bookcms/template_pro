{extend name="base" /}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect('{:url("/author/" . urlencode($author),array(),"html","m")}');</script>
{/block}
{block name="body"}
<div class="main">
    <div class="layui-main">
        <div class="box left w_840">
            <div class="title lite">
                <h1>{$author} 作品集</h1>
            </div>
            <ul class="list">
                {foreach $list as $novel}
                <li class="on">
                    <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                    <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <span class="layui-badge {eq name="$novel.Full" value='0'}layui-bg-blue{/eq}">{eq name="$novel.Full" value='0'}连载中{else/}已完结{/eq}</span>
                    <p class="action">
                        <a href="/4459_R1.html">点击阅读</a>
                        <a href="javascript:void(0)">加入书架</a>
                    </p>
                    <p>分类：<a href="{:url('/classify/' . show_cid_alias($novel['Cid']))}">{$novel.Cid | show_cid_name}</a>
<!--                        <em>|</em><span class="layui-badge-rim layui-icon i_visit"> 35</span>-->
                    </p>
                    <p class="intro">{$novel.Introduction}</p>
                    <p class="chapter">最新章节：<a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.LastChapterTitle}</a><em>|</em>{$novel.UpdateTime | date="Y-m-d"}</p>
                </li>
                {/foreach}
            </ul>
        </div>
        <div class="box right w_260">
            <div class="title lite">
                <p>热门作家</p>
            </div>
            <ul class="list">
                <ul>
                    {random_list cid="0" limit="18"}
                    <li><div class="right"><span class="layui-badge-rim">作品集</span></div><a href="{:url('/author/' . urlencode($random['Author']))}">{$random.Author}</a></li>
                    {/random_list}
                </ul>
            </ul>
        </div>
    </div>
</div>

{/block}


