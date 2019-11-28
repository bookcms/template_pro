layui.use(['jquery'], function(){
    var $ = layui.jquery;

    $(function () {
        //首页
        $(".icon-home").bind("click",function(){
            window.location.href="/";
        });
        //回到顶部
        $(".totop").bind("click",function(){
            $('body,html').animate({
                scrollTop: 0
            }, 1000);
            return false;
        });
        //搜索
        $(".icon-search").bind("click",function(event){
            $(".menu").removeClass("show");
            $(".search").toggleClass("show")
            event.stopPropagation();
            $(document).bind("click",function(event){
                if (!$('.search-panel').is(event.target) && $('.search-panel').has(event.target).length === 0) {
                    $(".search").removeClass("show");
                }
            });
        });

        //菜单
        $(".icon-menu").bind("click",function(){
            $(".search").removeClass("show");
            $(".menu").toggleClass("show")
            event.stopPropagation();
            $(document).bind("click",function(event){
                if (!$('.menu-panel').is(event.target) && $('.menu-panel').has(event.target).length === 0) {
                    $(".menu").removeClass("show");
                }
            });
        });

        // var xx = function() {
        //     var chapters  =  $(".news-info .chapters ul").children("li").length;
        //     if (chapters >= 100) {
        //         $(".news-info .chapters ul").children("li").slice(100).css("display","none");
        //         $(".news-info .chapters").append("<p class='chapters-more'><a>显示更多</a></p>")
        //         $(".news-info .chapters-more").on("click",function(){
        //             $(this).css("display","none");
        //            $(".news-info .chapters ul").children("li").slice(100).css("display","block");
        //         });
        //     }
        // };
        //小说页
        // $(".book-info .intro i").bind("click",function(){
        //     $(this).toggleClass("expand");
        //     $(".book-info .intro p").toggleClass("expand");
        // });

    });
});