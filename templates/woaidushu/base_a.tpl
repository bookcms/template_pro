<!doctype html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1,shrink-to-fit=no,minimal-ui">
<link rel="canonical" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_offset_sort($novel.chapter['Sort'],$novel['SourceList'],$novel.chapter['Url']),"","html",true)}"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<title>{$site_seo.title}</title>
<meta name="keywords" content="{$site_seo.keywords}">
<meta name="description" content="{$site_seo.description}">
<meta name="renderer" content="webkit"/>
<meta name="applicable-device" content="pc,mobile">
<meta http-equiv="Cache-Control" content="no-transform"/>
<meta http-equiv="Cache-Control" content="no-siteapp"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<script src="__STATIC__/js/zepto.min.js"></script>
<script src="__STATIC__/js/neirong.js"></script>
<script src="__STATIC__/layer/js/layer.js"></script>
<script src="__STATIC__/js/trans.js"></script>
<script src="__STATIC__/js/clipboard.min.js"></script>
<style>
html,body,h1,h2,h3,h4,h5,h6,div,dl,dt,dd,ul,ol,li,p,blockquote,pre,hr,figure,table,caption,th,td,form,fieldset,legend,input,button,textarea,menu{margin:0;padding:0;-webkit-box-sizing:border-box;box-sizing:border-box;-webkit-user-select:none;-webkit-tap-highlight-color:transparent;outline:0}header,footer,section,article,aside,nav,address,figure,figcaption,menu,details{display:block}table{border-collapse:collapse;border-spacing:0}caption,th{text-align:left;font-weight:normal}html,body,fieldset,img,iframe,abbr{border:0}i,cite,em,var,address,dfn{font-style:normal}[hidefocus],summary{outline:0}h1,h2,h3,h4,h5,h6,small{font-size:100%}sup,sub{font-size:83%}pre,code,kbd,samp{font-family:inherit}q:before,q:after{content:none}textarea{overflow:auto;resize:none}label,summary{cursor:default}a,button{cursor:pointer}h1,h2,h3,h4,h5,h6,em,strong,b{font-weight:bold}del,ins,u,s,a,a:hover{text-decoration:none}html,body{height:100%;width:100%;min-width:320px}body,textarea,input,button,select,keygen,legend{font:16px/1.5 "Segoe UI","Lucida Grande",Helvetica,Arial,"Microsoft YaHei",FreeSans,Arimo,"Droid Sans","wenquanyi micro hei","Hiragino Sans GB","Hiragino Sans GB W3",FontVsoicon,sans-serif;color:#333;outline:0;background:#f4f4f4}a,a:hover{color:#333;text-decoration:none}textarea{width:100%;-webkit-appearance:none;padding:10px 15px;margin-bottom:15px;line-height:21px;-webkit-user-select:text;background-color:#fff;border:1px solid rgba(0,0,0,.2);border-radius:3px;outline:0}select,input[type="text"],input[type="search"],input[type="password"],input[type="week"],input[type="number"],input[type="email"],input[type="url"],input[type="tel"],input[type="color"],input[type="datetime"],input[type="datetime-local"],input[type="date"],input[type="month"],input[type="time"]{width:100%;-webkit-appearance:none;-webkit-user-select:text;padding:10px 15px;margin-bottom:15px;line-height:21px;background-color:#fff;border:1px solid rgba(0,0,0,.2);border-radius:3px;outline:0}@media only screen and (-webkit-min-device-pixel-ratio:1.5){.ptm-line-x:after,.ptm-card:after,.ptm-input-row:first-child:after,.ptm-input-row:after,.ptm-btn-row:after,.ptm-list-view-cell:first-child:after,.ptm-list-view-cell:last-child:after,.ptm-list-view-cell:after,.ptm-user-view-cell:first-child:after,.ptm-user-view-cell:last-child:after,.ptm-user-view-cell:after,.ptm-grid-nine:after,.ptm-grid-nine li:after,.ptm-grid-sixteen:after,.ptm-grid-sixteen li:after,.ptm-waterfall li:after{right:-100%;bottom:-100%;-webkit-transform:scale(0.5)}}@media only screen and (-webkit-min-device-pixel-ratio:1.5){.ptm-timeline>li>.ptm-timeline-item:after,.ptm-timeline>li>.ptm-timeline-item>.ptm-timeline-header:after{right:-100%;bottom:-100%;-webkit-transform:scale(0.5)}}@font-face{font-family:"ptmicon";src:url('__STATIC__/font/ptm_iconfont.ttf') format('truetype')}
@-webkit-keyframes am-rotate{from{background-position:0 0}to{background-position:-240px 0}}
@-webkit-keyframes am-rotate2{from{background-position:0 0}to{background-position:-444px 0}}
@-webkit-keyframes rotate{0%{;-webkit-transform:rotate(0deg)}100%{;-webkit-transform:rotate(360deg)}}
@-webkit-keyframes bounce{0%,100%{;-webkit-transform:scale(0.0)}50%{;-webkit-transform:scale(1.0)}}
@-webkit-keyframes fadeIn{from{opacity:.3}}
@font-face{font-family:'FontAwesome';src:url('__STATIC__/font/fontawesome-webfont.ttf?v=4.3.0') format('truetype');font-weight:normal;font-style:normal}
@-webkit-keyframes fa-spin{0%{transform:rotate(0deg);-webkit-transform:rotate(0deg)}100%{transform:rotate(359deg);-webkit-transform:rotate(359deg)}}
@keyframes fa-spin{0%{transform:rotate(0deg);-webkit-transform:rotate(0deg)}100%{transform:rotate(359deg);-webkit-transform:rotate(359deg)}}
button,.ptm-btn{position:relative;display:inline-block;padding:6px 12px;margin-bottom:0;font-size:14px;font-weight:400;line-height:1.42857143;text-align:center;background-color:#ddd;white-space:nowrap;vertical-align:middle;-ms-touch-action:manipulation;touch-action:manipulation;cursor:pointer;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;user-select:none;border:1px solid #ddd;border-radius:4px}
.ptm-bar{position:relative;top:0;left:0;z-index:10;width:100%;background-color:#08c;color:#fff;display:block;height:45px;line-height:45px;font-size:18px;text-align:center}
.ptm-bar-nav{top:0}
.ptm-bar .ptm-pull-left{padding-left:10px;font-size:16px;font-weight:400}
.ptm-bar a{color:#fff}
.ptm-pull-left{float:left!important}
.ptm-bar .ptm-title{right:80px;left:80px;width:auto;margin:0;overflow:hidden;text-overflow:ellipsis;position:absolute}
.ptm-title{position:absolute;width:100%;margin:0 -10px;text-align:center;white-space:nowrap}
.ptm-title a{color:inherit}
.ptm-bar .ptm-pull-right{padding-right:10px;font-size:16px;font-weight:400}
.ptm-pull-right{float:right!important}
.ptm-clearfix:after{content:"020";display:block;height:0;clear:both;visibility:hidden}
.ptm-clearfix{clear:both;zoom:1}
.ptm-col-xs-1,.ptm-col-xs-2,.ptm-col-xs-3,.ptm-col-xs-4,.ptm-col-xs-5,.ptm-col-xs-6,.ptm-col-xs-7,.ptm-col-xs-8,.ptm-col-xs-9,.ptm-col-xs-10,.ptm-col-xs-11,.ptm-col-5{position:relative;float:left}
.ptm-col-xs-3{width:25%}
.ptm-col-xs-6{width:50%}
.ptm-btn-primary.ptm-btn-outlined{color:#08c}
.ptm-btn-primary.ptm-btn-outlined:active{background:#08c;color:#fff}
.ptm-btn-block{display:block;width:100%;padding:15px 0;margin-bottom:0;font-size:18px}
.ptm-btn-primary{color:#fff;background-color:#08c;border:1px solid #08c}
.ptm-btn-primary.active,.ptm-btn-primary:active{color:#fff;background-color:#08c;border:1px solid #08c}
.ptm-btn-outlined{background:transparent}
#source{display: none;}
html, #source{width: 100%; height: 100%;}
.to_nextpage{text-align: center; }
.to_nextpage a{margin-left: -2em;font-weight: bold;color: #a94442;}
mip-fixed{position: fixed !important;-webkit-transform: translate3d(0, 0, 0);transform: translate3d(0, 0, 0);margin: 0;padding: 0;}
.mip-layout-container{display: block;position: relative;}
.ptm-bar .ptm-iconfont{position:relative;z-index:20;font-size:20px;color:#fff;font-weight:400;line-height:45px}
.ptm-iconfont{position:relative;font-family:"ptmicon";font-size:16px;font-style:normal;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}
.fa{display:inline-block;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale;transform:translate(0,0)}
.fa-home:before{content:"\f015"}
.fa-search:before{content:"\f002"}
.fa-chevron-left:before{content:"\f053"}
.theme-default .pt-reader,body .theme-default .theme-bg{background:url(__STATIC__/images/default.png);color:#2e343f}.theme-moon .pt-reader{background:url(__STATIC__/images/moon.png)!important;color:#696969!important}.theme-moon .pt-menu .button,.theme-moon .pt-menu a{color:#666!important}.theme-white .pt-reader,body .theme-white .theme-bg{color:#2e343f;background:url(__STATIC__/images/white.png)}.theme-sheepskin .pt-reader,body .theme-sheepskin .bg{color:#453c2e;background:#e9dabe}.theme-purple .pt-reader,body .theme-purple .theme-bg{color:#3c4f62;background:#c7d5e0}.theme-green .pt-reader,body .theme-green .theme-bg{color:#282b29;background:#e9faff}.theme-pink .pt-reader,body .theme-pink .theme-bg{color:#2e343f;background:#e0b6c4}.pt-menu{display:none;color:#fff;top:0;left:0;z-index:20;width:100%;height:100%;position:absolute;-webkit-box-pack:center;-webkit-box-align:center}.pt-menu a,.pt-menu a:hover{color:#fff}.pt-menu .bg{position:absolute;top:0;left:0;width:100%;height:100%;z-index:15;background:rgba(36,36,36,0)}.pt-menu .header,.pt-menu .footer{left:0;right:0;z-index:30;height:44px;line-height:44px;position:absolute;background:rgba(36,36,36,0.9);-webkit-box-shadow:0 0 1px #000;display:-webkit-box}.pt-menu .header{top:0}.pt-menu .footer{bottom:0}.pt-menu .button{display:-webkit-box}.pt-menu .header .back{padding-left:5px;-webkit-box-flex:1}.pt-menu .header i{font-size:20px}.pt-menu .header .button{width:40px;padding-left:5px;-webkit-box-pack:center;-webkit-box-align:center}.pt-menu .header .button.active{color:#08c}.pt-menu .footer .button{display:block;-webkit-box-flex:1;text-align:center}.pt-menu .footer .button i,.pt-menu .footer .button span{line-height:1;width:100%;display:block}.pt-menu .footer .button i{font-size:17px;height:29px;line-height:35px;overflow:hidden}.pt-menu .footer .button span{height:15px;font-size:12px}.pt-menu .footer .button.active{color:#08c}.pt-menu .center .button{color:#fff;z-index:30;font-size:16px;padding:5px;position:absolute;top:45%;-webkit-transform:translateY(-50%);background:rgba(36,36,36,0.9);-webkit-box-shadow:0 0 1px #000}.pt-menu .center .button:nth-child(1){left:0;padding-right:10px}.pt-menu .center .button:nth-child(2){right:0;padding-left:10px}.pt-menu .setting,.pt-menu .change,.pt-menu .cache,.pt-menu .more{width:100%;border-bottom:1px solid #535353;background:rgba(36,36,36,0.9);-webkit-box-shadow:0 0 1px #000;position:absolute;left:0;bottom:44px;z-index:20;display:none}.pt-menu .option .theme-area{display:inline-block;-webkit-border-radius:50%;width:30px;height:30px;border:0;padding:2px;vertical-align:middle}.pt-menu .option .theme-area .ptm-btn{width:26px;height:26px;-webkit-border-radius:50%;vertical-align:top}.pt-menu .option .theme-area.active{width:34px;height:34px;border:2px solid #08c}.pt-menu .ptm-list-view{background:0;height:160px;text-align:center}.pt-menu .ptm-list-view .ptm-list-view-cell{font-size:14px;line-height:40px;padding:0 15px}.pt-menu .ptm-list-view .ptm-list-view-cell>a{margin:0;padding:0}.pt-menu .ptm-list-view .ptm-list-view-cell.active,.pt-menu .ptm-list-view .ptm-list-view-cell.active>a,.pt-menu .ptm-list-view .ptm-list-view-cell:active>a,.pt-menu .ptm-list-view .ptm-list-view-cell.hover>a{color:#08c}.pt-menu .setting .ptm-list-view{height:135px;text-align:left}.pt-menu .setting .ptm-list-view .ptm-list-view-cell{line-height:45px;display:-webkit-box}.pt-menu .setting .ptm-list-view .ptm-list-view-cell .title{width:50px;display:block;text-align:right}.pt-menu .setting .ptm-list-view .ptm-list-view-cell .option{;-webkit-box-flex:1}.pt-menu .change .ptm-list-view{height:160px;overflow-y:scroll}.pt-menu .cache .tip{padding:10px;font-size:14px;text-align:center}.pt-menu .ptm-tab-nav.ptm-tab-border{border-color:#000}.pt-menu .ptm-tab-nav.ptm-tab-border li{color:#fff;background-color:#1f2021;border-color:#000}.pt-menu .ptm-tab-nav.ptm-tab-border li.active{background-color:#08c}.pt-menu .more{width:40%;top:44px;right:0;left:auto;bottom:auto;border:0}.pt-menu .more .ptm-list-view{height:100%}.pt-reader.about{overflow-y:hidden;overflow-x:hidden}.pt-reader.menushow{width:100%;height:100%;overflow:hidden}.pt-reader .body{font-size:16px;padding:0;line-height:1.8;margin: auto;}.pt-reader .body .content .title{font-weight:bold;text-align:center;padding:10px;font-size:26px;text-indent:0}.pt-reader .body .content{padding:10px;padding-top:0}.pt-reader .body .content.anim{;-webkit-transition:-webkit-transform .3s ease-in-out}.pt-reader .body .content p{text-indent:2em;padding: 10px 15px;}.pt-reader.about .body{position:absolute;top:0;left:0;overflow-x:hidden}.pt-reader .body .aboutheader{display:none;position:absolute;top:0;left:0;padding:0 10px;font-size:14px;height:25px;line-height:25px}.pt-reader.about .body .aboutheader{display:-webkit-box}.pt-reader .body .aboutheader .title{color:#666;-webkit-box-flex:1}.pt-reader .body .aboutheader .page{width:50px;text-align:right;color:#999;font-size:13px}.pt-reader.about .body .content{padding:30px 15px 0;-webkit-column-gap:15px;-webkit-transform:translateZ(0)}.loading{top:0;left:0;width:100%;z-index:10;height:100%;font-size:16px;position:absolute;display:-webkit-box;-webkit-box-pack:center;-webkit-box-align:center}.loading img{height:30px;margin-right:5px}.endline{height:0;width:100%}
.theme-moon .ptm-bar{background-color: #353535;}
.theme-moon .ptm-btn-primary{background: #353535;border-color: #353535;}
.theme-moon .ptm-btn-primary.ptm-btn-outlined{color: #999;background: transparent;}
.pt-reader{display: block;margin: auto;width: 90%;max-width: 75pc;border: 1px solid #ccc;border-radius: 4px;}@media (max-width: 767px){.pt-reader{width:100%;border: 0px solid #ccc;}}
.pt-reader .body .preload{padding: 30px 0;text-align: center;}
.pt-reader .body .preload i{font-size: 24px;text-indent: 0;}
.content_btn .ptm-btn-block{padding: 6px 0;font-size: 14px;}
.content_btn div:first-child a{border-radius: 4px 0 0 4px;}
.content_btn div:nth-child(2) a{border-width: 1px 0;border-radius: 0;}
.content_btn div:last-child a{border-radius: 0 4px 4px 0;}
.aboutfooter{text-align: center;font-size: 14px;color: #999;line-height: 24px;height: 24px;}
.pt-reader .chaptercontent{margin: 15px auto;overflow-x: hidden;}
.content_toolbar{margin-top: 10px;font-size: 12px;}
.footer{padding-bottom: 100px;}
.dus52{padding: 0 10px;margin-bottom: 5px;}
.content{padding: 0!important;}
.back_r {position: absolute;right: 30px;top: 0px;float: right;padding: 0 10px;height: 28px;margin: 10px 10px;line-height: 26px;font-size: 14px;background-color: #aee8dd;border-radius: 3px;width: 65px;}
.headerpc{margin: 0 auto;max-width: 75pc;width: 90%;height: 60px;margin: 20px auto;}
.header_search{float: right;overflow: hidden;margin: 19px auto auto 60px;}
.header_search form{float:left;border:1px solid #0088cc;border-radius:3px;}
.header_search input{display:inline;}
.header_search input.search{width: 300px;height:30px;border:none;border-radius:3px 0 0 3px;text-indent:5px;font:14px/30px Microsoft Yahei,Arial,Tahoma,Verdana,sans-serif,Georgia,serif;}.header_search input:focus{outline:0;outline-offset:0;}.header_search button{width:80px;height:31px;border:none;background:#0088cc;color:#fff;font-size:14px;font-family:Microsoft Yahei,Arial,Tahoma,Verdana,sans-serif,Georgia,serif;cursor:pointer;}
.header_logo a{background: url(__STATIC__/images/all.png) no-repeat scroll 0 0 transparent;}
.header_logo a{float: left;display: block;width: 230px;height: 60px;background-position: 0 -35px;text-indent: -9999px;}
.header{width:100%;height:50px;box-shadow:0 1px 1px #08c;line-height:50px;}
.header{background-color:#08c;}
.container,.footer p{width:90%;max-width:75pc;margin: auto;}@media (max-width: 767px){.container,.footer p{width: 95%;}.pt-reader .body .content p{padding:0;}.pt-reader .body .content .title{font-size: 20px;}}
.header,.header a{color:#fff;}
.header .header-left{float:left;width:110px;text-align:left;text-shadow:1px 1px 2px #000;font-size:18px;}
.header .header-right{float:right;text-align:right;font-size:15px;}
.header .header-nav{float:left;width:300px;font-size:1pc;}
.header .header-nav a{float:left;width:60px;text-shadow:1px 1px 1px #666;}
.footer{padding: 10px 0;background-color: #08c;box-shadow: 0 -1px 1px #08c;color: #fff;text-align: center;font-size: 14px;}
.hidden-xs{display: block!important;}@media (max-width: 767px){.hidden-xs{display: none!important;}}
.visible-xs{display: none!important;}@media (max-width: 767px){.visible-xs{display: block!important;}}
.breadcrumb{width: 90%;max-width: 75pc;overflow: hidden;margin: 10px auto;padding: 8px 15px;border: 1px solid #ccc;border-radius: 4px;background-color: #e9faff;list-style: none;font-size: 14px;}
.breadcrumb>li{float: left;display: inline-block;}.breadcrumb>.active{color:#666;}.breadcrumb>li>a{color: #08c;}
.book{margin: 10px auto;width: 90%;max-width: 75pc;color: #888;font-weight: 400;font-size: 15px;overflow: hidden;padding: 10px;border: 1px solid #ccc;border-radius: 4px;background-color: #fff;box-shadow: 0 1px 1px rgba(0,0,0,.05);}
.book>a{color: #08c;}
.wangmeng{margin: auto;}
#back-top {position: fixed;bottom: 150px;right:10%;z-index: 5147483647;}
#back-top a {width: 36px;display: block;text-align: center;font: 11px/100% Arial, Helvetica, sans-serif;text-transform: uppercase;text-decoration: none;color: #bbb;-webkit-transition: 1s;-moz-transition: 1s;transition: 1s;}
#back-top a:hover {color: #000;}
#back-top span {width: 36px;height: 36px;display: block;border: 1px solid #999;background: #fff url(__STATIC__/images/1317.png) no-repeat center center;background-size: 50% 50%;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;-webkit-transition: 1s;-moz-transition: 1s;transition: 1s;}
#back-top a:hover span {background-color: #fff;}
.backtop-circle {position: fixed;z-index: 2147483647;right: 10px;bottom: 85%;width: 46px;height: 46px;-webkit-transition: opacity .25s,visibility .25s;transition: opacity .25s,visibility .25s;color: #fff;border-radius: 99px;background-color: rgba(0,0,0,.5);}
.backtop-circle .icon-ts{font-size: 18px;line-height: 1.96667;display: inline-block;box-sizing: border-box;width: 100%;height: 100%;padding:10%;text-align: center;color: rgba(255, 255, 255, 0.81);}
.am-share-title { background-color: rgba(51, 51, 51, 0.44); border-bottom: 1px solid #fff; border-top-left-radius: 2px; border-top-right-radius: 2px; color: #555; font-weight: 400; margin: 0 10px; padding: 10px 0 0; text-align: center; }
.am-share-title::after { border-bottom: 1px solid #dfdfdf; content: ""; display: block; height: 0; margin-top: 10px; width: 100%; }
.am-share { font-size: 14px; border-radius: 0; bottom: 80px; left: 0; position: fixed; text-align: center; -webkit-transform: translateY(200%); -ms-transform: translateY(200%); transform: translateY(200%); -webkit-transition: -webkit-transform 300ms; transition: transform 300ms ; width: 100%; z-index: 1110; }
.am-modal-active { transform: translateY(0px);  -webkit-transform: translateY(0); -ms-transform: translateY(0); transform: translateY(0) }
.am-share-sns { background-color: rgba(51, 51, 51, 0.44); border-radius: 0 0 2px 2px; margin: 0 10px; padding-top: 15px; height:auto; zoom:1; overflow:auto; }
.am-share-sns li { margin-bottom: 15px; display: block; float: left; height: auto;  width: 20%; }
.am-share-sns a { color: #555; display: block; text-decoration:none; }
.am-share-sns span { display: block; color: #d7d7d8;}
.am-share-sns li i { background-position: center 50%; background-repeat: no-repeat; background-size: 36px 36px; background-color: #ccc; color: #fff; display: inline-block; font-size: 18px; height: 36px; line-height: 36px; margin-bottom: 5px; width: 36px; }
.am-share-sns .share-icon-tingshu { border-radius: 99px;background-image: url(__STATIC__/images/tingshu.png); }
.sharebg { background-color: rgba(0, 0, 0, 0.6); bottom: 0; height: 100%; left: 0; opacity: 0; position: fixed; right: 0; top: 0; width: 100%; z-index: 1100; display:none; }
.sharebg-active { opacity: 1; display:block; }body:before{position: unset!important;}
</style>
</head>
<body id="top">
<div class="headerpc hidden-xs">
	<div class="header_logo">
		<a data-type="mip" href="{$site_config.site_domain}" data-title="{$site_config.site_name}">{$site_config.site_name}</a>
	</div>
	<div class="header_search">
	</div>
	<div class="clear"></div>
</div>
<div class="header hidden-xs">
	<div class="container">
		<div class="header-left visible-xs">
			<a data-type="mip" href="{$site_config.site_domain}" data-title="{$site_config.site_name}" class="logo">{$site_config.site_name}</a>
		</div>
		<div class="header-right"><a href="#">阅读历史</a></div>
		<div class="header-nav">
			<a data-type="mip" data-title="{$site_config.site_name} 首页" href="{$site_config.site_domain}">首 页</a>
			<a data-type="mip" data-title="全部小说" href="{:url("/classify")}">书 库</a>
			<a data-type="mip" data-title="热门小说排行榜" href="{:url("/top")}">排 行</a>
			<a data-type="mip" data-title="热门全本小说" href="{:url("/full")}">全 本</a>
		</div>
	</div>
	<div class="clear"></div>
</div>
<header class="ptm-bar ptm-bar-nav visible-xs">
	<a data-type="mip" class="ptm-pull-left" href="/" data-title="{$site_config.site_name}">
		<span class="ptm-iconfont fa fa-home"></span>
	</a>
	<div class="ptm-title">{$site_config.site_name}</div>
	<a data-type="mip" class="ptm-pull-right" href="/search" data-title="小说搜索">
		<span class="ptm-iconfont fa fa-search"></span>
	</a>
	<div class="back_r"><a id="translatelink" style="color:red;" href="javascript:translatePage();" title="点击[繁/简]切换">繁体版</a></div>
</header>
	{block name="body"}{/block}
	<div class="footer">
	<p class="hidden-xs">本站所有小说均根据搜索引擎转码而来，只为让更多读者欣赏，本站不保存小说内容及数据，仅作宣传展示，如有侵犯版权，请来信告知(底部)，本站立即处理。</p>
	<p class="hidden-xs">Copyright &copy;{$site_config.site_name} All Rights Reserved.</p>
	<p class="visible-xs">本站系基于互联网搜索引擎技术为您提供信息检索服务。</p>
	<p class="visible-xs">Copyright &copy;{$site_config.site_name}</p>
	<div class="clear"></div>
</div>
<mip-fixed type="gototop">
    <mip-gototop></mip-gototop>
</mip-fixed>
<script type="text/javascript" src="/static/layui/layui.js"></script>
{block name="footer"}{/block}
</body>
</html>