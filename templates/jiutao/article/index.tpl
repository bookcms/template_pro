{extend name="base" /}
{block name="mip"}
    {include file="mip" /}
{/block}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url={:url("/book/" . $novel['PrimaryId'],"","html","m")}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={:url("/book/" . $novel['PrimaryId'],"","html","m")}" />
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect('{:url("/book/" . $novel['PrimaryId'],array(),"html","m")}');</script>
{/block}
{block name="body_class"}article-id="{$novel.PrimaryId}"{/block}
{block name="body"}
<div class="main">
    <div class="layui-main">
        <div class="box">
            <div class="path"><a href="{$site_config.site_domain}" class="layui-icon i_home"></a><i>&gt;</i><a href="{:url("/" . show_cid_alias($novel.Cid),"","",true)}">{$novel.Cid | show_cid_name}</a><i>&gt;</i><b>{$novel.Title}</b></div>
        </div>
        <div class="left w_860">
            <div class="box">
                <div class="detail">
                    <a class="bookimg" href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                    <h1>{$novel.Title}</h1>
                    <p>
                        作者：<a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a>
                        分类：<a href="{:url("/" . $novel.category.alias,"","",true)}">{$novel['category']['name']}</a>
<!--                        点击：<span class="layui-badge-rim layui-icon i_visit"> 288</span>-->
<!--                        下载：<span class="layui-badge-rim layui-icon i_vote"> 8</span>-->
                        更新：<span class="layui-badge-rim layui-icon i_history"> {$novel.UpdateTime | date="Y-m-d H:i"}</span>
                    </p>
                    <div class="mod">
                        <p class="intro">{$novel.Introduction}</p>
                        <p id="expand">[+展开]</p>
                        <p class="action">
                            <a href="{:url("/chapter/" . $novel.PrimaryId . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">阅读最新</a>
                            <a href="{:url("/txt/" . $novel['PrimaryId'],array(),"html",true)}">下载本书</a>
                            <a href="javascript:void(0);" class="add-book" data-type="rack" data-id="{$novel.PrimaryId}">加入书架</a>
                            <a href="{:url("/mulu/" . $novel['PrimaryId'],array(),"html",true)}">查看目录</a>
                        </p>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="box">
                <div class="title lite">
                    <p>免责声明</p>
<!--                    <div class="more"><span class="layui-badge-rim layui-icon i_history"><font color="red">第449章 又一块青铜碎片</font></span></div>-->
                </div>
                <div class="content">
                    <p style="font-size: 14px;">① 《<strong><a href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}">{$novel.Title}</a></strong>》为作者<strong><a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></strong>原创作品，<strong><a href="{$site_config.site_domain}">{$site_config.site_name}</a></strong>为大家提供最新最快最舒适的阅读体验，请大家支持正版。</p>
                    <p style="font-size: 14px;">② 《<strong><a href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}">{$novel.Title}</a></strong>》为作者<strong><a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></strong>所著虚构作品，如有雷同，纯属巧合。</p>
                    <p style="font-size: 14px;">③  <strong><a href="{$site_config.site_domain}">{$site_config.site_name}</a></strong>提供一键登录，登录后可永久收藏《<strong><a href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}">{$novel.Title}</a></strong>》，方便即时阅读《<strong><a href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}">{$novel.Title}</a></strong>》最新章节，这是对作者<strong><a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></strong> 的强力支持，相信<strong><a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></strong>会给我们提供更多更好的作品。</p>
                </div>
            </div>
            <div class="box">
                <div class="title lite">
                    <p>{$novel.Title}最新章节</p>
                    <span class="more"><a href="{:url("/mulu/" . $novel['PrimaryId'],array(),"html",true)}"><p>共有约{$novel.chapter_total}章  </a></span>
                </div>
                <div class="read new">
                    <dl class="list">
                        {foreach $novel.last_update_chapter_list as $chapter}
                        <dd> <a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}" title="{$chapter.Title}">{$chapter.Title}<span class="time">更新：{$novel.UpdateTime | date="Y-m-d H:i:s"}</span></a></dd>
                        {/foreach}
                    </dl>
                </div>
            </div>
        </div>
        <div class="right w_280">
<!--            <div class="box">-->
<!--                <div class="title lite">-->
<!--                    <p>作者作品</p>-->
<!--                    <a class="more" href="{:url('/author/' . urlencode($novel['Author']))}">更多</a>-->
<!--                </div>-->
<!--                <div class="layui-carousel" id="carousel">-->
<!--                    <ul class="rest" height="250" carousel-item>-->
<!--                        <li><a href="{:url("/book/" . $novel['PrimaryId'],array(),"html",true)}"><img src="/public/cover/cb/68/a3/cb68a3a289f6f73dfc01fe45c37eed62.jpg" alt="{$novel.Title}">{$novel.Title}</a></li>-->
<!--                    </ul>-->
<!--                </div>-->
<!--            </div>-->
            <div class="box right w_260">
                <div class="title caption">
                    <p>分类推荐</p>
                </div>
                <ul class="list xs rank tab">
                    {ranking_list cid="$novel.Cid" limit="12" name="top"}
                    <li {eq name="$index" value="0"}class="on"{/eq}>
                        <a href="{:url("/book/" . $ranking['PrimaryId'],array(),"html",true)}"><img src="{$ranking.LocalImage | down_image}" alt="{$ranking.Title}"></a>
                        {if $index == 0}<i class="layui-bg-red">{$index+1}</i>{elseif $index == 1 /}<i class="layui-bg-orange">{$index+1}</i>{elseif $index == 2 /}<i class="layui-bg-blue">{$index+1}</i>{else/}<i class="layui-bg-cyan">{$index+1}</i>{/if}
                        <p class="bookname"><a href="{:url("/book/" . $ranking['PrimaryId'],array(),"html",true)}">{$ranking.Title}</a></p>
                        <p class="intro">{$ranking.Introduction | msubstr=0,20}</p>
                        <p class="author">作者：<a href="{:url('/author/' . urlencode($ranking['Author']))}">{$ranking.Author}</a></p>
                        <p>分类：<a href="{:url('/' . show_cid_alias($ranking.Cid),"","",true)}">{$ranking.Cid | show_cid_name}</a></p>
                    </li>
                    {/ranking_list}
                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <div class="box">
            <div class="title lite">
                <p>其他人正在看</p>
            </div>
            <ul class="vote">
                {random_list cid="$novel.Cid" limit="8"}
                <li>
                    <a class="bookimg" href="{:url("/book/" . $random['PrimaryId'],array(),"html",true)}"><img src="{$random.LocalImage | down_image}" alt="{$random.Title}"></a>
                    <a href="{:url("/book/" . $random['PrimaryId'],array(),"html",true)}">{$random.Title}</a>
                    <a class="light" href="{:url('/author/' . urlencode($random['Author']))}">{$random.Author}</a>
                </li>
                {/random_list}
            </ul>
        </div>
    </div>
</div>
{/block}

{block name="footer"}
<script id="chapter_html" type="text/html">
    <dd><a href="{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html" target="_blank">{title}</a></dd>
</script>

<script>
    var primary_id = "{$novel.PrimaryId}";
    var article_url = "{$novel.source_url | base64_encode}";
    var last_chapter_url = "{$last_chapter.Url | base64_encode}";
    var last_chapter_sort = "{:get_offset_value($last_chapter.Sort)}";
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";

    layui.use(['layer', 'jquery'], function () {
        var layer = layui.layer;
        var $ = layui.jquery;

        $(".add-book").click(function () {
            var id = $(this).data('id');
            var type = $(this).data('type');
            $.post("{:url('/user/add_book')}", {id:id,type:type},function (info) {
                if (info.code == 0) {
                    layer.msg(info.msg + ",加入成功");
                } else {
                    layer.msg(info.msg + ",加入失败");
                }
            });
        });

    });
</script>
<script src="__STATIC__/js/details.js"></script>
{/block}