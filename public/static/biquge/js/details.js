layui.use(['layer', 'jquery'], function () {
    var layer = layui.layer;
    var $ = layui.jquery;

    function update_cache() {
        $.ajax({
            type: 'post',
            url: '/update_cache',
            data: {primary_id: primary_id,last_chapter_sort: last_chapter_sort,article_url: article_url,last_chapter_url:last_chapter_url},
            dataType: 'json',
            success: function (info) {
                if (info.code == 200) {
                    var new_list_html = '';
                    var list_html = '';
                    var chapter_html = $('#chapter_html').html();

                    $.each(info.data, function (i, item) {
                        if (item.title) {
                            list_html = chapter_html.replace('{article_id}',item.primary_id);
                            list_html = list_html.replace('{chapter_id}',item.sort);
                            list_html = list_html.replace('{title}', item.title);
                            new_list_html += list_html;
                        }
                    });
                    $('#new_chapter dl dt').after(new_list_html);
                }
                layer.msg(info.msg);
            }
        });
    }

    $(function () {
        setTimeout(update_cache, 50);
    });
});
