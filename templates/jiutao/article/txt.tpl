{extend name="base" /}
{block name="mip"}
    {include file="mip" /}
{/block}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url={:url("/txt/" . $novel['PrimaryId'],"","html","m")}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={:url("/txt/" . $novel['PrimaryId'],"","html","m")}" />
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
                        点击：<span class="layui-badge-rim layui-icon i_visit"> 288</span>
                        下载：<span class="layui-badge-rim layui-icon i_vote"> 8</span>
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
                    <p>{$novel.Title}TXT下载</p>
                </div>
                <div class="content">
                    <p>免责声明：</p>
                    <p>① <strong>{$novel.Title}</strong>TXT全集下载，由<strong><a href="{$site_config.site_domain}">{$site_config.site_name}</a></strong>书友收集整理自网络，版权归原作者<strong><a href="{:url('/author/' . urlencode($novel['Author']))}">{$novel.Author}</a></strong>所有，仅作学习交流使用，不可用于任何商业途径。</p>
                    <p>② 如非免费资源，请在试用之后24小时内立即删除。如果喜欢该资源，请购买正版谢谢合作！</p>
                    <p>③ 如不慎该资源侵犯了您的权益，请麻烦通知我们及时删除，谢谢！</p>
                </div>
                <ul class="list bg">
                    <li><span class="light_down_1">本书暂无ZIP下载资源，站长正在寻找资源添加中......</span></li>
                    <li><span class="light_down_1">本书暂无TXT下载资源，站长正在寻找资源添加中......</span></li>
                </ul>
            </div>
        </div>
        <div class="right w_280">

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
{/block}