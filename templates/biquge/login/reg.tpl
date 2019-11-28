{extend name="base" /}
{block name="header"}<link rel="stylesheet" type="text/css" href="__STATIC__/css/login_pc.css">{/block}
{block name="uaredirect"}<script type="text/javascript">uaredirect("{:url('/user/login',array(),'html','m')}");</script>{/block}
{block name="body"}

<div class="container">
    <div class="login">
        <div class="header">
            <h3>用户注册</h3>
        </div>
        <div class="web_login">
            <div class="login-box">
                <div class="login_form">
                    <form action="{:url('/login/reg')}" method="post" class="layui-form">
                        <div class="uinArea">
                            <label class="input-tips">用户帐号：</label>
                            <div class="inputOuter username">
                                <input type="text" name="username" required lay-verify="required" placeholder="请输入账号" class="input-style" />
                            </div>
                        </div>
                        <div class="uinArea" >
                            <label class="input-tips">电子邮件：</label>
                            <div class="inputOuter email">
                                <input type="text" name="email"  required lay-verify="email" placeholder="请输入电子邮件" class="input-style" />
                            </div>
                        </div>
                        <div class="pwdArea">
                            <label class="input-tips">用户密码：</label>
                            <div class="inputOuter password">
                                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" class="input-style"/>
                            </div>
                        </div>
                        <div class="pwdArea">
                            <label class="input-tips">重复密码：</label>
                            <div class="inputOuter password2">
                                <input type="password" name="password2" required lay-verify="required" placeholder="请重复密码" class="input-style"/>
                            </div>
                        </div>
                        <div class="pwdArea">
                            <label class="input-tips">验证码：</label>
                            <div class="inputOuter">
                                <input type="text" name="verify"  placeholder="请输入验证码" class="input-style verify-code"/>
                                <img src="{:captcha_src()}" alt="点击更换" title="点击更换" onclick="this.src='{:captcha_src()}?time='+Math.random()" class="captcha">
                            </div>
                        </div>
                        <div class="login-button-box">
                            <input type="submit" value="注 册" class="button_blue" lay-submit lay-filter="reg"/>
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

        $(".username input").blur(function () {
            check_item($(this).val(),"username")
        });

        $(".email input").blur(function () {
            check_item($(this).val(),"email")
        });

        //检测重复项
        function check_item(value,type) {
            $.post("{:url('/login/check')}", {type:type, value:value,}, function (info) {
                    if (info.code == -1) {
                        if (info.data == "username") {

                        }

                    }
                    console.log(result);
                }
            )
        }

        form.on('submit(reg)', function (data) {

            var password = $('.password input');
            var password2 = $('.password2 input');

            if (password.val().length < 6 || password2.val().length < 6) {
                layer.msg("密码长度请大于6位!");
                return false;
            }

            if (password.val() != password2.val()) {
                layer.msg("密码不一致,请重新输入");
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
                    }else  {
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