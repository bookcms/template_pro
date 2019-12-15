{extend name="base" /}
{block name="header"}
<meta http-equiv="mobile-agent" content="format=html5; url={:url("/mulu/" . $novel['PrimaryId'],"","html","m")}" />
<meta http-equiv="mobile-agent" content="format=xhtml; url={:url("/mulu/" . $novel['PrimaryId'],"","html","m")}" />
{/block}
{block name="uaredirect"}
<script type="text/javascript">uaredirect('{:url("/mulu/" . $novel['PrimaryId'],array(),"html","m")}');</script>
{/block}
{block name="body"}
<div class="main">
    <div class="layui-main">
        <div class="box">
            <div class="path"><a href="{$site_config.site_domain}" class="layui-icon i_home"></a><i>&gt;</i><a href="{:url("/" . show_cid_alias($novel.Cid),"","",true)}">{$novel.Cid | show_cid_name}</a><i>&gt;</i><a href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}">{$novel.Title}</a><i>&gt;</i><b>最新章节列表</b></div>
        </div>
        <div class="box">
            <div class="headline">
                <h1>{$novel.Title}</h1>
                <h2>文 / <a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></h2>
                <p>分类：<a href="/sort/xhmf_0_0_lastupdate_1.html">{$novel.Cid | show_cid_name}</a></p>
                <p>章节：<span class="layui-badge-rim layui-icon i_">{:count($novel['chapter_list'])}</span></p>
<!--                <p>点击：<span class="layui-badge-rim layui-icon i_visit"> 7</span></p>-->
<!--                <p>下载：<span class="layui-badge-rim layui-icon i_vote"> 0</span></p>-->
                <p>更新：<span class="layui-badge-rim layui-icon i_history">{$novel.UpdateTime | date="Y-m-d H:i:s"}</span></p>
            </div>
            <div class="read">
                <dl>
                    <dt><b>{$novel.Title}全部章节</b></dt>
                    {foreach $novel.chapter_list as $chapter}
                    <dd style="width: 340px;"><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}<span class="time">更新：{$novel.UpdateTime | date="Y-m-d H:i:s"}</span></a></dd>
                    {/foreach}
                </dl>
            </div>
        </div>
    </div>
</div>
{/block}