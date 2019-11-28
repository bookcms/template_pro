var user;
if (document.cookie.length > 0) {
    var offset = document.cookie.indexOf("_user=");
    if (offset > -1) {
        offset += 6;
        var end = document.cookie.indexOf(";", offset);
        if (end == -1) end = document.cookie.length;
        user = JSON.parse(unescape(document.cookie.substring(offset, end)));
    }
}
var script = document.createElement('script');
script.type = 'text/javascript';
script.src = '/static/layui/layui.js';
script.addEventListener('load', function(){
    layui.use(['layer', 'util'], function(){
        var $ = layui.jquery, layer = layui.layer, util = layui.util;
        var login = function(){
            layer.tab({
                move: false,
                shadeClose: true,
                tab: [{
                    title: '登录',
                    content: '<div class="account"><div class="layui-form layui-form-pane"><form action="/login.html?jumpurl='+$(window).attr('location')+'" method="post"><div class="layui-form-item"><label for="username" class="layui-form-label">账号</label><div class="layui-input-inline"><input type="text" id="username" name="username" required lay-verify="required" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label for="password" class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" id="password" name="password" required lay-verify="required" class="layui-input"></div></div><div class="layui-form-item"><button class="layui-btn layui-btn-fluid" lay-submit>登 录</button></div></form></div></div>'
                }, {
                    title: '注册',
                    content: '<div class="account"><div class="layui-form layui-form-pane"><form action="/register.html?jumpurl='+$(window).attr('location')+'" method="post"><div class="layui-form-item"><label for="username" class="layui-form-label">账号</label><div class="layui-input-inline"><input type="text" id="username" name="username" required lay-verify="required" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label for="email" class="layui-form-label">邮箱</label><div class="layui-input-inline"><input type="text" id="email" name="email" required lay-verify="required" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label for="password" class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" id="password" name="password" required lay-verify="required" class="layui-input"></div></div><div class="layui-form-item"><button class="layui-btn layui-btn-fluid" lay-submit>登 录</button></div></form></div></div>'
                }]
            });
            $('.layui-layer-tab,.layui-layer-shade').click(function(e){
                e.stopPropagation();
            });
        };
        $('.header .i_back').click(function(){
            history.back();
        });
        $('.header .i_history').click(function(){
            $(window).attr('location', '/history.html');
        });
        $('.header .i_menu').click(function(e){
            layer.tips('<a href="/">首 页</a><a href="/library.html">书 库</a><a href="/history.html">历 史</a><a href="/search.html">搜 索</a>', this, {
                tips: [3, '#f2f2f2'],
                time: 0,
                skin: 'menu',
                fixed: true,
                shade: 0.01,
                shadeClose: true
            });
            $('.menu').click(function(e){
                e.stopPropagation();
            });
        });
        $('.search .i_search').click(function(){
            $(window).attr('location', $('.search').attr('action'));
        });
        $('.search .i_cancel').click(function(){
            $(this).next('input').val('');
        });
        $('.search').submit(function(){
            if (!$(this).find('input').val().match(/^.+$/)) {
                layer.msg('请输入搜索内容！');
                return false;
            }
        });
        var page_id = $('body').attr('id') || '';
        if (page_id == 'library') {
            $('.filter li').click(function(){
                $('.library ul:not(.filter)').hide();
                if ($(this).hasClass('active')) {
                    $(this).removeClass('active');
                } else {
                    $(this).addClass('active').siblings().removeClass('active');
                    $('.library ul').eq($(this).index()+1).show();
                }
            });
        } else if (page_id == 'history') {
            var list = [];
            for (var i=0; i<window.localStorage.length; i++) {
                if (window.localStorage.key(i).substr(0,5) === 'book_') {
                    var book = JSON.parse(window.localStorage.getItem(window.localStorage.key(i)));
                    if (!book.readid) continue;
                    book.id = window.localStorage.key(i).substr(5);
                    list.push(book);
                }
            }
            list.sort(function(a, b){
                return b.readtime - a.readtime;
            });
            var html = '';
            for (var i=0; i<list.length; i++) {
                html += '<li article-id="'+list[i].id+'"><a href="/book/'+list[i].id+'/'+list[i].readid+'.html"><img src="https://img.9txs.com/'+list[i].id+'/'+list[i].dataid+'.jpg" onerror="this.onerror=null;this.src=\'/static/image/nocover.jpg\'"><i class="layui-icon"></i><p>'+list[i].name+'</p></a></li>';
            }
            $('ul.ilist').html(html);
            $('.caption b').text(list.length);
            $('.caption a').click(function(){
                if ($('ul.ilist').hasClass('edit')) {
                    $('ul.ilist').removeClass('edit');
                    $(this).text('编辑');
                    $('div.clear').hide();
                } else {
                    $('ul.ilist').addClass('edit');
                    $(this).text('完成');
                    $('div.clear').show();
                }
            });
            $('div.clear').click(function(){
                layer.confirm('确定清空吗？ ', {icon: 3, title:'提示'}, function(index){
                    $('ul.ilist li').each(function(){
                        window.localStorage.removeItem('book_'+$(this).attr('article-id'));
                    });
                    $('ul.ilist').html('');
                    $('.caption b').text('0');
                    layer.close(index);
                });
            });
            $('ul.ilist').on('click', 'i.layui-icon', function(){
                var li = $(this).parents('li');
                window.localStorage.removeItem('book_'+li.attr('article-id'));
                li.remove();
                $('.caption b').text($('ul.ilist li').length);
                return false;
            });
        } else if (page_id == 'mark') {
            $('.caption a').click(function(){
                if ($('ul.list').hasClass('edit')) {
                    $('ul.list').removeClass('edit');
                    $(this).text('编辑');
                } else {
                    $('ul.list').addClass('edit');
                    $(this).text('完成');
                }
            });
            $('ul.list').on('click', 'a.mark_del', function(){
                var li = $(this).parents('li');
                $.getJSON('/mark/del/'+li.attr('article-id')+'/?d=json', function(res){
                    if (res._status >= 0) {
                        li.remove();
                        $('.caption b').text($('ul.list li').length);
                    }
                    layer.msg(res._info);
                });
            });
        }
        var articleid = $('body').attr('article-id') || 0;
        if (articleid > 0) {
            var visit = window.localStorage.getItem('visit_'+articleid) || 0;
            if (Math.floor(visit/8640000) !== Math.floor($.now()/8640000)) {
                $.get('/book/visit/'+articleid+'/');
                window.localStorage.setItem('visit_'+articleid, $.now());
            }
            $('#vote').click(function(){
                if (!user) return login();
                $.getJSON('/book/vote/'+articleid+'/?d=json', function(res){
                    layer.msg(res._info);
                });
            });
            $('#mark').click(function(){
                if (!user) return login();
                $.getJSON('/mark/add/'+articleid+'/?d=json', function(res){
                    layer.msg(res._info);
                });
            });
            if ($('body').attr('id') == 'read') {
                $('.read li span').remove();
                $('.read li').removeClass('now');
                var book = JSON.parse(window.localStorage.getItem('book_'+articleid) || '{"readid":0}');
                if (book.readid > 0) {
                    var read=$('.read li[chapter-id='+book.readid+']');
                    read.addClass('now');
                    read.children('a').prepend('<span><i class="layui-icon i_history"></i> 上次读到</span>');
                    //$('html,body').animate({scrollTop: read.offset().top-45+'px'});
                }
            } else if ($('body').attr('id')=='chapter') {
                var chapterid = $('body').attr('chapter-id');
                var book = {name:$('#bookname').text(),author:$('#author').text(),dataid:$('body').attr('data-id')||0,readid:chapterid,readname:$('.content h1').text(),readtime:$.now()};
                window.localStorage.setItem('book_'+articleid, JSON.stringify(book));
                var size = parseInt(window.localStorage.getItem('size')) || 18;
                var theme = window.localStorage.getItem('theme') || '0';
                var tabbar = false;
                $('#chapter').append('<ul class="tabbar"><li><i class="layui-icon i_prev"></i>上一章</li><li><i class="layui-icon i_read"></i>目录</li><li><i class="layui-icon i_set"></i>设置</li><li><i class="layui-icon i_book"></i>书页</li><li><i class="layui-icon i_next"></i>下一章</li></ul><div class="setting"><ul class="size"><li></li><li></li></ul><ul class="theme"><li></li><li></li><li></li><li></li><li></li><li></li></ul></div>');
                $('.tabbar li').click(function(){
                    switch ($(this).index()) {
                        case 0:
                            $(window).attr('location', $('.pager a').eq(0).attr('href'));
                            break;
                        case 1:
                            $(window).attr('location', $('.pager a').eq(1).attr('href'));
                            break;
                        case 2:
                            if ($(this).hasClass('now')) {
                                $('.setting').hide();
                                $(this).removeClass('now');
                            } else {
                                $('.setting').show();
                                $(this).addClass('now');
                            }
                            break;
                        case 3:
                            $(window).attr('location', '/book/'+articleid+'.html');
                            break;
                        case 4:
                            $(window).attr('location', $('.pager a').eq(2).attr('href'));
                            break;
                    }
                });
                var setsize = function(s){
                    $('.size li').removeClass('disabled');
                    if (size <= 10) {
                        size = 10;
                        $('.size li').eq(0).addClass('disabled');
                    } else if (size >= 30) {
                        size = 30;
                        $('.size li').eq(1).addClass('disabled');
                    }
                    $('.content p').css('font-size', size+'px');
                    window.localStorage.setItem('size', size);
                }
                setsize();
                $('.size li').click(function(){
                    if ($(this).index() > 0) {
                        if (size >= 30) return;
                        size += 2;
                    } else {
                        if (size <= 10) return;
                        size -= 2;
                    }
                    setsize();
                });
                var settheme = function(){
                    $('.theme li').removeClass('now');
                    $('.theme li').eq(theme).addClass('now');
                    $('#chapter').attr('class', 'style_'+theme);
                    window.localStorage.setItem('theme', theme);
                }
                settheme();
                $('.theme li').click(function(){
                    theme = $(this).index();
                    settheme();
                });
                $('#main').click(function(e){
                    if (e.target.nodeName=='LI' || e.target.nodeName=='A') return;
                    if (tabbar) {
                        $('.setting').hide();
                        $('.tabbar li').eq(2).removeClass('now');
                        $('.header').css('top', '-45px');
                        $('.tabbar').css('bottom', '-50px');
                        return tabbar = false;
                    }
                    var x = e.clientX;
                    var y = e.clientY;
                    var w = $(window).width();
                    var h = $(window).height();
                    var t = $(window).scrollTop();
                    //if(x / w < 0.65 && y / h <= 0.3 || x / w <= 0.35) return $('html,body').animate({scrollTop: t-h+size+20+'px'});
                    //if(x / w > 0.35 && y / h >= 0.7 || x / w >= 0.65) return $('html,body').animate({scrollTop: t+h-size-20+'px'});
                    if(y / h <= 0.25) return $('html,body').animate({scrollTop: t-h+size+20+'px'});
                    if(y / h >= 0.75) return $('html,body').animate({scrollTop: t+h-size-20+'px'});
                    tabbar = true;
                    $('.header').css('top', 0);
                    $('.tabbar').css('bottom', 0);
                });

                $('.header,.tabbar,.setting').click(function(e){
                    e.stopPropagation();
                });

                if (!window.localStorage.getItem('help')) {
                    var help = $('<ul class="shadow" id="help"><li class="help-top"></li><li class="help-bottom"></li><li class="help-left">上一页</li><li class="help-right">下一页</li><li class="help-center">呼出菜单</li></ul>');
                    $('#chapter').append(help);
                    help.click(function(e){
                        e.stopPropagation();
                        help.remove();
                        window.localStorage.setItem('help', 1);
                    });
                }
                return util.fixbar({
                    bar1: '&#xe688;',
                    bar2: '&#xe600;',
                    bgcolor: 'rgba(0,0,0,0.5)',
                    css: {bottom: 50, right: 20},
                    click: function(type){
                        if (type === 'bar1') {
                            var title = '《'+$('#bookname').text()+'》——'+$('h1.headline').text();
                            var text = $('.content p').text().replace(/\s+/g, '');
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
                                anim: 5,
                                shade: 0.01,
                                move: false,
                                resize: false,
                                success: function(){
                                    var audio = $('#audio');
                                    audio.attr('src', url.replace('content', encodeURI(title))).on('ended', function(){
                                        if (page >= Math.ceil(text.length/200)) return layer.confirm('是否跳转下一章？', {icon: 3, title:'本章阅读完毕'}, function(index){
                                            $(window).attr('location', $('.pager a').eq(2).attr('href'));
                                        }, function(index){
                                            page = 0;
                                            audio.attr('src', url.replace('content', encodeURI(title)));
                                        });
                                        audio.attr('src', url.replace('content', encodeURI(text.substr((++page-1)*200, 200)))).trigger('play');
                                    }).trigger('play');
                                },
                                cancel: function(){
                                    layer.confirm('是否关闭在线阅读？', {icon: 3, title:'本章阅读中'}, function(){
                                        layer.closeAll();
                                    });
                                    return false;
                                }
                            });
                        } else if (type === 'bar2') {
                            if (!user) return login();
                            $.getJSON('/mark/add/'+articleid+'/'+chapterid+'/?d=json', function(res){
                                if (res._status>0) $('[lay-type="bar2"]').html('&#xe658;');
                                layer.msg(res._info);
                            });
                        }
                    }
                });
            }
        }
        util.fixbar({
            bgcolor: 'rgba(0,0,0,0.5)',
            css: {bottom: 50, right: 20}
        });
    });
});
document.getElementsByTagName('head')[0].appendChild(script);