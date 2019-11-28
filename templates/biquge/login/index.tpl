{extend name="base" /}
{block name="header"}
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/login_pc.css">
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{:url('/user/login',array(),'html','m')}");</script>{/block}
{block name="body"}

<div class="container">
    <div class="login">
        <div class="header"><h3>用户登录</h3></div>
        <div class="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form action="{:url('/login/index')}" method="post" class="layui-form">
                        <div class="uinArea">
                            <label class="input-tips">用户帐号：</label>
                            <div class="inputOuter username">
                                <input type="text" name="username" class="input-style" />
                            </div>
                        </div>
                        <div class="pwdArea">
                            <label class="input-tips">用户密码：</label>
                            <div class="inputOuter password">
                                <input type="password" name="password" class="input-style"/>
                            </div>
                        </div>
                        <div class="pwdArea">
                            <label class="input-tips">验证码：</label>
                            <div class="inputOuter">
                                <input type="text" name="verify" class="input-style verify-code"/>
                                <img src="{:captcha_src()}" alt="点击更换" title="点击更换" onclick="this.src='{:captcha_src()}?t='+Math.random()" class="captcha">
                            </div>
                        </div>
                        <div class="login-button-box" style="padding-left:48px;">
                            <input type="submit" value="登 录" class="button_blue" lay-submit lay-filter="login" />
                            &nbsp;&nbsp;&nbsp;<a href="{:url('/login/reg')}">注册账号?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>

{/block}
{block name="footer"}
<script>
    layui.use(['layer','jquery','form'],function () {
        var layer = layui.layer
            ,$ = layui.jquery
            ,form = layui.form;

        form.on('submit(login)', function (data) {

            var password = $('.password input');

            if (password.val().length < 6 ) {
                layer.msg("密码长度请大于6位!");
                return false;
            }

            $.post({
                url: data.form.action,
                data: $(data.form).serialize(),
                dataType:"json",
                success: function (info) {
                    if (info.code == 0) {
                        setTimeout(function () {
                            location.href = info.data;
                        }, 1000);
                    } else  {
                        $(".verify-code").val("");
                        $(".captcha").attr('src','{:captcha_src()}?time=' + Math.random());
                    }
                    layer.msg(info.msg);
                }
            });

            return false;
        });

    });

</script>
{/block}