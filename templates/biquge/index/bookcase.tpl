{extend name="base" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__STATIC__/css/user.css">
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{:url('/bookcase',array(),'html','m')}");</script>
{/block}
{block name="body"}

<div class="container">
    <div class="list_center">
        <div class="title">
            <span class="label"></span><em>临时书架 - 用户浏览过的小说会自动保存到书架中（只限同一电脑）</em>
        </div>
        <div class="details bookcase cf">
            <ul>
                <li><span class="s1"><b>作品分类</b></span><span class="s2"><b>作品名称</b></span><span class="s3"><b>上次阅读章节</b></span><span class="s4"><b>作者</b></span><span class="s5"><b>操作</b></span><span class="s6"><b>&nbsp;</b></span><span class="s7"><b>&nbsp;</b></span></li>
                <div class="read_book"></div>
            </ul>
        </div>
    </div>
</div>

{/block}
{block name="footer"}
<script>
    var article_rule = "{:url('/book',array(),'',true)}/{article_id}.html";
    var chapter_rule = "{:url('/chapter',array(),'',true)}/{article_id}/{chapter_id}.html";
</script>
<script src="__STATIC__/js/bookcase.js"></script>
{/block}