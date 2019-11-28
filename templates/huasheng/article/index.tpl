{extend name="base" /}
{block name="mip"}
    {include file="mip" /}
{/block}
{block name="header"}
    <meta http-equiv="mobile-agent" content="format=html5; url={:url("/book/" . $novel['PrimaryId'],"","html","m")}" />
    <meta http-equiv="mobile-agent" content="format=xhtml; url={:url("/book/" . $novel['PrimaryId'],"","html","m")}" />
{/block}

{block name="body"}
<!--container-->
<div class="container clearfix">
    <div class="bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        <a href="{:url("/classify/" . $novel.Category.alias,"","html",true)}" target="_blank">{$novel.Cid | show_cid_name }</a> &gt;
        <a href="#">{$novel.Title}</a>
        <p>更新时间：{$novel.UpdateTime | date="Y-m-d H:i:s"}</p>
    </div>
    <div class="wrap clearfix">
        <!--primary-->
        <div class="book-info">
            <!--bsse-->
            <dl class="base clearfix">
                <dt>
                    <img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}">
                    {eq name="$novel.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}
                </dt>
                <dd>
                    <h1>{$novel.Title}</h1>
                    <p class="info"><span class="click">阅读：{$novel.PrimaryId | show_novel_click}</span>作者：<a href="{:url('/author/' . urlencode($novel['Author']) )}"><span>{$novel.Author}</span></a><span>分类：{$novel.Cid | show_cid_name}</span><span>阅读：{$novel.Click}</span></p>
                    <p class="intro">{$novel.Introduction}<b class="more">展开<i></i></b></p>
                    <ul class="btns">
                        <li class="read-online" ><a href="{$novel.FirstChapterUrl}">阅读最新</a></li>
                        <li class="add-bookshelf" data-id="{$novel.PrimaryId}"><a>放入书架</a></li>
                        <li class="go-review"><a>网友评论</a></li>
                    </ul>
                </dd>
            </dl>
            <!--tags-->
            <!--<div class="tags clearfix">-->
                <!--<p>-->
                    <!--<span>本书标签：</span>-->
                    <!--<a href="/tags/5.html">都市小说</a><a href="/tags/86.html">辣文合集</a>-->
                <!--</p>-->
            <!--</div>-->
            <!--attentions-->
            <div class="attentions">
                <h3>最新章节</h3>
                <ul class="clearfix">
                    {foreach $novel.LastUpdateChapterList as $chapter}
                    <li><a target="_blank" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="attentions">
                <h3>章节列表</h3>
                <ul class="clearfix">
                    {foreach $novel.ChapterList as $chapter}
                    <li><a target="_blank" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}">{$chapter.Title}</a></li>
                    {/foreach}
                </ul>
            </div>
            <div class="clearfix"></div>
            <?php echo $pages;?>
            <!--chapters-->

            <!--review-->
            <div class="review">
                <h3>网友评论</h3>
                <div class="review-form">
                    <p class="form-item">
                        <textarea class="j-textarea" rows="3">说点什么吧，您的评论是对本书最大的支持</textarea>
                    </p>
                    <p class="form-btns">
                        <span class="count">还可以输入<em class="j-count">200</em>字</span>
                        <button class="j-send" type="submit">发表评论</button>
                    </p>
                    <p class="form-msg"></p>
                </div>
                <div class="more"><a href="javascript:void(0);">查看全部评论</a></div>
            </div>
        </div>
        <!--primary-->
        <!--side-->
        <div class="side-bar">
            <!--book-other-->
            <div class="book-other">
                <div class="qrcode">
                    <span id="j-qrcode"></span>
                    <p>扫一扫，手机随心读</p>
                </div>
            </div>
            <!--new-book-->
            <div class="new-book">
                <h3>推荐小说</h3>
                <ul>
                    {random_list cid="$novel.Cid" limit="5"}
                    <li>
                        <a class="pic" title="{$random.Title}" href="{:url("/book/" . $random['PrimaryId'],"","html",true)}"><img src="{$random.LocalImage | down_image}" alt="{$random.Title}"></a>
                        <h5><a href="{:url("/book/" . $random['PrimaryId'],"","html",true)}" title="{$random.Title}">{$random.Title}</a></h5>
                        <p>分类：{$random.Cid | show_cid_name}</p>
                        <p>状态：{eq name="$random.Full" value="1"}已完结{else/}连载中{/eq}</p>
                    </li>
                    {/random_list}
                </ul>
            </div>
        </div>
        <!--/side-->
    </div>
</div>
<!--/container-->
{/block}

{block name="footer"}
<script src="__JS__/qrcode.js"></script>

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

    layui.use(['layer', 'jquery','qrcode'], function () {
        var layer = layui.layer,$ = layui.jquery,qrcode = layui.qrcode;

        $(".add-book").on('click',function () {
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

        //生成当前URL二维码
        $("#j-qrcode").qrcode({width:160,height:160,text:'{:url("/book/" . $novel["PrimaryId"],"","html","m")}'});

    });

</script>
{/block}