var mobileAgent = new Array("iphone", "ipod", "ipad", "android", "mobile", "blackberry", "webos", "incognito", "webmate", "bada", "nokia", "lg", "ucweb", "skyfire");
var browser = navigator.userAgent.toLowerCase();
for (var i=0; i<mobileAgent.length; i++){
    if (browser.indexOf(mobileAgent[i])!=-1){
        if(window.location.href.indexOf('//www.') > 0) {
            window.location.href = window.location.href.replace('//www.', '//m.');
        }
        break;
    }
}
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
var login = function(){}, mark = function(){}, vote = function(){}, phone = function(){};
var script = document.createElement('script');
script.type = 'text/javascript';
script.src = '/static/layui/layui.js';
var load = function(){
    layui.use(['layer', 'util'], function(){
        var $ = layui.jquery, layer = layui.layer, util = layui.util;
        var articleid = $('body').attr('article-id') || 0, chapterid = $('body').attr('chapter-id') || 0;
        login = function(){
            layer.tab({
                tab: [{
                    title: '登录',
                    content: '<div class="account"><div class="layui-form layui-form-pane"><form action="/login.html?jumpurl='+$(window).attr('location')+'" method="post"><div class="layui-form-item"><label for="username" class="layui-form-label">账号</label><div class="layui-input-inline"><input type="text" id="username" name="username" required lay-verify="required" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label for="password" class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" id="password" name="password" required lay-verify="required" class="layui-input"></div></div><div class="layui-form-item"><button class="layui-btn layui-btn-fluid" lay-submit>登 录</button></div></form></div></div>'
                }, {
                    title: '注册',
                    content: '<div class="account"><div class="layui-form layui-form-pane"><form action="/register.html?jumpurl='+$(window).attr('location')+'" method="post"><div class="layui-form-item"><label for="username" class="layui-form-label">账号</label><div class="layui-input-inline"><input type="text" id="username" name="username" required lay-verify="required" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label for="email" class="layui-form-label">邮箱</label><div class="layui-input-inline"><input type="text" id="email" name="email" required lay-verify="required" autocomplete="off" class="layui-input"></div></div><div class="layui-form-item"><label for="password" class="layui-form-label">密码</label><div class="layui-input-inline"><input type="password" id="password" name="password" required lay-verify="required" class="layui-input"></div></div><div class="layui-form-item"><button class="layui-btn layui-btn-fluid" lay-submit>登 录</button></div></form></div></div>'
                }],
                move: false,
                shadeClose: false
            });
        };
        phone = function() {
            var url = window.location.href.replace(/\/\/www\./i, '//m.');
            layer.open({
                type: 1,
                title: false,
                content: '<a href="'+url+'"><img src="/qrcode?size=250&text='+url+'"></a>',
                area: ['250px', '250px'],
                shadeClose: true
            });
        }
        vote = function(id){
            // if (!user) return login();
            // id = id || 0;
            // $.getJSON('/book/vote/'+id+'/?d=json', function(res){
            //     layer.msg(res._info);
            // });
        };
        mark = function(id, cid){
            // if (!user) return login();
            // id = id || 0;
            // cid = cid || 0;
            // $.getJSON('/mark/add/'+id+'/'+cid+'/?d=json', function(res){
            //     layer.msg(res._info);
            // });
        };
        $('.search').submit(function(){
            if (!$(this).find('input').val().match(/^.+$/)) {
                layer.msg('请输入搜索内容！');
                return false;
            }
        });

        if ($('[carousel-item]').length > 0) {
            layui.use(['carousel'], function(){
                layui.carousel.render({
                    elem: '#carousel',
                    width: '100%',
                    height: $('[carousel-item]').attr('height')+'px',
                    arrow: 'always'
                });
            });
        }
        if (chapterid > 0) {
            $('body').append('<ul id="setting" class="hide"><li class="theme"><p>主题模式：</p><a class="day"></a><a class="night"></a><a class="pink"></a><a class="yellow"></a><a class="blue"></a><a class="green"></a><a class="gray"></a></li><li class="style"><p>字体样式：</p><a class="yahei">雅黑</a><a class="songti">宋体</a><a class="kaishu">楷书</a></li><li class="size"><p>字体大小：</p><a class="iconfont icon-dec"></a><a class="num">18</a><a class="iconfont icon-inc"></a></li><li class="default"><p></p><a>恢复默认</a></li></ul><ul class="bar left_bar"><li><a class="iconfont icon-read" href="'+$('.page a').eq(1).attr('href')+'">目录</a></li><li><a class="iconfont icon-setting" href="javascript:void(0)">设置</a></li><li><a class="iconfont icon-info" href="'+$('#bookname').attr('href')+'">详情</a></li><li><a class="iconfont icon-mark" href="/user/rack_list.html" target="_blank">书架</a></li></ul><ul class="bar right_bar"><li><a class="layui-icon i_read" href="javascript:void(0)">朗读</a></li><li><a class="layui-icon i_phone" href="javascript:void(0)" onclick="phone()">手机</a></li><li><a class="layui-icon i_mark" href="javascript:void(0)" onclick="mark('+articleid+','+chapterid+')">收藏</a></li><li><a class="layui-icon i_vote" href="javascript:void(0)" onclick="vote('+articleid+')">推荐</a></li><li><a class="layui-icon i_prev" href="'+$('.page a').eq(0).attr('href')+'"></a></li><li><a class="layui-icon i_next" href="'+$('.page a').eq(2).attr('href')+'"></a></li></ul>');
            var book = {name:$('#bookname').text(),author:$('#author').text(),dataid:$('body').attr('data-id')||0,readid:chapterid,readname:$('#chapter h1').text(),readtime:$.now()};
            window.localStorage.setItem('book_'+articleid, JSON.stringify(book));
            var theme = function(v){
                if (typeof v === 'undefined') v = window.localStorage.getItem('theme') || 'day';
                $('#chapter').attr('class', v);
                $('li.theme a.'+v).addClass('on').siblings().removeClass('on');
                window.localStorage.setItem('theme', v);
            };
            var style = function(v){
                if (typeof v === 'undefined') v = window.localStorage.getItem('style') || 'yahei';
                $('#content').attr('class', v);
                $('li.style a.'+v).addClass('on').siblings().removeClass('on');
                window.localStorage.setItem('style', v);
            };
            var size = function(v){
                if (typeof v === 'undefined') v = parseInt(window.localStorage.getItem('size')) || 18;
                $('li.size a.num').text(v);
                $('#content').css('font-size', v);
                $('li.size a').removeClass('layui-disabled');
                if (v<=10) $('li.size a.icon-dec').addClass('layui-disabled');
                if (v>=50) $('li.size a.icon-inc').addClass('layui-disabled');
                $('li.size a.num').text(v);
                window.localStorage.setItem('size', v);
            };
            $('li.theme a').click(function(){
                theme($(this).attr('class'));
            });
            $('li.style a').click(function(){
                style($(this).attr('class'));
            });
            $('li.size a').click(function(){
                if ($(this).hasClass('num') || $(this).hasClass('layui-disabled')) return;
                size(parseInt($('li.size a.num').text()) + ($(this).hasClass('icon-dec') ? -2 : 2));
            });
            $('li.default a').click(function(){
                theme('day');
                style('yahei');
                size(18);
            });
            theme();
            style();
            size();
            $(document).keydown(function(e){
                switch (e.which) {
                    case 37:
                        $(window).attr('location', $('.page a').eq(0).attr('href'));
                        break;
                    case 39:
                        $(window).attr('location', $('.page a').eq(2).attr('href'));
                        break;
                    case 13:
                        $(window).attr('location', $('.page a').eq(1).attr('href'));
                        break;
                }
            });
            $('a.i_read').click(function(){
                var li = $(this).parent('li');
                var title = '《'+$('#bookname').text()+'》——'+$('#chapter h1').text();
                var text = $('#content').text().replace(/\s+/g, '');
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
                    offset: ['111px', $('.area').offset().left+'px'],
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
            $('a.icon-setting').click(function(){
                var li = $(this).parent('li');
                layer.open({
                    type: 1,
                    title: '设置',
                    content: $('#setting'),
                    area: ['500px', '350px'],
                    offset: ['111px', $('.area').offset().left+'px'],
                    skin: 'setting',
                    shade: 0.01,
                    shadeClose: true,
                    move: false,
                    resize: false,
                    success: function(){
                        li.addClass('on');
                    },
                    end: function(){
                        li.removeClass('on');
                    }
                });
            });
            return;
        }
        if (articleid > 0) {
            var visit = window.localStorage.getItem('visit_'+articleid) || 0;
            if (Math.floor(visit/8640000) !== Math.floor($.now()/8640000)) {
                $.get('/book/visit/'+articleid+'/');
                window.localStorage.setItem('visit_'+articleid, $.now());
            }
            if ($('#rate').length > 0) {
                layui.use(['rate'], function(){
                    layui.rate.render({
                        elem: '#rate',
                        value: $('#rate').text() / 2,
                        theme: '#00aeef',
                        half: true,
                        choose: function(value){
                            layui.rate.render({
                                elem: '#rate',
                                value: value,
                                theme: '#00aeef',
                                readonly: true,
                            });
                        }
                    });
                });
            }
            if ($('#expand').length > 0) {
                if ($('.mod p.intro')[0].scrollHeight > 100) {
                    $('#expand').css('visibility', 'visible').click(function(){
                        if ($(this).text() == '[+展开]') {
                            $(this).text('[-收起]');
                            $('.mod p.intro').height('auto');
                        } else {
                            $(this).text('[+展开]');
                            $('.mod p.intro').height(100);
                        }
                    });
                }
            }
            var book = JSON.parse(window.localStorage.getItem('book_'+articleid) || '{"readid":0}');
            if (book.readid > 0) {
                $('#last').html('读到：<a href="/book/'+articleid+'/'+book.readid+'.html">'+book.readname+'</a><span class="light">('+util.timeAgo(book.readtime,1)+')</span>');
                $('.read dd').removeClass('last');
                $('.read dd[chapter-id='+book.readid+']').addClass('last');
            }
        }
        $('.title.tab li').click(function(){
            $(this).addClass('on').siblings().removeClass('on');
            $(this).parents('.box').find('.list ul').hide().eq($(this).index()).show();
        });
        $('.list.tab li').mouseover(function(){
            $(this).addClass('on').siblings().removeClass('on');
        });
        $('.cover .tab li').mouseover(function(){
            if ($(this).hasClass('on')) return;
            $(this).addClass('on').siblings().removeClass('on');
            $('.cover .detail li').hide().eq($(this).index()).show();
        });
        $('#mark_list .mark_del').click(function(){
            var li = $(this).parents('li');
            layer.confirm('确定删除吗？ ', {icon: 3, title:'提示'}, function(index){
                $.getJSON('/mark/del/'+li.attr('article-id')+'/?d=json', function(res){
                    if (res._status >= 0) {
                        li.remove();
                        $('#mark_num').text($('#mark_list li').length);
                    }
                    layer.msg(res._info);
                });
            });
        });
        if ($('#history_list').length > 0) {
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
                html += '<li article-id="'+list[i].id+'"><a class="bookimg" href="/book/'+list[i].id+'.html"><img src="https://img.9txs.com/'+list[i].id+'/'+list[i].dataid+'.jpg" onerror="this.onerror=null;this.src=\'/static/image/nocover.jpg\'"><a class="bookname" href="/book/'+list[i].id+'.html">'+list[i].name+'</a><p>作者：<a href="/author/'+list[i].author+'/">'+list[i].author+'</a></p><p>读到：'+(list[i].readid>0?'<a href="/book/'+list[i].id+'/'+list[i].readid+'.html">'+list[i].readname+'</a>':'暂未阅读')+'</p><p>时间：'+util.timeAgo(list[i].readtime,1)+'</p><p class="action"><a href="/book/'+list[i].id+'/'+list[i].readid+'.html">继续阅读</a><a class="history_del" href="javascript:void(0)">移除记录</a></p></li>';
            }
            $('#history_list').html(html);
            $('#history_num').text(list.length);
            $('#history_clear').click(function(){
                layer.confirm('确定清空吗？ ', {icon: 3, title:'提示'}, function(index){
                    $('#history_list li').each(function(){
                        window.localStorage.removeItem('book_'+$(this).attr('article-id'));
                    });
                    $('#history_list').html('');
                    $('#history_num').text('0');
                    layer.close(index);
                });
            });
            $('#history_list').on('click', 'a.history_del', function(){
                var li = $(this).parents('li');
                window.localStorage.removeItem('book_'+li.attr('article-id'));
                li.remove();
                $('#history_num').text($('#history_list li').length);
                return false;
            });
        }
        util.fixbar({
            bar1: '&#xe63b;',
            bgcolor: 'rgba(0,0,0,0.5)',
            css: {bottom: 100, right: 100},
            click: function(type){
                if (type === 'bar1') phone();
            }
        });
    });
};

if (script.addEventListener) {
    script.addEventListener('load', load);
} else {
    script.onreadystatechange = function() {
        if (script.readyState === 'loaded' || script.readyState === 'complete') {
            script.onreadystatechange = null;
            load();
        }
    };
}

document.getElementsByTagName('head')[0].appendChild(script);