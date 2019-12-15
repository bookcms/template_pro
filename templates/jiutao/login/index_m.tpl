{extend name="base_m_user" /}
{block name="body"}

    <!--header-->
    <div class="header user-head">
        <div class="site-logo"><a href="/"></a></div>
    </div>
    <!--header-->
    <!--main-block-->
    <div class="main-block">
        <form method="post" action="{:url('/login/index')}" class="layui-form">
            <div class="weui-cells__title" style="text-align: center">用户登录</div>
            <div class="userlogin">
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
                    <div class="weui-cell__bd">
                        <input type="text" name="username" class="weui-input" placeholder="请输入登陆用户名" />
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">密 &nbsp; 码</label></div>
                    <div class="weui-cell__bd password">
                        <input type="password" name="password" class="weui-input" placeholder="请输入登陆密码" />
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">验证码</label></div>
                    <div class="weui-cell__bd">
                        <input type="text" name="verify" class="weui-input" placeholder="请输入验证码" />
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__bd">
                        <div class="login_captcha">
                            <img src="{:captcha_src()}" alt="点击更换" title="点击更换" onclick="this.src='{:captcha_src()}?time='+Math.random()" class="captcha">
                        </div>
                    </div>
                </div>
            </div>
            <label class="weui-agree">
                <span class="weui-agree__text"></span>
                <span class="to-signup"><a href="{:url('/login/reg')}">注册账号</a></span>
            </label>
            <div class="weui-btn-area">
                <button type="submit" lay-submit lay-filter="login" class="weui-btn weui-btn_warn" >登 录</button>
            </div>
        </form>
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

