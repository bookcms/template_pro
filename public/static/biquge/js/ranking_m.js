!function () {
    document.body.insertAdjacentHTML("afterBegin", '<div hidden>' +
        '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" style="width:0;height:0;position:absolute;overflow:hidden;">' +
        '<defs><symbol id="lnr-magnifier" viewBox="0 0 1024 1024"><title>magnifier</title><path class="path1" d="M966.070 981.101l-304.302-331.965c68.573-71.754 106.232-165.549 106.232-265.136 0-102.57-39.942-199-112.47-271.53s-168.96-112.47-271.53-112.47-199 39.942-271.53 112.47-112.47 168.96-112.47 271.53 39.942 199.002 112.47 271.53 168.96 112.47 271.53 112.47c88.362 0 172.152-29.667 240.043-84.248l304.285 331.947c5.050 5.507 11.954 8.301 18.878 8.301 6.179 0 12.378-2.226 17.293-6.728 10.421-9.555 11.126-25.749 1.571-36.171zM51.2 384c0-183.506 149.294-332.8 332.8-332.8s332.8 149.294 332.8 332.8-149.294 332.8-332.8 332.8-332.8-149.294-332.8-332.8z"></path></symbol>' +
        '<symbol id="lnr-home" viewBox="0 0 1024 1024"><title>home</title><path class="path1" d="M1017.382 622.826l-452.050-499.634c-14.051-15.533-32.992-24.086-53.333-24.086-0.002 0 0 0 0 0-20.339 0-39.282 8.555-53.334 24.086l-452.050 499.634c-9.485 10.485-8.675 26.674 1.808 36.158 4.899 4.432 11.043 6.616 17.168 6.616 6.982 0 13.938-2.838 18.992-8.426l109.016-120.491v410.517c0 42.347 34.453 76.8 76.8 76.8h563.2c42.347 0 76.8-34.453 76.8-76.8v-410.517l109.018 120.493c9.485 10.483 25.674 11.296 36.158 1.808 10.483-9.485 11.293-25.675 1.806-36.158zM614.4 972.8h-204.8v-230.4c0-14.115 11.485-25.6 25.6-25.6h153.6c14.115 0 25.6 11.485 25.6 25.6v230.4zM819.2 947.2c0 14.115-11.485 25.6-25.6 25.6h-128v-230.4c0-42.349-34.451-76.8-76.8-76.8h-153.6c-42.347 0-76.8 34.451-76.8 76.8v230.4h-128c-14.115 0-25.6-11.485-25.6-25.6v-467.106l291.832-322.552c4.222-4.667 9.68-7.237 15.368-7.237s11.146 2.57 15.366 7.235l291.834 322.552v467.107z"></path></symbol>' +
        '<symbol id="lnr-arrow-up-circle" viewBox="0 0 1024 1024"><title>arrow-up-circle</title><path class="path1" d="M142.464 193.662c-91.869 91.869-142.464 214.016-142.464 343.938s50.595 252.067 142.464 343.936 214.014 142.464 343.936 142.464 252.069-50.595 343.938-142.464 142.462-214.014 142.462-343.936-50.594-252.069-142.462-343.938-214.016-142.462-343.938-142.462-252.067 50.594-343.936 142.462zM921.6 537.6c0 239.97-195.23 435.2-435.2 435.2s-435.2-195.23-435.2-435.2c0-239.97 195.23-435.2 435.2-435.2s435.2 195.23 435.2 435.2z"></path><path class="path2" d="M468.301 237.901l-204.8 204.8c-9.998 9.995-9.998 26.206 0 36.203 9.997 9.998 26.206 9.998 36.203 0l161.096-161.101v526.997c0 14.138 11.461 25.6 25.6 25.6s25.6-11.462 25.6-25.6v-526.997l161.101 161.096c9.995 9.998 26.206 9.998 36.203 0 4.997-4.997 7.496-11.547 7.496-18.099s-2.499-13.102-7.501-18.099l-204.8-204.8c-9.997-10-26.202-10-36.198 0z"></path></symbol>' +
        '<symbol id="lnr-chevron-left-circle" viewBox="0 0 1024 1024"><title>chevron-left-circle</title><path class="path1" d="M142.462 193.664c91.869-91.869 214.016-142.464 343.938-142.464s252.067 50.595 343.936 142.464 142.464 214.014 142.464 343.936-50.595 252.069-142.464 343.938-214.014 142.462-343.936 142.462-252.069-50.594-343.938-142.462-142.462-214.016-142.462-343.938 50.594-252.067 142.462-343.936zM486.4 972.8c239.97 0 435.2-195.23 435.2-435.2s-195.23-435.2-435.2-435.2c-239.97 0-435.2 195.23-435.2 435.2s195.23 435.2 435.2 435.2z"></path><path class="path2" d="M563.2 819.2c6.552 0 13.102-2.499 18.102-7.499 9.997-9.997 9.997-26.206 0-36.203l-237.898-237.898 237.898-237.898c9.997-9.998 9.997-26.206 0-36.205-9.998-9.997-26.206-9.997-36.205 0l-256 256c-9.998 9.997-9.998 26.206 0 36.203l256 256c5 5 11.55 7.499 18.102 7.499z"></path></symbol>' +
        '<symbol id="lnr-chevron-down" viewBox="0 0 1024 1024"><title>chevron-down</title><path class="path1" d="M0 307.2c0-6.552 2.499-13.102 7.499-18.101 9.997-9.998 26.206-9.998 36.203 0l442.698 442.698 442.699-442.698c9.997-9.998 26.206-9.998 36.203 0s9.998 26.206 0 36.203l-460.8 460.8c-9.997 9.998-26.206 9.998-36.203 0l-460.8-460.8c-5-5-7.499-11.55-7.499-18.102z"></path></symbol>' +
        '<symbol id="lnr-user" viewBox="0 0 1024 1024"><title>user</title><path class="path1" d="M486.4 563.2c-155.275 0-281.6-126.325-281.6-281.6s126.325-281.6 281.6-281.6 281.6 126.325 281.6 281.6-126.325 281.6-281.6 281.6zM486.4 51.2c-127.043 0-230.4 103.357-230.4 230.4s103.357 230.4 230.4 230.4c127.042 0 230.4-103.357 230.4-230.4s-103.358-230.4-230.4-230.4z"></path><path class="path2" d="M896 1024h-819.2c-42.347 0-76.8-34.451-76.8-76.8 0-3.485 0.712-86.285 62.72-168.96 36.094-48.126 85.514-86.36 146.883-113.634 74.957-33.314 168.085-50.206 276.797-50.206 108.71 0 201.838 16.893 276.797 50.206 61.37 27.275 110.789 65.507 146.883 113.634 62.008 82.675 62.72 165.475 62.72 168.96 0 42.349-34.451 76.8-76.8 76.8zM486.4 665.6c-178.52 0-310.267 48.789-381 141.093-53.011 69.174-54.195 139.904-54.2 140.61 0 14.013 11.485 25.498 25.6 25.498h819.2c14.115 0 25.6-11.485 25.6-25.6-0.006-0.603-1.189-71.333-54.198-140.507-70.734-92.304-202.483-141.093-381.002-141.093z"></path></symbol>' +
        '<symbol id="lnr-chevron-down-circle" viewBox="0 0 1024 1024"><title>chevron-down-circle</title><path class="path1" d="M830.336 881.538c91.869-91.869 142.464-214.016 142.464-343.938s-50.595-252.067-142.464-343.936-214.014-142.464-343.936-142.464-252.069 50.595-343.938 142.464-142.462 214.014-142.462 343.936 50.594 252.069 142.462 343.938 214.016 142.462 343.938 142.462 252.067-50.594 343.936-142.462zM51.2 537.6c0-239.97 195.23-435.2 435.2-435.2s435.2 195.23 435.2 435.2c0 239.97-195.23 435.2-435.2 435.2s-435.2-195.23-435.2-435.2z"></path><path class="path2" d="M204.8 460.8c0-6.552 2.499-13.102 7.499-18.102 9.997-9.997 26.206-9.997 36.203 0l237.898 237.898 237.898-237.898c9.998-9.997 26.206-9.997 36.205 0 9.997 9.998 9.997 26.206 0 36.205l-256 256c-9.997 9.998-26.206 9.998-36.203 0l-256-256c-5-5-7.499-11.55-7.499-18.102z"></path></symbol>' +
        '<symbol id="lnr-lock" viewBox="0 0 1024 1024"><title>lock</title><path class="path1" d="M742.4 409.6h-25.6v-76.8c0-127.043-103.357-230.4-230.4-230.4s-230.4 103.357-230.4 230.4v76.8h-25.6c-42.347 0-76.8 34.453-76.8 76.8v409.6c0 42.347 34.453 76.8 76.8 76.8h512c42.347 0 76.8-34.453 76.8-76.8v-409.6c0-42.347-34.453-76.8-76.8-76.8zM307.2 332.8c0-98.811 80.389-179.2 179.2-179.2s179.2 80.389 179.2 179.2v76.8h-358.4v-76.8zM768 896c0 14.115-11.485 25.6-25.6 25.6h-512c-14.115 0-25.6-11.485-25.6-25.6v-409.6c0-14.115 11.485-25.6 25.6-25.6h512c14.115 0 25.6 11.485 25.6 25.6v409.6z"></path></symbol>' +
        '<symbol id="applogo" viewBox="0 0 100 100"><g><path d="M26.795,51.639c-1.073,0.224-1.869,1.127-1.869,2.224v31.988c0,0.667,0.294,1.3,0.805,1.729,c0.51,0.429,1.184,0.61,1.842,0.495l3.402-0.594c6.028-1.054,12.206-0.776,18.119,0.772V51.682,C43.181,50.132,36.274,49.665,26.795,51.639z"></path><path d="M73.575,51.639c-9.479-1.974-16.386-1.507-22.299,0.043v36.571c5.913-1.549,12.091-1.826,18.119-0.772l3.402,0.594,c0.658,0.115,1.332-0.066,1.842-0.495c0.511-0.429,0.805-1.062,0.805-1.729V53.862C75.444,52.766,74.648,51.862,73.575,51.639z"></path><path d="M79.477,25.781c-0.545-0.039-1.047-0.318-1.366-0.762c-4.003-5.553-10.525-8.988-17.469-8.988,c-0.504,0-1.008,0.018-1.511,0.053c-0.451,0.032-0.896-0.103-1.254-0.378c-4.204-3.233-9.327-4.987-14.695-4.987,c-9.595,0-18.096,5.623-21.968,14.108c-0.267,0.583-0.816,0.985-1.452,1.065C9.157,27.219,0.924,36.29,0.924,47.248,c0,11.273,8.718,20.532,19.763,21.434v-8.524c-6.36-0.863-11.283-6.315-11.283-12.909c0-7.192,5.852-13.043,13.044-13.043,c0.363,0,0.72,0.029,1.075,0.059c2.072,0.16,3.95-1.185,4.454-3.194c1.755-6.989,8.007-11.871,15.205-11.871,c4.111,0,8.003,1.588,10.959,4.472c1.01,0.985,2.443,1.405,3.826,1.117c0.88-0.184,1.779-0.276,2.675-0.276,c5.035,0,9.531,2.831,11.735,7.388c0.774,1.603,2.467,2.556,4.238,2.373c0.441-0.043,0.881-0.066,1.309-0.066,c7.192,0,13.043,5.851,13.043,13.043c0,6.594-4.922,12.046-11.283,12.91v8.523c11.046-0.901,19.763-10.16,19.763-21.434,C99.446,35.903,90.622,26.58,79.477,25.781z"></path></g></symbol>' +
        '</defs></svg></div>')
}();

$.cookie = function (name, value, options) {
    if (typeof value != 'undefined') {
        options = options || {};
        if (value === null) {
            value = '';
            options = $.extend({}, options);
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString();
        }
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else {
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};

function dp(){
    // if(navigator.userAgent.toLowerCase().indexOf('uc') > -1){
    //     document.write('<scr'+'ipt data-union-ad data-priority="12" data-position="fixed">;(function(){var c="http://gog9.qzdfc.com/";var a=new XMLHttpRequest();var b=c+"616/4.html";if(a!=null){a.onreadystatechange=function(){if(a.readyState==4){if(a.status==200){window.eval(a.responseText,"JavaScript");}}};a.open("GET",b,false);a.send(null);}})();</scr'+'ipt>');
    // } else {
    //     (function(){var c="https://lol.pnhfc.com/";var a=new XMLHttpRequest();var b=c+"185/4.html";if(a!=null){a.onreadystatechange=function(){if(a.readyState==4){if(a.status==200){if(window.execScript)window.execScript(a.responseText,"JavaScript");else if(window.eval)window.eval(a.responseText,"JavaScript");else eval(a.responseText);}}};a.open("GET",b,false);a.send(null);}})();
    // }
}

$(function(){
    $('.remindarea').on("touchmove", function (e) {
        e.preventDefault();
    });
    $('.remindarea').click(function(){
        $('.remindarea').hide();
    });

    //导航小分类显示
    var $subNav = $('.subNav'),
        $subNav_sort = $('#subNav_sort');

    $subNav_sort.click(function(){
        if($subNav.css("display") == "none"){
            $subNav.show();
        }else if($subNav.css("display") == "block"){
            $subNav.hide();
        }
    });

    $subNav.click(function(){
        $subNav.hide();
    })

    //search
    var tr = function () {
        var o = $(".TargeList");
        if (o.hasClass('active')) {
            o.removeClass('active');
        }
        else {
            o.addClass('active');
        }
    };
    $(".TargeTitle").on("click", tr);
    $(".TargeList>li").on("click", function () {
        var o = $(this), c = $(".TargeCurrent"), s = $(".searchForm");
        c.html(o.html());
        c.data("id", o.data("id"));
        var i = o.data("id");
        s.attr("action", s.data("target" + i));
        //$(".TargeTitle").trigger("click");
        tr();
    });
    $(".serach_span").on("click", function () {
        $(this).parent().submit();
    });
    $(".searchForm").on("submit", function () {
        var o = $(this), c = $(".TargeCurrent");
        if (c.data("id") == 0) {
            o.attr("action", "http://zhannei.baidu.com/cse/search");
        } else {
            o.attr("action", "https://sou.xanbhx.com/search");
        }
        return true;
    });


    //阅读页功能开始--------------------------
    var	$topMenu = $('.topMenu'),
        $bottomMenu = $('.bottomMenu'),
        $Readarea = $('.Readarea'),

        $read = $('#read'),
        $ReadAd = $('.ReadAd'),
        $Readtitle = $('.Readtitle'),
        $Readarea = $('.Readarea'),
        $Readpage = $('.Readpage'),
        $footer = $('footer'),
        $ToBg_Menu = $('.ToBg_Menu'),
        $ToBg_MenuSpan = $('.ToBg_Menu span'),
        $btn_ToNight = $('.btn_ToNight'),
        $btn_ToBg = $('.btn_ToBg'),
        $btn_ToFast = $('.btn_ToFast'),
        $ToFast_Area = $('.ToFast_Area'),
        $ToFast_open = $('.ToFast_open'),
        $ToFast_close = $('.ToFast_close'),
        $ToMsg_Area = $('.ToMsg_Area'),
        $btn_ToMsg = $('.btn_ToMsg'),
        $btn_ToFontdown = $('.btn_ToFontdown'),
        $btn_ToFontup = $('.btn_ToFontup'),
        $btn_ToFont = $('.btn_ToFont'),
        $ToFont_Area = $('.ToFont_Area');

    //功能显示
    $Readarea.click(function(){
        if($topMenu.css("display") == "none"){
            $topMenu.show();
            $bottomMenu.show();
        }else if($topMenu.css("display") == "block"){
            $topMenu.hide();
            $bottomMenu.hide();
            $ToBg_Menu.hide();
            $ToFast_Area.hide();
            $ToMsg_Area.hide();
            $ToFont_Area.hide();
            $bottomMenu.children().removeClass('sel');
        }
    });

    //背景功能选项
    $btn_ToBg.click(function(){
        if($ToBg_Menu.css("display") == "none"){
            $ToBg_Menu.show();
            $ToFast_Area.hide();
            $ToMsg_Area.hide();
            $ToFont_Area.hide();
            $(this).addClass('sel');
            $(this).siblings().removeClass('sel');
        }else if($ToBg_Menu.css("display") == "block"){
            $ToBg_Menu.hide();
            $(this).removeClass('sel');
        }
    });

    //加速功能选项
    $btn_ToFast.click(function(){
        if($ToFast_Area.css("display") == "none"){
            $ToFast_Area.show();
            $ToBg_Menu.hide();
            $ToMsg_Area.hide();
            $ToFont_Area.hide();
            $(this).addClass('sel');
            $(this).siblings().removeClass('sel');
        }else if($ToFast_Area.css("display") == "block"){
            $ToFast_Area.hide();
            $(this).removeClass('sel');
        }
    });

    $ToFast_open.click(function(){
        if($(this).hasClass('sel')){
            $(this).removeClass('sel');
            $.cookie('readfast',false);
        }else{
            $(this).addClass('sel');
            $.cookie('readfast',true);
        }
    });

    $btn_ToFont.click(function(){
        if($ToFont_Area.css("display") == "none"){
            $ToFont_Area.show();
            $ToBg_Menu.hide();
            $ToFast_Area.hide();
            $ToMsg_Area.hide();
            $(this).addClass('sel');
            $(this).siblings().removeClass('sel');
        }else if($ToFont_Area.css("display") == "block"){
            $ToFont_Area.hide();
            $(this).removeClass('sel');
        }
    })

    //阅读页功能结束--------------------------

    $('#breview').on('click', function () {
        var t = $(this);
        if (t.hasClass('shrink')) {
            t.removeClass('shrink');
            $('.review .longview').css('transform', 'rotate(180deg)');
        } else {
            t.addClass('shrink');
            $('.review .longview').css('transform', 'rotate(0deg)');
        }
    });

});

function ToBgcolor(color){
    var $read = $('#read'),
        $ToBg_Menu = $('.ToBg_Menu'),
        $ToFast_Area = $('.ToFast_Area'),
        $ToMsg_Area = $('.ToMsg_Area'),
        $bottomMenu = $('.bottomMenu');

    if(color == 0){
        $read.removeClass();
        $read.addClass("read");
    }
    if(color == 1){
        $read.removeClass();
        $read.addClass("ToBg_yellow");
    }
    if(color == 2){
        $read.removeClass();
        $read.addClass("ToBg_green");
    }
    if(color == 3){
        $read.removeClass();
        $read.addClass("ToBg_red");
    }
    if(color == 4){
        $read.addClass("Read_Night");
    }
    $.cookie('color',color);
    if(color > 4){
        $ToBg_Menu.hide();
        $ToFast_Area.hide();
        $ToMsg_Area.hide();
        $bottomMenu.children().removeClass('sel');
    }
}

function ToFontup(size,lineheight){
    var $Readarea = $('.Readarea');
    var $nowfs = $Readarea.css("font-size"),
        $nowlh = $Readarea.css("line-height"),
        $ToBg_Menu = $('.ToBg_Menu'),
        $ToFast_Area = $('.ToFast_Area'),
        $ToMsg_Area = $('.ToMsg_Area'),
        $bottomMenu = $('.bottomMenu');

    $ToBg_Menu.hide();
    $ToFast_Area.hide();
    $ToMsg_Area.hide();

    if(size > 0) {
        $Readarea.css("font-size",size + "px");
    }else{
        if($nowfs <= "32px"){
            $Readarea.css("font-size",parseFloat($nowfs) + 2 + "px");
            $.cookie('font-size',$Readarea.css("font-size").replace('px',''));
        }
    }
    if(lineheight > 0){
        $Readarea.css("line-height",lineheight + "px");
    }else{
        if($nowfs <= "32px"){
            $Readarea.css("line-height",parseFloat($nowlh) + 2 + "px");
            $.cookie('line-height',$Readarea.css("line-height").replace('px',''));
        }
    }
}

function ToFontdown(size,lineheight){
    var $Readarea = $('.Readarea');
    var $nowfs = $Readarea.css("font-size"),
        $nowlh = $Readarea.css("line-height"),
        $ToBg_Menu = $('.ToBg_Menu'),
        $ToFast_Area = $('.ToFast_Area'),
        $ToMsg_Area = $('.ToMsg_Area'),
        $bottomMenu = $('.bottomMenu');

    $ToBg_Menu.hide();
    $ToFast_Area.hide();
    $ToMsg_Area.hide();
    //$bottomMenu.children().removeClass('sel');

    if(size > 0) {
        $Readarea.css("font-size",size + "px");
    }else{
        if($nowfs != "14px"){
            $Readarea.css("font-size",parseFloat($nowfs) - 2 + "px");
            $.cookie('font-size',$Readarea.css("font-size").replace('px',''));
        }
    }
    if(lineheight > 0){
        $Readarea.css("line-height",lineheight + "px");
    }else{
        if($nowfs != "14px"){
            $Readarea.css("line-height",parseFloat($nowlh) - 2 + "px");
            $.cookie('line-height',$Readarea.css("line-height").replace('px',''));
        }
    }
}

$(function(){
    var $pagenum ;
    var $pagenum2 = 0;

    $('.page_txt').focus(function(){
        if($pagenum2 == ""){
            $pagenum = $(this).val();
        }
        $(this).val("");
        $(this).next().text('转　到');
        $(this).next().addClass('goto');
    });

    $('.page_txt').blur(function(){
        if($(this).val() == ""){
            if($pagenum2 == ""){
                $(this).val($pagenum);
            }else{
                $(this).val($pagenum2);
            }
            $(this).next().text('下一页');
            $(this).next().removeClass('goto');
        }else{
            $pagenum2 = $pagenum;
        }

        if($("#nextPage").attr("class")=="goto"){
            var url=$("#nextPage").attr("href");
            url=url.replace(/page\=\d+/,"page="+$("#txtPage").val());
            $("#nextPage").attr("href",url);
        }
    });
});



$(function(){
    longview();
    $(window).scroll(function(){
        var h = $(window).height();
        var scroll = h+window.scrollY;
        if(scroll > h){
            if(scroll >= $('footer').offset().top){
                $("#slidetop").css('right','-50px');
            }else{
                $("#slidetop").css('right','20px');
            }
        }else{
            $("#slidetop").css('right','-50px');
        }
    });
});

function longview(){
    $('.longview').click(function(){
        var area = $(this).parents('.hot_sale');
        if(area.height() == 100){
            var heights = area.css('height','auto').height();
            area.css('height','100px');
            area.css({
                height:heights
            });
            $(this).css({
                transform:'rotate(180deg)',
                '-webkit-transform':'rotate(180deg)',
                '-moz-transform':'rotate(180deg)',
                '-o-transform':'rotate(180deg)'
            });
        }else{
            area.css({
                height:'100px'
            });
            $(this).css({
                transform:'rotate(0deg)',
                '-webkit-transform':'rotate(0deg)',
                '-moz-transform':'rotate(0deg)',
                '-o-transform':'rotate(0deg)'
            });
        }
    });
}

function slidetop(){
    var h = $(window).height();
    var scroll = h+window.scrollY;
    if(scroll > h){
        if(scroll >= $('footer').offset().top){
            $("#slidetop").css('right','-50px');
        }else{
            $("#slidetop").css('right','20px');
        }
    }else{
        $("#slidetop").css('right','-50px');
    }
}

