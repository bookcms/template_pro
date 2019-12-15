{extend name="base_a" /}
{block name="body"}
<div id="ifexplorer">
	<iframe src="about:blank" id="source" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>
</div>
<ol class="breadcrumb ptm-clearfix hidden-xs">
        <li><a href="{$site_config.site_domain}" title="{$site_config.site_domain}">首页</a></li>
		<li>&nbsp;&gt;&nbsp;</li>
		<li><a href="{:url("/classify/" . $novel.category.alias,"","html",true)}" title="{$site_config.site_name} {$novel['category']['name']}">{$novel['category']['name']}</a></li>
		<li>&nbsp;&gt;&nbsp;</li>
		<li><a href="{:url('/book/' .$novel['PrimaryId'],'html',true)}" title="{$novel.Title}">{$novel.Title}</a></li>
		<li>&nbsp;&gt;&nbsp;</li>
        <li class="active">{$novel.chapter.Title}</li>
</ol>
<div class="pt-reader">
	<div class="body">
		<div class="content anim">
			<p class="title">{$novel.chapter.Title}</p>
			<div class="content_btn ptm-clearfix dus52 visible-xs">
				<div class="ptm-col-xs-3">
					<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" id="addmark">加入书架</a>
				</div>
				<div class="ptm-col-xs-6">
					<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" href="{:url('/book/' .$novel['PrimaryId'],'html',true)}">查看目录</a>
				</div>
				<div class="ptm-col-xs-3">
					<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" href="#">查看书架</a>
				</div>
			</div>
			<div class="content_toolbar ptm-clearfix dus52 visible-xs">
				<div class="ptm-pull-left">
					<button class="ptm-btn ptm-btn-primary ptm-btn-outlined" data-tol="size-s">小</button>
					<button class="ptm-btn ptm-btn-primary ptm-btn-outlined" data-tol="size-m">中</button>
					<button class="ptm-btn ptm-btn-primary ptm-btn-outlined" data-tol="size-l">大</button>
				</div>
				<div class="ptm-pull-right">
					<button class="ptm-btn ptm-btn-primary ptm-btn-outlined" data-tol="mode-p">默认</button>
					<button class="ptm-btn ptm-btn-primary ptm-btn-outlined" data-tol="mode-d">舒适</button>
					<button class="ptm-btn ptm-btn-primary ptm-btn-outlined" data-tol="mode-n">夜间</button>
				</div>
			</div>
			<div style="text-align:center">AD</div>
			<div class="chaptercontent dus52" id="BookText">
			<?php echo $novel['chapter']['content'];?>
			</div>
			<div class="clear"></div>
            <?php echo $showPage;?>
			<div style="text-align:center">AD</div>
			<div class="content_btn ptm-clearfix dus52">
				<div class="ptm-col-xs-3">
					{neq name="$novel.pre_chapter" value=""}
					<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.pre_chapter['Sort'],$novel['SourceList'],$novel.pre_chapter['Url']),'html',true)}" class="next">上一章</a>{else/}<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" href="javascript:alert('已经是第一章了');">没有了</a>{/neq}
				</div>
				<div class="ptm-col-xs-6">
					<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" href="{:url('/book/' .$novel['PrimaryId'],'html',true)}">查看目录</a>
				</div>
				<div class="ptm-col-xs-3">
					{neq name="$novel.next_chapter" value=""}<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" href="{:url('/chapter/' . $novel['PrimaryId'] . '/' . get_offset_sort($novel.next_chapter['Sort'],$novel['SourceList'],$novel.next_chapter['Url']),'html',true)}">下一章</a>{else/}<a class="ptm-btn ptm-btn-primary ptm-btn-block ptm-btn-outlined" href="javascript:alert('已经是最后一章了');">没有了</a>{/neq}
				</div>
			</div>
			<div style="text-align:center;display:grid;">AD</div>
		</div>
	</div>
</div>
<div class="book mt10 pt10 hidden-xs">
	推荐阅读：{random_list cid="$novel.Cid" limit="20"}<a href="{:url("/book/" . $random['PrimaryId'],"","html",true)}">{$random.Title}</a>　{/random_list}
</div>
<script src="https://js.52dus.com/Public/mippc/js/zepto.touch.min.js?v6.14.10"></script>
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
<script src="__STATIC__/js/bookcase.js"></script>
<script>
    layui.use(['jquery','layer'], function () {
        var $ = layui.jquery,layer = layui.layer;
        //更新当前章节阅读位置
        //$.post("{:url('/user/update_book')}", {article_id:article_id,chapter_id:chapter_id,flag:source_flag});
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