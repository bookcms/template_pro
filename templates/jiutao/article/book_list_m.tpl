{extend name="base_m" /}
{block name="nav"}
{include file="nav_m_no_menu" /}
{/block}
{block name="body"}
    <div class="novel">
        <div class="novel-header">
            <div class="novel-header-l">
                <h3 class="novel-title">
                    <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="{$novel.Title}">{$novel.Title}</a>  目录
                </h3>
                <span>共{:count($novel.chapter_list)}章</span>
            </div>
            <div class="novel-header-r">
                <a href="javascript:void(0)" title="女帝让我死一万次目录正序">正序</a>
            </div>
        </div>
        <ol class="novel-text-list">
            {foreach $novel.chapter_list as $chapter}
            <li><a href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($chapter['Sort'],$novel['SourceList'],$chapter['Url']),"","html",true)}" title="{$chapter.Title}"> {$chapter.Title} <svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"></use></svg></a></li>
            {/foreach}
        </ol>
    </div>
{/block}
