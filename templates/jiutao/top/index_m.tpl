{extend name="base_m" /}
{block name="nav"}
{include file="nav_m" /}
{/block}
{block name="body"}
    {foreach $ranking_list as $index => $ranking}
        <div class="novel tred">
            <div class="novel-header">
                <div class="novel-header-l">
                    <h3 class="novel-title">{$ranking.name}排行</h3>
                </div>
                <div class="novel-header-r">
                    <a href="javascript:void(0)">更多<svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"></use></svg></a>
                </div>
            </div>
            <ol class="novel-text-list">
                {foreach $ranking.top_list as $key => $novel}
                <li>
                    <a href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}" title="入骨宠婚：误惹天价老公"><span>{$key+1}</span>{$novel.Title} <svg class="icon icon-arrow-r"><use xlink:href="#icon-arrow-r"></use></svg></a>
                </li>
                {/foreach}
            </ol>
        </div>
    {/foreach}
{/block}