{extend name="base" /}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url={$site_config.mobile_domain}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={$site_config.mobile_domain}" />
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{$site_config.mobile_domain}");</script>
{/block}
{block name="body"}
<div class="main">
    <div class="layui-main">
        <div class="box">
            <div class="layui-carousel" id="carousel">
                <ul class="recommend" height="380" carousel-item>
                    {slide_list limit='4'}
                    <li><a target="{$slide.target}" href="{$slide.url}" title="{$slide.name}"><img src="{$slide.image | down_image}" alt="{$slide.name}"></a></li>
                    {/slide_list}
                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <div class="box left w_840">
            <div class="title caption">
                <p>精品推荐</p>
            </div>
            <div class="cover">
                <ul class="detail">

                    {ranking_list limit="6" name="top"}
                    <li class="layui-anim layui-anim-fadein {eq name="$index" value="0"}on{/eq}">
                        <a class="bookimg"  style="width: 180px;height: 240px;" href="{:url('/book/' . $ranking['PrimaryId'],'','html',true)}" title="{$ranking.Title}在线阅读_{$ranking.Title}TXT免费下载"><img src="{$ranking.LocalImage | down_image}" alt="{$ranking.Title}"></a>
                        <a class="bookname" href="{:url('/book/' . $ranking['PrimaryId'],'','html',true)}" title="{$ranking.Title}在线阅读_{$ranking.Title}TXT免费下载">{$ranking.Title}</a>
                        <p class="intro">{$ranking.Introduction | msubstr=0,200}</p>
                        <p><a class="read" href="{:url('/book/' . $ranking['PrimaryId'],'','html',true)}" title="{$ranking.Title}在线阅读_{$ranking.Title}TXT免费下载">立即阅读 &gt;</a>作者：<a href="{:url('/author/' . urlencode($ranking['Author']) )}" title="{$ranking.Author}作品全集">{$ranking.Author}</a>分类：<a href="{:url("/" . show_cid_alias($ranking.Cid),"","",true)}" title="更多{:show_cid_name($ranking.Cid)}小说">{:show_cid_name($ranking.Cid)}</a>更新：<a><span class="layui-badge-rim layui-icon i_history">{$ranking.UpdateTime | date="Y-m-d H:i"}</span></a></p>
                    </li>
                    {/ranking_list}

                </ul>
                <ul class="tab">
                    {ranking_list limit="6" name="top"}
                    <li{eq name="$index" value="0"} class="on"{/eq}><a href="{:url('/book/' . $ranking['PrimaryId'],'','html',true)}" title="{$ranking.Title}在线阅读_{$ranking.Title}TXT免费下载"><img src="{$ranking.LocalImage | down_image}" alt="{$ranking.Title}"></a></li>
                    {/ranking_list}
                </ul>
            </div>
            <ul class="block">
                {foreach $site_config.category_list as $category_nav}
                {novel_list cid_list="$category_nav.cid_list" offset="0" limit="1"}
                <li><span class="light">[<a href="{:url('/classify/' . $category_nav['alias'])}" title="更多{$category_nav.name}小说">{$category_nav.name}</a>]</span><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title}">{$novel.Title}</a></li>
                {/novel_list}
                {/foreach}
            </ul>
        </div>
        <div class="box right w_260">
            <div class="title caption">
                <p>本周强推</p>
            </div>
            <ul class="list xs rank tab">
                {block_list block_id="7" limit="8"}
                <li {eq name="$index" value="0"}class="on"{/eq}>
                    <a href="{:url('/book/' . $novel['PrimaryId'],'','html',true)}" title="{$novel.Title}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                    {if $index == 0}<i class="layui-bg-red">{$index+1}</i>{elseif $index == 1 /}<i class="layui-bg-orange">{$index+1}</i>{elseif $index == 2 /}<i class="layui-bg-blue">{$index+1}</i>{else/}<i class="layui-bg-cyan">{$index+1}</i>{/if}
                    <p class="bookname"><a href="{:url('/book/' . $novel['PrimaryId'],'','html',true)}" title="{$novel.Title}在线阅读_{$novel.Title}TXT免费下载">{$novel.Title}</a></p>
                    <p class="intro">{$novel.Introduction | msubstr=0,20}</p>
                    <p class="author">作者：<a href="{:url('/author/' . urlencode($novel['Author']) )}" title="{$novel.Author}作品全集">{$novel.Author}</a></p>
                    <p>分类：<a href="{:url("/" . show_cid_alias($novel.Cid),"","",true)}" title="更多{:show_cid_name($novel.Cid)}小说">{:show_cid_name($novel.Cid)}</a></p>
                </li>
                {/block_list}
            </ul>
        </div>
        <div class="clear"></div>
        <div class="box">
            <div class="title caption">
                <p>热门推荐</p>
            </div>
            <ul class="hot">
                {ranking_list limit="6" name="rack"}
                <li>
                    <a class="bookimg" href="{:url('/book/' . $novel['PrimaryId'],'','html',true)}" title="{$novel.Title}在线阅读_{$novel.Title}TXT免费下载"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                    <a href="{:url('/book/' . $novel['PrimaryId'],'','html',true)}" title="{$novel.Title}在线阅读_{$novel.Title}TXT免费下载">{$novel.Title}</a>
                    <a class="light" href="{:url('/author/' . urlencode($novel['Author']) )}" title="{$novel.Author} 作品全集">{$novel.Author}</a>
                </li>
                {/ranking_list}
            </ul>
        </div>
        <div class="box left w_740">
            <div class="title lite">
                <p>最近更新</p>
                <a href="javascript:void(0);" class="more" title="更多最近更新的小说">更多 &gt;</a>
            </div>
            <div class="table">
                <table class="layui-table" lay-even lay-skin="nob">
                    <thead>
                    <tr>
                        <th width="60">分类</th>
                        <th width="140">书名</th>
                        <th>最新章节</th>
                        <th width="85">作者</th>
                        <th width="80">更新时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    {foreach $lastUpdateData as $novel}
                    <tr>
                        <td><a class="light" href="{:url("/classify/" . show_cid_alias($novel.Cid))}" title="更多{$novel.Cid | show_cid_name}小说">{$novel.Cid | show_cid_name}</a></td>
                        <td><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title}在线阅读_{$novel.Title}TXT免费下载">{$novel.Title}</a></td>
                        <td><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" title="{$novel.Title}最新章节_{$novel.LastChapterTitle}">{$novel.LastChapterTitle}</a></td>
                        <td><a href="{:url('/author/' . urlencode($novel['Author']))}" title="{$novel.Author} 作品全集">{$novel.Author}</a></td>
                        <td>{$novel.UpdateTime | date="Y-m-d"}</td>
                    </tr>
                    {/foreach}

                    </tbody>
                </table>
            </div>
        </div>
        <div class="box right w_360">
            <div class="title lite">
                <p>最新入站</p>
                <a href="javascript:void(0);" class="more" title="更多最新入库的小说">更多 &gt;</a>
            </div>
            <ul class="list bg">
                {foreach $lastInsertData as $novel}
                <li><span class="light">[<a href="{:url("/classify/" . show_cid_alias($novel.Cid))}" title="更多{$novel.Cid | show_cid_name}小说">{$novel.Cid | show_cid_name}</a>]</span><a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title}在线阅读_{$novel.Title}TXT免费下载">{$novel.Title}</a></li>
                {/foreach}
            </ul>
        </div>
        <div class="clear"></div>
        <div class="notice">
            <span class="layui-btn layui-btn-xs layui-btn-danger">友情链接</span>
                {foreach $site_config.links as $link}
                <a href="{$link.url}" target="_blank">{$link.name}</a>
                {/foreach}
        </div>
    </div>
</div>
{/block}