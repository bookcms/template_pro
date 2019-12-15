{extend name="base_m" /}
{block name="nav"}
{include file="nav_m_no_menu" /}
{/block}
{block name="body"}
<div class="novel">
    <div class="wrap">
        <!-- book-nav -->
        <div class="mod mod-nav">
            <div id="book-nav" class="book-nav">
                <ul class="clearfix">
                    {foreach $classify as $item}
                    <li {eq name="$item.alias" value="$current_alias"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
        <!-- book-subnav -->
        <div class="mod mod-subnav">
            <div class="book-subnav">
                <p>更新时间：</p>
                <ul class="clearfix">
                    {foreach $classify_update_times as $item}
                    <li {eq name="$item.time" value="$current_update_time"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                    {/foreach}
                </ul>
                <p>写作进程：</p>
                <ul class="clearfix">
                    {foreach $classify_status as $item}
                    <li {eq name="$item.status" value="$current_status"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
        <!-- book-list -->
        <div class="mod mod-book">
            <div class="book-list">
                <ol class="book-ol book-ol-normal">
                    {foreach $list as $novel}
                    <li class="book-li">
                        <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" class="book-layout" title="{$novel.Title} ">
                        <img src="__IMAGES__/default.jpg" data-echo="{$novel.LocalImage | down_image}" class="book-cover" alt="{$novel.Title}">
                        <div class="book-cell">
                            <h4 class="book-title">{$novel.Title}</h4>
                            <p class="book-desc">{$novel.Introduction}</p>
                            <div class="book-meta">
                                <div class="book-meta-l">
                                    <span class="book-author">
                                        <svg class="icon icon-human"><use xlink:href="#icon-human"></use></svg>{$novel.Author}
                                    </span>
                                </div>
                                <div class="book-meta-r">
                                    <span class="tag-small-group origin-right">
                                        <em class="tag-small yellow">{$novel.Cid | show_cid_name}</em>
                                        <em class="tag-small red">{eq name="$novel.Full" value="0"}连载中{else/}已完结{/eq}</em>
                                        <!--                                            <em class="tag-small blue">35人看过</em>-->
                                    </span>
                                </div>
                            </div>
                        </div>
                        </a>
                    </li>
                    {/foreach}
                <ol>
                <?php echo $pages;?>
            </div>
            <!--/main-->
        </div>
    </div>
</div>
{/block}