{extend name="base_top" /}
{block name="body"}
<div class="container">
	<div class="class">
		<ul>
			<li><a data-type="mip" data-title="全部小说" href="{:url("/classify")}">全部</a></li>
	{foreach $site_config.category_list as $category_nav}
				<li><a data-type="mip" data-title="{$category_nav.name}" href="/classify/{$category_nav.alias}">{$category_nav.name}</a></li>
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
	<div class="content book">
   {foreach $ranking_list as $ranking}
		<div class="row" id="fengyou">
			<h2 class="text-center">阅读</h2>
			<ul>
			{foreach $ranking.top_list as $novel}
			<li>[{$novel.Cid | show_cid_name}] <a data-type="mip" data-title="{$novel.Title}" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a><span><a data-type="mip" href="{:url('/author/' . urlencode($novel['Author']) )}" target="_blank" title="{$novel.Author}的作品大全">{$novel.Author}</a></span></li>
		 {/foreach}
			</ul>
		</div>
		{/foreach}
	<div class="clear"></div>
</div>
<div class="text-center">AD</div>
{/block}