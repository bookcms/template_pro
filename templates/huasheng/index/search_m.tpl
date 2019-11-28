{extend name="base_m" /}
{block name="header"}
{/block}
{block name="body"}

<!--header-->
<div class="header">
    <a href="javascript:history.go(-1);"><span class="icon-back"></span></a>
    <h1>搜索</h1>
    <span class="icon-grouop">
		<span class="icon-search"></span>
		<span class="icon-menu"></span>
	</span>
</div>
<!--search-->
{include file="top_menu" /}

<!--wrap-->
<div class="wrap">
    <div class="mod mod-search">
        <div class="search-list">
            <div class="result"><span>“{$keyword}”</span>共<em>{$list | count}</em>个相关结果：</div>
            <ul class="clearfix">
                {foreach $list as $item}
                <li>
                    <img class="pic" src="{$item.local_image | down_image}" alt="我的25岁美女房客" />
                    <a class="tit" href="{:url("/book/" . $item['id'],"","html",true)}">{$item.title}</a>
                    <p class="intro">{$item.introduction}</p>
                    <p class="info"><span><aria>作者：</aria>{$item.author}</span><em class="type">{$item.cid | show_cid_name}</em>{eq name="$item.Full" value="1"}<em class="finish">已完结</em>{else/}<em class="serial">连载中</em>{/eq}</p>
                </li>
                {/foreach}
            </ul>
            <div class="pages">

            </div>

        </div>
    </div>
</div>
{/block}