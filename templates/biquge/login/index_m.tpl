{extend name="base_m_no_nav" /}
{block name="header"}
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/login_m.css">
{/block}
{block name="body"}
<div class="login_box">
    <form name="form_login" action="{:url('/login/index')}" method="post"  class="layui-form">
        <div class="login_name username">
            <span class="person_bg"><svg class="lnr lnr-user"><use xlink:href="#lnr-user"></use></svg></span>
            <input type="text" class="name login_nm" name="username" value="" placeholder="请输入用户名">
        </div>
        <div class="login_name password">
            <span class="psw_bg"><svg class="lnr lnr-lock"><use xlink:href="#lnr-lock"></use></svg></span>
            <input type="password" class="name login_psw" name="password" value="" placeholder="请输入密码">
        </div>
        <div class="login_name verify">
            <span class="psw_bg"><svg class="lnr lnr-lock"><use xlink:href="#lnr-lock"></use></svg></span>
            <input type="text" name="verify"  placeholder="请输入验证码" class="name verify-code"/>
        </div>
        <div class="login_captcha">
            <img src="{:captcha_src()}" alt="点击更换" title="点击更换" onclick="this.src='{:captcha_src()}?time='+Math.random()" class="captcha">
        </div>
        <div class="submit_btn">
            <label style="display: block; padding-bottom: 5px; padding-top: 5px;"><input type="checkbox" name="login_hold" value="1" checked="checked">30天内免登录</label>
            <input type="button" class="login_bto login_in" lay-submit lay-filter="login" style="background-color: #007BB1" value="登录"/>
        </div>
    </form>
    <p class="text_login">
        <a href="{:url('/login/reg')}" class="login_in" >免费注册</a>
    </p>

    <div class="tip_box">
        <h2>温馨提示：</h2>
        <p>
            1、登录成功后，可使用永久书架，保存的书永不丢失；<br/>
            2、手机站与PC站共用一个帐号，可实现书架同步。
        </p>
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