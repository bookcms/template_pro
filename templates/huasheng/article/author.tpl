{extend name="base" /}
{block name="body"}
<!--/header--><!--container-->
<div class="container clearfix">
    <div class="bread">
        <span>您的位置 : </span>
        <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;
        作者<a href="{:url('/author/' . urlencode($author))}">{$author}</a>
    </div>
    <div class="wrap clearfix">
        <!--main-->
        <div class="book-list">
            <h2><a href="{:url('/author/' . urlencode($author))}">{$author}</a>简介：</h2>
			<div style="line-height: 150%;text-indent: 40px;font-size: 16px;">
				<a href="{:url('/author/' . urlencode($author))}" title="{$author}">{$author}</a>是一名出色的小说作者，他的作品包括：
				{foreach $list as $item}
				<a href="{:url("/book/" . $item['id'],"","html",true)}" title="{$item.title} 作者：{$item.author}">{$item.title}</a>、
				{/foreach}
				等，本本精品，字字珠玑，{$author}的小说情节跌宕起伏、扣人心弦，情节与文笔俱佳。<a href="{$site_config.site_domain}" title="{$site_config.site_name}">{$site_config.site_name}</a>强烈建议您到正版网站阅读{$author}的作品，您的每一次阅读都是对作者<a href="{:url('/author/' . urlencode($author))}">{$author}</a>的认可！如果您在<a href="{$site_config.site_domain}" title="{$site_config.site_name}">{$site_config.site_name}</a>阅读<strong>{$author}</strong>作品时，遇到问题，请及时反馈，我们将第一时间解决，争取为您奉上更新更精彩的作品。
			</div>
        </div>
        <div class="book-list">
            <h2>{$author}的小说作品</h2>
            <ul class="clearfix">
                {foreach $list as $item}
                <li>
                    <a class="pic" href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank"><img class="lazy" src="{$item.local_image | down_image}" alt="{$item.title}"></a>
                    <h5 class="tit"><a href="{:url("/book/" . $item['id'],"","html",true)}" target="_blank">{$item.title}</a></h5>
                    <p class="info">作者：<a href="{:url('/author/' . urlencode($item.author) )}" target="_blank"><span>{$item.author}</span></a><span>分类：{$item.cid | show_cid_name}</span>{eq name="$item.Full" value="1"}<i class="finish">已完结</i>{else/}<i class="serial">连载中</i>{/eq}</p>
                    <p class="intro">{$item.introduction}</p>
                    <!--<p class="update"><a href="/book/14821/chapter/.html">最新更新 </a></p>-->
                    <a class="view" href="{:url("/chapter/" . $item['id'] . "/" . $item.last_chapter_sort,"","html",true)}" target="_blank">阅读最新</a>
                </li>
                {/foreach}
            </ul>
        </div>
		
		<div class="book-list">
			<h2>更多作者：</h2>
			<Div style="line-height: 150%;font-size: 16px;">
			{foreach $rand_list as $item}
			<a href="{:url('/author/' . urlencode($item['author']))}">{$item.author}</a>
			{/foreach}
			</Div>
		</div>
        
        <!--main-->
    </div>

</div>
<!--/container-->
{/block}