{extend name="base" /}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url={:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),"","html","m")}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),"","html","m")}" />
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),array(),"html","m")}");</script>
{/block}
{block name="body"}
    <div class="content_read">
        <div class="box_con">
            <div class="con_top"><script>text_select();</script>
                <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
                <a href="{:url("/" . $novel.category.alias,"","",true)}" target="_blank">{$novel['category']['name']}</a> &gt;
                <a href="{:url('/book/' .$novel['PrimaryId'],'html',true)}" title="{$novel['Title']}">{$novel['Title']}</a> &gt; {$novel.chapter['Title']}
            </div>
            <div class="bookname">
                <h1>{$novel.chapter['Title']}{$novel.chapter.page_str}</h1>
                <div class="bottem1">
                    {neq name="$novel.pre_chapter" value=""}
                    <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" target="_top" class="pre" >上一章</a>
                    {else/}
                    暂无上一章
                    {/neq}

                    &larr; <a href="{:url('/book/' .$novel['PrimaryId'],'html',true)}" target="_top" title="" class="back">章节列表</a>

                    &rarr;
                    {neq name="$novel.next_chapter" value=""}
                    <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}" rel="next">下一章</a>
                    {else/}
                    暂无下一章
                    {/neq}

                </div>
            </div>
            <div id="content">
                <?php echo $novel['chapter']['content'];?>
            </div>
            <div class="clear"></div>
            <?php echo $showPage;?>
            <div class="bottem2">
                {neq name="$novel.pre_chapter" value=""}
                <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" target="_top" class="pre" >上一章</a>
                {else/}
                暂无上一章
                {/neq}

                &larr; <a href="{:url('/book/' .$novel['PrimaryId'],'html',true)}" target="_top" title="" class="back">章节列表</a>

                &rarr;
                {neq name="$novel.next_chapter" value=""}
                <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}" rel="next" id="next">下一章</a>
                {else/}
                暂无下一章
                {/neq}

            </div>
        </div>
    </div>

{/block}

{block name="footer"}
<script>
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";
    var article_name  = "{$novel.Title}";
    var source_flag  = "{$novel.chapter.source_flag | base64_encode}";
    var article_id  = "{$novel.PrimaryId}";
    var chapter_id   = "{:get_offset_value($novel.chapter.Sort)}";
</script>

<script>
    layui.use(['jquery','layer'], function () {
        var $ = layui.jquery,layer = layui.layer;
        //更新当前章节阅读位置
        $.post("{:url('/user/update_book')}", {article_id:article_id,chapter_id:chapter_id,flag:source_flag});
    });

    var pre_page = "";
    {neq name="$novel.pre_chapter" value=""}
        pre_page = "{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}";
    {/neq}

    var next_page = "";
    {neq name="$novel.next_chapter" value=""}
        next_page = "{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}";
   {/neq}

    window.document.onkeydown = function () {
        if (event.keyCode == 37 && pre_page != "") {
            window.location.href = pre_page
        }

        if (event.keyCode == 39 && next_page != "") {
            window.location.href = next_page
        }
    }
</script>
{/block}