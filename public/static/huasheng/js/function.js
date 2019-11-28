layui.use(['jquery','layer'],function () {
    var $ = layui.jquery,layer = layui.layer;

    //把对象调整到中心位置
    (function($){
        $.fn.setmiddle = function() {
            var dl = $(document).scrollLeft(),
                dt = $(document).scrollTop(),
                ww = $(window).width(),
                wh = $(window).height(),
                ow = $(this).width(),
                oh = $(this).height(),
                left = (ww - ow) / 2 + dl,
                top = (wh - oh) / 2 + dt;
            $(this).css({left:Math.max(left, dl) + "px",top:Math.max(top, dt) + "px"});
            return this;
        }
    })($);

    //搜索输入字符串合法性验证
    $("#search-btn").on("click",function(){
        var str = $("#q").val();
        var ret = /[^\w\u4e00-\u9fa5]/;
        if(ret.test(str)){
            alert("搜索内容不合法");
            return false;
        }else if(str === null || str === undefined || str === ''){
            alert("搜索内容不能为空");
            return false;
        }else{
            return ture;
        }
    });

    //提示信息
    (function($){
        $.tips = function(options) {
            var settings = {
                content: "",
                icon: "success",
                time: 1500,
                close: false,
                zindex: 2999
            };
            if (options) {
                $.extend(settings, options);
            }
            if (settings.close) {
                $(".tips").hide();
                return;
            }
            if (!$(".tips")[0]) {
                $("body").append('<div class="tips"><i></i><span></span></div>');
                $(".tips").css("z-index", parseInt(settings.zindex));
            }
            $(".tips span").html(settings.content);
            $(".tips").attr("class", "tips tips-" + settings.icon);
            $(".tips").css("z-index", parseInt($(".tips").css("z-index"))+1).setmiddle().show();

            if (settings.time > 0) {
                setTimeout(function() {
                    $(".tips").fadeOut()
                }, settings.time);
            }
        }
    })($);

    $(function(){

        //首页切换
        $(".new-book ol li").on('click',function() {
            var index = $(this).index();
            var _cid = $(this).data('cid');
            $(this).addClass("on").siblings("li").removeClass("on");
            // $(".new-book ul").eq(index).show().siblings("ul").hide();

            $.ajax({
                type: "GET",
                url: "/ajax/home_cid_list?cid="+_cid,
                async: false,
                success: function(info) {
                    if (info.code == 200 && info.data != "") {
                        $(".home_cid_list").html(info.data);
                    }
                }
            });

        });

        //小说页
        $(".book-info .intro .more").on('click',function() {
            $(this).toggleClass("show");
            $(".book-info .intro").toggleClass("show");
        });
        $(".go-review").on('click',function() {
            $('body,html').animate({
                scrollTop: $(".review").offset().top
            }, 300);
            return false;
        });
        $(".j-textarea").on("focus", function() {
            if ($(this).val() == "说点什么吧，您的评论是对本书最大的支持！") {
                $(this).val("")
            }
        }).on("blur", function() {
            if ($.trim($(this).val()) == "") {
                $(this).val("说点什么吧，您的评论是对本书最大的支持！")
            }
        }).on("keydown", function(){
            var len = $(".j-textarea").val().length;
            if (len >= 200) {
                var num = $(".j-textarea").val().substr(0,200);;
                $(".j-textarea").val(num);;
            }
            else {
                $(".j-count").text(200-len-1);
            }
            $(".form-msg").text("");
        });
        $(".j-send").on('click',function() {
            var txt = $(".j-textarea").val();
            var len = $(".j-textarea").val().length;
            if (txt == "说点什么吧，您的评论是对本书最大的支持！" || len == 0) {
                $(".form-msg").text("评论内容不能为空");
                return false;
            }
            else {
                alert("您的评论已提交，审核过后您的评论会出现在这里！");
            }
        });

        var $review = $(".review-list ul");
        if ($review.children("li").length > 5) {
            $review.children("li").slice(5).css("display","none");
            $(".review .more").on('click',function() {
                $(this).css("display","none");
                $review.children("li").slice(5).css("display","block");
            });
        }

        $(".guess ol li").on('click',function () {
            var index = $(this).index();
            $(this).addClass("on").siblings("li").removeClass("on");
            $(".guess ul").eq(index).show().siblings("ul").hide();
        });

        //搜索输入字符串合法性验证
        $("#search-btn").on('click',function(){
            var str = $("#q").val();
            var ret = /[^\w\u4e00-\u9fa5]/;
            if(ret.test(str)){
                alert("搜索内容不合法");
                return false;
            }else{
                return ture;
            }
        });

    });

});