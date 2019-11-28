{extend name="base_m_no_nav" /}
{block name="header"}
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/login_m.css">
{/block}
{block name="body"}
<div class="login_box">
    <form action="{:url('/login/reg')}" method="post" class="layui-form">
        <div class="login_name username">
            <span class="person_bg"><svg class="lnr lnr-user"><use xlink:href="#lnr-user"></use></svg></span>
            <input type="text" class="name register_nm" name="username" value="" placeholder="账号名，7~12位字符">
        </div>
        <div class="login_name email">
            <span class="person_bg"><svg class="lnr lnr-user"><use xlink:href="#lnr-user"></use></svg></span>
            <input type="text" class="name" name="email" value="" placeholder="请输入电子邮箱">
        </div>
        <div class="login_name password">
            <span class="psw_bg"><svg class="lnr lnr-lock"><use xlink:href="#lnr-lock"></use></svg></span>
            <input type="text" class="name register_psw" name="password" value="" placeholder="请输入账号密码">
        </div>
        <div class="login_name password2">
            <span class="psw_bg"><svg class="lnr lnr-lock"><use xlink:href="#lnr-lock"></use></svg></span>
            <input type="text" class="name register_repsw" name="password2" value="" placeholder="再次输入密码">
        </div>
        <div class="login_name verify">
            <span class="psw_bg"><svg class="lnr lnr-lock"><use xlink:href="#lnr-lock"></use></svg></span>
            <input type="text" name="verify"  placeholder="请输入验证码" class="name verify-code"/>
        </div>
        <div class="login_captcha">
            <img src="{:captcha_src()}" alt="点击更换" title="点击更换" onclick="this.src='{:captcha_src()}?time='+Math.random()" class="captcha">
        </div>
        <div class="submit_btn">
            <input type="submit" class="reg_bto login_in register_in" lay-submit lay-filter="reg" value="注册账号" style="background-color: #007BB1" />
        </div>

    </form>

    <p class="text_register text_font">已有账号？<a href="{:url("/login/index")}">立即登录</a></p>

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

        //检测重复项
        function check_item(value,type) {
            $.post("{:url('/login/check')}", {type:type, value:value,}, function (info) {
                    if (info.code == -1) {
                        layer.msg(info.data + "," + info.msg);
                        return false;
                    }
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