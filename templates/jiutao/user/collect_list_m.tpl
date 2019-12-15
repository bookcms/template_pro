<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>我的收藏-{$site_config.site_name} </title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="MobileOptimized" content="240"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,  minimum-scale=1.0, maximum-scale=1.0"/>
    <link rel="shortcut icon" href="/favicon.ico"/>
    <link rel="stylesheet" href="__STATIC__/layui/css/layui.css"/>
    <link rel="stylesheet" href="__CSS__/base_m.css">
    <link rel="stylesheet" href="__CSS__/bookcase_m.css">
    <script src="__JS__/hotcss.js"></script>
</head>
<body>
<div class="wrap">
    <div class="content">
        <header id="header" class="header booklist">
            <a href="javascript:history.go(-1)" class="header-back jsBack" data-eid="mqd_G14">
                <svg class="icon icon-arrow-l">
                    <title>返回</title>
                    <use xlink:href="#icon-arrow-l">
                        <svg id="icon-arrow-l" viewBox="0 0 8 16" width="100%" height="100%">
                            <path d="M.146 7.646a.5.5 0 0 0 0 .708l7 7a.5.5 0 0 0 .708-.708l-7-7v.708l7-7a.5.5 0 0 0-.708-.708l-7 7z"></path>
                        </svg>
                    </use>
                </svg>
            </a>
            <nav class="btn-group btn-group-small">
                <h3 class="btn-group-cell" role="navigation" aria-label="已选择">
                    <a href="{:url('/user/rack_list')}" class="btn-tab">
                        我的书架
                    </a>
                </h3>
                <h3 class="btn-group-cell" role="navigation" aria-label="">
                    <a href="{:url('/user/collect_list')}" class="btn-tab active">
                        我的收藏
                    </a>
                </h3>
            </nav>

        </header>
        <div class="module module-merge">
            <ol id="bookEditOl" class="book-ol book-ol-progress">
                {foreach $list as $key => $item}
                <li class="book-li">
                    <div class="book-layout">
                        <div class="rel">
                            <a href="{$item.url}" class="mybook-to-detail">
                                <img src="{$item.image}" class="book-cover" alt="{$item.title}">
                            </a>
                            <a href="{$item.url}" class="book-title-x">
                                <h4 class="book-title">{$item.title} </h4>
                            </a>
                        </div>
                        <div class="mybook-to-goon">
                            <div class="book-title-x">
                                <div class="book-title-r">
                                    <a class="m_del_book" data-title="{$item.title}" data-id="{$item.id}">
                                        <svg class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" width="30" height="30"><path d="M731.918024 180.533726 293.285433 180.533726c-40.383364 0-73.105944 32.720216-73.105944 73.102948l0 24.367991 584.843455 0 0-24.367991C805.023968 213.253942 772.302411 180.533726 731.918024 180.533726M604.221575 131.798768l10.756412 76.909647L410.22547 208.708416l10.755389-76.909647L604.221575 131.798768M610.076149 83.063811l-194.947818 0c-20.108791 0-38.813548 16.276708-41.621615 36.217876l-14.254216 101.968369c-2.78453 19.916609 11.399075 36.19434 31.507865 36.19434l243.684773 0c20.107767 0 34.292396-16.276708 31.484328-36.217876l-14.255239-101.968369C648.887651 99.340519 630.183917 83.063811 610.076149 83.063811M744.102007 326.738599 281.100427 326.738599c-26.795347 0-46.761893 21.845541-44.334511 48.544623L276.699007 814.278511c2.402821 26.700105 26.344051 48.544623 53.139398 48.544623l365.527671 0c26.795347 0 50.735553-21.845541 53.139398-48.544623l39.932067-438.995289C790.8639 348.58414 770.897354 326.738599 744.102007 326.738599M415.128331 765.353219l-73.105944 0-24.368989-341.144704 97.473909 0L415.127308 765.353219zM561.339195 765.353219l-97.473909 0L463.865286 424.208515l97.473909 0L561.339195 765.353219zM683.18107 765.353219l-73.105944 0L610.075126 424.208515l97.473909 0L683.18107 765.353219z"></path></svg>
                                    </a>
                                </div>
                            </div>
                            <div class="book-meta">
                                <p class="ell">{$item.author}</p>
                            </div>
                        </div>
                        <div class="rel">
                            <a href="{$item.last_chapter_url}" class="mybook-to-new">
                                <div class="book-meta">
                                    <time class="book-meta-r" style="width: 15%;background-color: #def;color: #05ade8;border: solid 1px #05ade8;border-radius: 8px;text-align:center;margin: 0 15px 0;">继续</time>
                                    <p class="ell">{$item.last_chapter_title}</p>
                                </div>
                            </a>
                        </div>

                    </div>
                </li>
                {/foreach}
            </ol>
        </div>
        <div id="foot" class="foot">
            <a href="/" title="{$site_config.site_name} 电脑版">{$site_config.site_name} </a>
            <div class="footer-copy">&copy; {$site_config.site_name}</div>
        </div>
    </div>
</div>
<script src="__STATIC__/layui/layui.js" type="text/javascript"></script>
<script>
    layui.use(['jquery','layer'], function(){
        var $ = layui.jquery,layer = layui.layer;

        $(".m_del_book").on("click",function () {
            var book_id = $(this).data('id');
            var title = $(this).data('title');

            layer.confirm('是否删除【'+title+'】？', function(index){
                var jsData = {'book_id':book_id,"act_type":"collect"};
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
<div style="display:none">
    <?php echo $site_config['extend']['m_tong_ji']; ?>
</div>
</body>

</html>