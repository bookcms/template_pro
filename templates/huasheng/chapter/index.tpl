{extend name="base" /}
{block name="body_class"}class="chapter-skin0"{/block}
{block name="chapter_header"}chapter-header{/block}
{block name="header"}
<meta http-equiv="mobile-agent" content="format=html5; url={:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),"","html","m")}" />
<meta http-equiv="mobile-agent" content="format=xhtml; url={:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),"","html","m")}" />
{/block}
{block name="uaredirect"}
<script type="text/javascript">uaredirect("{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),array(),"html","m")}");</script>
{/block}
{block name="body"}
<!--container-->
<div class="chapter-container w960">
    <div class="chapter-bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        <a href="{:url('/book/' .$novel['PrimaryId'],'html',true)}">{$novel.Title}</a> &gt; {$novel.chapter.Title}
        <div class="source-list">
            <div class="select">

            </div>
        </div>
    </div>
    <div class="chapter-wrap font-family-01" style="font-size:18px">
        <!--main-->
        <div class="main">
            <div class="title">
                <h1>{$novel.chapter.Title}{$novel.chapter.page_str}</h1>
                <p>
                    <span class="book_name" data-title="{$novel.Title}">书名：{$novel.Title}</span>
                    <span>作者：{$novel.Author}</span>
                    <span>类别：{$novel.Cid | show_cid_name }</span>
                </p>
            </div>
            <div class="content">
                <?php echo $novel['chapter']['content'];?>
            </div>
            <div class="clearfix"></div>
            <?php echo $showPage;?>
        </div>
        <div class="page">
            {neq name="$novel.pre_chapter" value=""}
            <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" target="_top" class="prev"  >上一章</a>
            {else/}
            <a href="javascript:void (0)" class="prev"> 暂无上一章</a>
            {/neq}
            <a class="index" href="javascript:">目录</a>
            {neq name="$novel.next_chapter" value=""}
            <a href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}"  target="_top" class="next" >下一章</a>
            {else/}
            <a href="javascript:void (0)" class="next">暂无下一章</a>
            {/neq}
        </div>
        <!--main-->
    </div>
    <!--tool-bar-->
    <div class="left-bar">
        <ol class="left-btns">
            <li class="btn-chapter"><a href="javascript:void(0);">目录</a></li>
            <li class="btn-set"><a href="javascript:void(0);">设置</a></li>
            <li class="btn-mobile"><a href="javascript:void(0);">手机</a></li>
<!--            <li class="btn-favorite"><a href="javascript:void(0);">收藏</a></li>-->
            <li class="btn-voice"><a href="javascript:void(0);">阅读</a></li>
        </ol>
        <div class="show-panel chapter-panel">
            <h3>目录</h3>
            <div class="chapter-box">
                <ul class="clearfix">
                    {foreach $novel.chapter_list as $item}
                    <li {eq name="$novel.chapter.Sort" value="$item.Sort"}class="hover"{/eq} ><a target="_self" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($item['Sort'],$novel['SourceList'],$item['Url']),"","html",true)}" title="{$item.Title}">{$item.Title}</a></li>
                    {/foreach}
                </ul>
            </div>
            <a class="hide-panel">关闭</a>
        </div>
        <div class="show-panel set-panel">
            <h3>设置</h3>
            <div class="set-box">
                <dl class="set-skin clearfix">
                    <dt>阅读主题</dt>
                    <dd>
                        <span title="默认" class="skin-0 cur" data-value="0"><i></i></span>
                        <span title="灰色" class="skin-1" data-value="1"><i></i></span>
                        <span title="夜间" class="skin-2" data-value="2"><i></i></span>
                    </dd>
                </dl>
                <dl class="set-font-family clearfix">
                    <dt>正文字体</dt>
                    <dd>
                        <span class="cur" data-value="0">雅黑</span>
                        <span class="" data-value="1">宋体</span>
                        <span class="" data-value="2">楷书</span>
                    </dd>
                </dl>
                <dl class="set-font-size clearfix">
                    <dt>字体大小</dt>
                    <dd>
                        <cite>
                            <span class="prev">A-</span>
                            <span class="size">18</span>
                            <span class="next">A+</span>
                        </cite>
                    </dd>
                </dl>
                <dl class="set-width clearfix">
                    <dt>页面宽度</dt>
                    <dd>
                        <cite>
                            <span class="prev">W-</span>
                            <span class="size">960</span>
                            <span class="next">W+</span>
                        </cite>
                    </dd>
                </dl>
                <p class="set-btns clearfix">
                    <a class="btn-save" href="#">保存</a>
                    <a class="btn-cancel" href="#">取消</a>
                </p>
            </div>
            <a class="hide-panel">关闭</a>
        </div>
        <div class="show-panel mobile-panel">
            <h3>手机阅读</h3>
            <div class="mobile-box">
                <span id="j-qrcode"></span>
                <p style="margin-top: 50px">扫描二维码，随时随地掌上阅读</p>
            </div>
            <a class="hide-panel">关闭</a>
        </div>
    </div>
    <div class="right-bar">
        <ol>
            <li class="btn-gotop"><a href="javascript:void(0);">顶部</a></li>
        </ol>
    </div>
    <!--/tool-bar-->
</div>
<!--/container-->
{/block}
{block name="footer"}
<script type="text/javascript" src="__JS__/chapter_pc.js"></script>

<script>
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";
    var article_name  = "{$novel.Title}";
    var source_flag  = "{$novel.chapter.source_flag | base64_encode}";
    var article_id  = "{$novel.PrimaryId}";
    var chapter_id   = "{:get_offset_value($novel.chapter.Sort)}";

    layui.use(['jquery','layer','qrcode'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            qrcode = layui.qrcode;

        $(function () {

            function get_chapter_content(article_id,chapter_id,flag) {

                var layer1 = layer.load();
                $.ajax({
                    type: "get",
                    data:{article_id:article_id,chapter_id:chapter_id,flag:flag},
                    cache:false,
                    dataType:"json",
                    url: '{:url("/ajax/chapter_content","","html",true)}',
                    success: function(info) {
                        if (info.code == 200 && info.data != "") {
                            $(".content").html(info.data);
                            layer.close(layer1);
                        }
                    }
                });
            }

            if (parseInt('{$novel.chapter.content | strlen}') < 10) {
                $(".content").html("<div class='chapter_content_empty'>章节正在加载中,如加载失败请点击右上角更换源阅读!</div>");
                setTimeout(function () {
                    get_chapter_content(article_id,chapter_id,source_flag);
                },50);
            }

            //生成当前URL二维码
            $("#j-qrcode").qrcode({width:250,height:250,text:'{:url("/chapter/" . $novel["PrimaryId"] . "/" . get_offset_sort($novel.chapter["Sort"],$novel["SourceList"],$novel.chapter["Url"]),array(),"html","m")}'});

        });
    });
</script>
{/block}