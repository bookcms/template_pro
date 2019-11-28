{extend name="base_m_no_nav" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__STATIC__/css/rack_m.css">
{/block}
{block name="body"}

<div class="main transition" style="margin-bottom: 10px">
    <div class="tabArea  list rankingList rankingList_3">
        <div class="slide-con slide-con2">
            <div class="slide-item list1">

                {foreach $list as $key => $item}
                <div class="hot_sale">
                    <span class="num num{$key + 1}">{$key + 1}</span>
                    <a href="{$item.url}">
                        <p class="title">{$item.title}</p>
                        <p class="author">作者：{$item.author}</p>
                    </a>
                    <p class="author">最近更新：<a style="color: red;" href="{$item.last_chapter_url}">{$item.last_chapter_title}</a></p>
                    <p class="author">上次阅读：<a href="{$item.read_chapter_url}">{$item.read_chapter_title}</a></p>
                    <p class="author">
                        <a class="m_del_book" data-title="{$item.title}" data-id="{$item.id}">
                            <font color="#ff0000">从书架删除</font>
                        </a>
                    </p>
                </div>
                {/foreach}

            </div>

            <div class="clear"></div>
        </div>
    </div>
</div>

{/block}
{block name="footer"}
<script>
    layui.use(['jquery','layer'], function(){
        var $ = layui.jquery,layer = layui.layer;

        $(".m_del_book").on("click",function () {
            var book_id = $(this).data('id');
            var title = $(this).data('title');

            layer.confirm('是否删除【'+title+'】？', function(index){
                var jsData = {'book_id':book_id,"act_type":"rack"};
                $.post('{:url("/user/delete_book")}', jsData, function (info) {
                    if (info.code == 0) {
                        setTimeout(function () {
                            document.location.href = document.location.href;
                        },1000)
                    }
                    layer.msg(info.msg)
                }, "json");

                layer.close(index);
            });
        });
    });

</script>
{/block}
