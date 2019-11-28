layui.use(['jquery', 'layer'], function () {
    var $ = layui.jquery, layer = layui.layer;

    //设置cookie
    var setCookie = function(cname, cvalue, exdays) {
        var day = new Date();
        day.setTime(day.getTime() + (exdays*24*60*60*1000));
        document.cookie = cname + "=" + encodeURI(cvalue) + "; " + "expires=" + day.toUTCString() +"; path=/";
    };

    //获取cookie
    var getCookie = function(cname) {
        var name = cname + "=";
        var obj = document.cookie.split(';');
        for (var i = 0; i < obj.length; i++) {
            var c = obj[i];
            while (c.charAt(0)==' ') c = c.substring(1);
            if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
        }
        return "";
    };

    //清除cookie
    var clearCookie = function(cname) {
        setCookie(cname, "", -1);
    };

    //检查cookie
    var checkCookie = function(cname) {
        var value = getCookie(cname);
        if (value != "") {
            return true;
        }
        else {
            return false;
        }
    };

    $(".left-btns li").on('click', function () {
        var index = $(this).index();
        $(this).addClass("on").siblings("li").removeClass("on");
        if (index < 3) {
            $(".show-panel").eq(index).addClass("on").siblings(".show-panel").removeClass("on");
        } else {
            $(".show-panel").removeClass("on");
        }
    });
    $(".hide-panel").on('click', function () {
        $(".left-btns li").removeClass("on");
        $(".show-panel").removeClass("on");
    });
    $(".hide-panel").on('click', function () {
        $(".left-btns li").removeClass("on");
        $(".show-panel").removeClass("on");
    });
    $(".chapter-wrap .page .index").on('click', function () {
        $(".left-btns li.btn-chapter").addClass("on").siblings("li").removeClass("on");
        $(".chapter-panel").addClass("on").siblings(".show-panel").removeClass("on");
    });
    $(".set-skin dd span").on('click', function () {
        $(this).addClass("cur").siblings("span").removeClass("cur");
        var value = $(this).attr("data-value");
        switch (value) {
            case "0":
                $("body").removeClass().addClass("chapter-skin0");
                break;
            case "1":
                $("body").removeClass().addClass("chapter-skin1");
                break;
            case "2":
                $("body").removeClass().addClass("chapter-skin2");
                break;
        }
    });
    $(".set-font-family dd span").on('click', function () {
        $(this).addClass("cur").siblings("span").removeClass("cur");
        var value = $(this).attr("data-value");
        switch (value) {
            case "0":
                $(".chapter-wrap").removeClass("font-family0 font-family1 font-family2").addClass("font-family0");
                break;
            case "1":
                $(".chapter-wrap").removeClass("font-family0 font-family1 font-family2").addClass("font-family1");
                break;
            case "2":
                $(".chapter-wrap").removeClass("font-family0 font-family1 font-family2").addClass("font-family2");
                break;
        }
    });
    $(".set-font-size dd .prev").on('click', function () {
        var size = parseInt($(".set-font-size dd .size").text());
        if (size <= 12) {
            size = 12;
        } else {
            size = size - 1;
        }
        $(".set-font-size dd .size").text(size);
        $(".chapter-wrap").css("font-size", size);

    });
    $(".set-font-size dd .next").on('click', function () {
        var size = parseInt($(".set-font-size dd .size").text());
        if (size >= 36) {
            size = 36;
        } else {
            size = size + 1;
        }
        $(".set-font-size dd .size").text(size);
        $(".chapter-wrap").css("font-size", size);
    });
    $(".set-width dd .prev").on('click', function () {
        var size = parseInt($(".set-width dd .size").text());
        if (size <= 760) {
            size = 760;
        } else {
            size = size - 100
        }
        $(".set-width dd .size").text(size);
        $(".chapter-container").removeClass("w760 w860 w960 w1060").addClass("w" + size);

    });
    $(".set-width dd .next").on('click', function () {
        var size = parseInt($(".set-width dd .size").text());
        if (size >= 1060) {
            size = 1060;
        } else {
            size = size + 100
        }
        $(".set-width dd .size").text(size);
        $(".chapter-container").removeClass("w760 w860 w960 w1060").addClass("w" + size);
    });
    $(".set-btns .btn-save").on('click', function () {
        var a, b, c, d, e;
        $(".set-skin dd span").each(function () {
            if ($(this).hasClass("cur")) {
                a = $(this).attr("data-value");
            }
        });
        $(".set-font-family dd span").each(function () {
            if ($(this).hasClass("cur")) {
                b = $(this).attr("data-value");
            }
        });
        c = $(".set-font-size dd .size").text();
        d = $(".set-width dd .size").text();
        e = '{"skin":' + a + ',"family":' + b + ',"size":' + c + ',"width":' + d + '}';
        clearCookie("hs13_set123");
        setCookie("hs13_set123", e, "365");
        $(".left-btns li").removeClass("on");
        $(".show-panel").removeClass("on");
    });
    $(".set-btns .btn-cancel").on('click', function () {
        $(".left-btns li").removeClass("on");
        $(".show-panel").removeClass("on");
    });

    if (checkCookie("hs13_set123") == true) {
        var data = JSON.parse(decodeURI(getCookie("hs13_set123")));
        $("body").removeClass().addClass("chapter-skin" + data.skin);
        $(".chapter-container").removeClass("w760 w860 w960 w1060").addClass("w" + data.width);
        $(".chapter-wrap").css("font-size", data.size);
        $(".chapter-wrap").removeClass("font-family0 font-family1 font-family2").addClass("font-family" + data.family);
        $(".set-skin dd span").each(function () {
            if ($(this).attr("data-value") == data.skin) {
                a = $(this).addClass("cur").siblings("span").removeClass("cur");
            }
        });
        $(".set-font-family dd span").each(function () {
            if ($(this).attr("data-value") == data.family) {
                a = $(this).addClass("cur").siblings("span").removeClass("cur");
            }
        });
        $(".set-font-size dd .size").text(data.size);
        $(".set-width dd .size").text(data.width);
    }

    $(window).scroll(function () {
        if ($(".left-bar,.right-bar").length > 0) {
            var st = $(window).scrollTop();
            var ct = $(".chapter-wrap .main").offset().top;
            var cb = $(".chapter-wrap .main").offset().bottom;
            var ch = $(".chapter-wrap .main").height();
            if (st > ct && st < ct + ch) {
                $(".left-bar").css({position: "fixed", top: 0});
            } else {
                $(".left-bar").css({position: "absolute", top: ct});
            }
            $(".right-bar").css({position: "fixed", bottom: "20px"});
        }
    });


    //文字转语音
    $(".btn-voice").on("click",function () {
        var li = $(this).parent('li');
        var title = '《'+$('.book_name').data('title')+'》——'+$('.title h1').text();
        var text = $('.content').text().replace(/\s+/g, '');
        var page = 0;
        var spd = 5; //语速，取值0-9，默认为5中语速
        var pit = 5; //音调，取值0-9，默认为5中语调
        var vol = 5; //音量，取值0-15，默认为5中音量
        var per = 4; //发音人选择, 0为普通女声，1为普通男生，3为情感合成-度逍遥，4为情感合成-度丫丫，默认为普通女声
        var url = '//tsn.baidu.com/text2audio?lan=zh&ctp=1&pdt=1&cuid=baidu_speech_demo&tex=content&spd='+spd+'&pit='+pit+'&vol='+vol+'&per='+per;
        layer.open({
            type: 1,
            title: '朗读',
            content: '<audio id="audio" controls="controls">浏览器不支持在线阅读！</audio>',
            // offset: [$(this).offset().top + "px", $(this).offset().left + 70 +'px'],
            skin: 'audio',
            anim: 5,
            shade: 0.01,
            move: false,
            resize: false,
            success: function(){
                var audio = $('#audio');
                audio.attr('src', url.replace('content', encodeURI(title))).on('ended', function(){
                    if (page >= Math.ceil(text.length/200)) return layer.confirm('是否跳转下一章？', {icon: 3, title:'本章阅读完毕'}, function(index){
                        $(window).attr('location', $('.page a').eq(2).attr('href'));
                    }, function(index){
                        page = 0;
                        audio.attr('src', url.replace('content', encodeURI(title)));
                    });
                    audio.attr('src', url.replace('content', encodeURI(text.substr((++page-1)*200, 200)))).trigger('play');
                }).trigger('play');
                li.addClass('on');
            },
            cancel: function(){
                layer.confirm('是否关闭在线阅读？', {icon: 3, title:'本章阅读中'}, function(){
                    layer.closeAll();
                });
                return false;
            },
            end: function(){
                li.removeClass('on');
            }
        });
    });

});