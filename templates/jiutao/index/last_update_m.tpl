{extend name="base_m" /}
{block name="nav"}
{include file="nav_m" /}
{/block}
{block name="body"}

    <div class="novel">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title">更新小说榜</h3><span>TOP 50</span>
            </div>
        </div>
        <ol class="book-ol book-ol-normal">
            {foreach $last_update as $novel}
            <li class="book-li">
                <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" class="book-layout">
                    <img src="__IMAGES__/default.jpg" data-echo="{$novel.LocalImage | down_image}"
                         class="book-cover" alt="{$novel.Title}">
                    <div class="book-cell">
                        <h4 class="book-title">{$novel.Title}</h4>
                        <p class="book-desc">{$novel.Introduction} </p>
                        <div class="book-meta">
                            <div class="book-meta-l">
                                <span class="book-author"><svg class="icon icon-human"><use xlink:href="#icon-human"></use></svg>{$novel.Author}</span>
                            </div>
                            <div class="book-meta-r">
                                    <span class="tag-small-group origin-right">
                                        <em class="tag-small yellow">{$novel.Cid | show_cid_name}</em>
                                        <em class="tag-small red">{eq name="$novel.Full" value="0"}连载中{else/}已完结{/eq}</em>
                                        <em class="tag-small blue">{$novel.UpdateTime | date="Y-m-d"}</em>
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