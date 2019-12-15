{extend name="base" /}
{block name="body"}
<div class="container">
	<div class="content book">
		<div class="search visible-xs search_wap">
		<mip-form method="get" url="{:url("/search")}" clear>
		<input type="text" name="keyword" class="search" size="10" maxlength="50" placeholder="请输入小说名或作者名，勿错字" required>
		<button id="sss" type="submit"> 搜 索 </button>
		</mip-form>
		</div>
		<div class="clear"></div>
		<div class="content-left" id="fengtui">
			<h2>热门小说推荐</h2>
			{block_list block_id="12" limit="4"}
			<div class="item">
				<div class="image"><a data-type="mip" href="{:url("/book/" . $block['PrimaryId'],"","html",true)}" data-title="{$block.Title}"><mip-img layout="fixed" width="120" height="150" src="{$block.LocalImage | down_image}" alt="{$block.Title}"></mip-img></a></div>
				<dl>
				<dt><span><a data-type="mip" href="{:url('/author/' . urlencode($block['Author']) )}" data-title="{$block.Author}的作品大全">{$block.Author}</a></span><a data-type="mip" href="{:url("/book/" . $block['PrimaryId'],"","html",true)}" data-title="{$block.Title}">{$block.Title}</a></dt>
				<dd>{$block.Introduction}</dd>
				</dl>
				<div class="clear"></div>
			</div>
			{/block_list}
		</div>

		<div class="content-right" id="fengyou">
			<h2>人气小说榜</h2>
			<ul>
				{ranking_list limit="9"}<li>[{$ranking.Cid | show_cid_name}]<a data-type="mip" href="{:url("/book/" . $ranking['PrimaryId'],"","html",true)}" data-title="{$ranking.Title}">{$ranking.Title}</a><span><a data-type="mip" href="{:url('/author/' . urlencode($ranking.Author) )}" data-title="{$ranking.Author}的作品大全">{$ranking.Author}</a></span></li>{/ranking_list}
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="text-center">AD</div>
<div class="container">
{foreach $all_category_list as $category_list}
	<div class="content book">
	{foreach $category_list as $index => $category}
		<div class="row" id="fengyou">
			<h2 class="text-center">{$category.name}</h2>
			<ul>
			 {novel_list cid_list="$category.cid_list" offset="1" limit="10"}
			<li>[{$novel.Cid | show_cid_name}]<a data-type="mip" data-title="{$novel.Title}" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a><span><a data-type="mip" href="{:url('/author/' . urlencode($novel['Author']) )}" target="_blank" title="{$novel.Author}的作品大全">{$novel.Author}</a></span></li>
			{/novel_list}
			</ul>
		</div>
		{/foreach}
		<div class="clear"></div>
	</div>
{/foreach}
</div>
<div class="text-center">AD</div>
<div class="container">
	<div class="content book">
		<div class="content-right" id="zuixin">
			<h2>最新小说</h2>
			<ul>
				{foreach $lastInsertData as $novel}
				<li>[{$novel.Cid | show_cid_name}] <a data-type="mip" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" data-title="{$novel.Title}">{$novel.Title}</a><span><a data-type="mip" href="{:url('/author/' . urlencode($novel['Author']))}" data-title="{$novel.Author}的作品大全">{$novel.Author}</a></span></li>
				{/foreach}
			</ul>
		</div>
		<div class="content-left" id="gengxin">
			<h2>最近更新</h2>
			<ul>
				{foreach $lastUpdateData as $novel}
				<li><span class="s1">[<a data-type="mip" href="{:url("/classify/" . show_cid_alias($novel.Cid) ,"","",true)}" data-title="{$novel.Cid | show_cid_name}">{$novel.Cid | show_cid_name}</a>]</span>
					<span class="s2"><a data-type="mip" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" data-title="{$novel.Title}">{$novel.Title}</a></span>
					<span class="s3"><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}" target="_blank">{$novel.LastChapterTitle}</a></span>
					<span class="s5">{$novel.UpdateTime | date="Y-m-d"}</span>
					<span class="s4"><a data-type="mip" href="{:url('/author/' . urlencode($novel['Author']))}" data-title="{$novel.Author}的作品大全">{$novel.Author}</a></span></li>
				{/foreach}
			</ul>
		</div>
		<div class="clear"></div>
	</div>
	<div class="content tuijian hidden-xs">
		友情链接：
		{foreach $site_config.links as $link}
		<a href="{$link.url}" target="_blank">{$link.name}</a>
		{/foreach}
		<div class="clear"></div>
	</div>
</div>
{/block}