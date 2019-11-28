{extend name="base_m" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__CSS__/sort.css" />
<script src="__JS__/common.js"></script>
{/block}
{block name="body"}
<div class="content m-category">
    <ul>
        {foreach $site_config.category_list as $category}
            <li class="prev"><a href="/{$category.alias}">{$category.name}</a></li>
        {/foreach}
    </ul>
</div>
{/block}