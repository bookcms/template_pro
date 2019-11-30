{extend name="base_m" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__STATIC__/css/user.css">
{/block}
{block name="body"}
<div class="article">
    <div id="intro" class="intro">
        临时书架/浏览记录
    </div>
    <div class="block bookcase">
        <div class="read_book"><div style="height:100px;line-height:100px; text-align:center">还木有任何书籍( ˙﹏˙ )</div></div>
    </div>
</div>
{/block}
{block name="footer"}
<script>
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";
</script>

{/block}