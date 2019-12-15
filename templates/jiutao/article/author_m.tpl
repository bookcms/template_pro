{extend name="base_m" /}
{block name="nav"}
{include file="nav_m_no_menu" /}
{/block}
{block name="body"}
<div class="novel">
    <div class="novel-header">
        <div class="novel-header-l">
            <h3 class="novel-title">{$author} 作品大全</h3>
            <span class="novel-title-desc"></span>
        </div>
    </div>
    <ol class="book-ol book-ol-normal">
        {foreach $list as $novel}
        <li class="book-li">
            <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" class="book-layout" title="{$novel.Title}"><img src="__IMAGES__/default.jpg" data-echo="{$novel.LocalImage | down_image}" class="book-cover" alt="{$novel.Title}">
            <div class="book-cell"><h4 class="book-title">{$novel.Title}</h4>
                    <p class="book-desc">{$novel.Introduction}</p>
                    <div class="book-meta">
                        <div class="book-meta-l">
                            <span class="book-author"><svg class="icon icon-human"><use xlink:href="#icon-human"></use></svg>{$novel.Author}</span>
                        </div>
                        <div class="book-meta-r">
                            <span class="tag-small-group origin-right">
                                <em class="tag-small yellow">{$novel.Cid | show_cid_name}</em>
                                <em class="tag-small red">{eq name="$novel.Full" value="0"}连载中{else/}已完结{/eq}</em>
<!--                                <em class="tag-small blue">35人看过</em>-->
                            </span>
                        </div>
                    </div>
            </div>
            </a>
        </li>
        {/foreach}
     <ol>
</div>
{/block}
