<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <title>修改密码-{$site_config.site_name}</title>
    <link href="//cdn.bootcss.com/weui/1.1.2/style/weui.min.css" rel="stylesheet" type="text/css"/>
    <link href="__CSS__/user_m.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div class="wrapper">
    <!--header-->
    <div class="header user-head">
        <div class="site-logo"><a href="/"></a></div>
    </div>
    <!--header-->
    <div class="member_center_block">
        <div class="weui-cells__title"  style="text-align: center">修改安全资料</div>
        <div class="weui-cells weui-cells_form">
            <form method='post' action='/user/info/pwd.html'>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">旧密码</label></div>
                    <div class="weui-cell__bd"><input type="text" class="weui-input" name="password" placeholder="请输入原密码" size="38" maxlength='20'></div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">新密码</label></div>
                    <div class="weui-cell__bd"><input type="password" class="weui-input" name="newpassword" placeholder="请输入新登陆密码" size="38" maxlength='20'></div>
                </div>

                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">确认密码</label></div>
                    <div class="weui-cell__bd"><input type="password" class="weui-input" name="repassword" placeholder="请重复输入新登陆密码" size="38" maxlength='20'></div>
                </div>

                <div class="weui-btn-area">
                    <button type="submit" class="weui-btn weui-btn_warn" id="showTooltips">修改资料</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- footer -->
<div class="footer">
    <div class="copyright">&copy; {$site_config.site_name}</div>
</div>
<!-- footer end -->
</div>
<script type="text/javascript" src="__JS__/svg.js"></script>

</body>
</html>