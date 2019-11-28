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
{block name="body"}
    <div class="box_con">
        <div class="con_top">
            <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
            <a href="{:url("/" . $novel.category.alias,"","",true)}" target="_blank">{$novel['category']['name']}</a> &gt;
            {$novel.Title}
        </div>
        <div id="maininfo">
            <div id="info">
                <h1>{$novel.Title}</h1>
                <p>作&nbsp;&nbsp;&nbsp;&nbsp;者：<a href="{:url('/author/' . urlencode($novel['Author']) )}">{$novel.Author}</a></p>
                <p>动&nbsp;&nbsp;&nbsp;&nbsp;作：

                    <a href="javascript:void(0);" class="add-book" data-type="collect" data-id="{$novel.PrimaryId}" >加入收藏</a> ,
                    <a href="javascript:void(0);" class="add-book" data-type="rack" data-id="{$novel.PrimaryId}" >加入书架</a>
                    ,  <a href="#footer">直达底部</a></p>

                <p>最后更新：{$novel.UpdateTime | date="Y-m-d H:i:s"}</p>
                <p>最新章节：<a href="{:url("/chapter/" . $novel.PrimaryId . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.LastChapterTitle}</a></p>

            </div>
            <div id="intro">
                {$novel.Introduction}
            </div>
        </div>
        <div id="sidebar">
            <div id="fmimg">
                <img alt="{$novel.Title}" src="{$novel.LocalImage | down_image}" width="120" height="150" onerror="this.src='__IMAGES__/nopic.gif'" />
                {eq name="$novel.Full" value="1"}
                <span class="a"></span>
                {else/}
                <span class="b"></span>
                {/eq}
            </div>
        </div>
    </div>
    <div class="box_con">
        <div id="new_chapter">
            <dl>
                <dt>{$novel.Title} 最新章节</b>（提示：已启用缓存技术，最新章节可能会延时显示，登录书架即可实时查看。）</dt>

                {foreach $novel.last_update_chapter_list as $chapter}
                    <dd> <a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></dd>
                {/foreach}
            </dl>
        </div>

        <div id="list">
            <dl>
                <dt>{$novel.Title} 正文</dt>
                {foreach $novel.chapter_list as $chapter}
                <dd> <a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></dd>
                {/foreach}
            </dl>
        </div>
        <div class="clear"></div>
        <?php echo $pages;?>
    </div>
{/block}

{block name="footer"}
<script src="__STATIC__/js/bookcase.js"></script>
<script id="chapter_html" type="text/html">
    <dd><a href="{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html" target="_blank">{title}</a></dd>
</script>
<script>
    var primary_id = "{$novel.PrimaryId}";
    var article_url = "{$novel.SourceUrl | base64_encode}";
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