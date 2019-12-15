{extend name="base_cat" /}
{block name="body"}
<div class="container">
	<div class="class">
		<ul>
			{foreach $classify as $item}
			<li><a data-type="mip" data-title="{$item.name}" href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
			{/foreach}
			<li><a data-type="mip" data-title="热门全本小说" href="{:url("/full")}">完结小说</a></li>
		</ul>
	</div>
	<div class="content book" id="fengtui">
		<h2 class="text-center">本月热门小说</h2>
		{ranking_list limit="6"}
		<div class="bookbox"><div class="p10"><span class="num"><a data-type="mip" data-title="{$ranking.Title}" href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}"><mip-img layout="fixed" width="90" height="120" src="{$ranking.LocalImage | down_image}" alt="{$ranking.Title}"></mip-img></a></span><div class="bookinfo"><h4 class="bookname"><a data-type="mip" data-title="{$ranking.Title}" href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}">{$ranking.Title}</a></h4><div class="author">作者：<a data-type="mip" href="{:url('/author/' . urlencode($ranking.Author) )}" target="_blank" title="{$ranking.Author}的作品大全">{$ranking.Author}</a></div><div class="author">分类：{$ranking.Cid | show_cid_name}</div><div class="author">阅读量：{$ranking.PrimaryId | show_novel_click}</div><div class="cat"><span>更新到：</span><a href="{:url("/chapter/" . $ranking.PrimaryId . "/" . get_last_offset_sort($ranking.LastChapterSort,$ranking['SourceList'],$ranking['LastChapterFlag']),"","html",true)}">{$ranking.LastChapterTitle}</a></div><div class="update"><span>简介：</span>{$ranking.Introduction}</div></div><div class="delbutton"><a data-type="mip" data-title="{$ranking.Title}" class="del_but" href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}">阅读</a></div></div></div>
		{/ranking_list}
	</div>
</div>
<div class="text-center">AD</div>
<div class="container">
	<div class="content book" id="fengtui">
		<h2 class="text-center">全部小说列表 第{$page}页</h2>
		{foreach $list as $novel}
		<div class="bookbox"><div class="p10"><span class="num"><a data-type="mip" data-title="{$novel.Title}" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><mip-img layout="fixed" width="90" height="120" src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></mip-img></a></span><div class="bookinfo"><h4 class="bookname"><a data-type="mip" data-title="{$novel.Title}" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a></h4><div class="author">作者：<a data-type="mip" href="{:url('/author/' . urlencode($novel.Author) )}" target="_blank" title="{$novel.Author}的作品大全">{$novel.Author}</a></div><div class="author">分类：{$novel.Cid | show_cid_name}</div><div class="author">阅读量：{$novel.PrimaryId | show_novel_click}</div><div class="cat"><span>更新到：</span><a href="{:url("/chapter/" . $novel.PrimaryId . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.LastChapterTitle}</a></div><div class="update"><span>简介：</span>{$novel.Introduction}</div></div><div class="delbutton"><a data-type="mip" data-title="{$novel.Title}" class="del_but" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">阅读</a></div></div></div>
		{/foreach}
	</div>
	<div class="clear"></div>
	<?php echo $pages;?>
</div>
<div class="text-center">AD</div>
{/block}