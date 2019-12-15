{extend name="base_m_user" /}
{block name="body"}
    <!--header-->
    <div class="header user-head">
        <div class="site-logo"><a href="/"></a></div>
        <div class="member-login"><a class="islogin" href="{:url('/login/index')}">登录</a></div>
    </div>
    <!--header-->
    <!--main-block-->
    <div class="main-block">
        <div class="weui-cells__title" style="text-align: center">用户注册</div>
        <form method=post  action='{:url("/login/reg")}' class="layui-form">
            <div class="userlogin">
                <div class="weui-cell ">
                    <div class="weui-cell__hd"><label class="weui-label">用户名</label></div>
                    <div class="weui-cell__bd username">
                        <input type="text" name="username" class="weui-input" placeholder="账号名，7~12位字符">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">电子邮箱</label></div>
                    <div class="weui-cell__bd email">
                        <input type="text" name="email" class="weui-input" placeholder="请输入电子邮箱">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">密 &nbsp; 码</label></div>
                    <div class="weui-cell__bd password">
                        <input type="password" name="password" class="weui-input" placeholder="请输入登陆密码">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">重复密码</label></div>
                    <div class="weui-cell__bd password2">
                        <input type="password" class="weui-input" name="password2" placeholder="请重复输入登陆密码">
                    </div>
                </div>
                <div class="weui-cell">
                    <div class="weui-cell__hd"><label class="weui-label">验证码</label></div>
                    <div class="weui-cell__bd">
                        <input type="text" class="weui-input" name="verify" placeholder="请输入验证码">
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
            <label  class="weui-agree">
                <input type="checkbox" id="remember" name="remember" value="1" checked="checked" class="weui-agree__checkbox">
                <span class="weui-agree__text">我已阅读并同意《<a href="{:url('/info/agreement')}" target="_blank">用户服务协议</a>》</span>
                <span class="to-signup">
                    <a class="islogin" href="{:url('/login/index')}">返回登录</a>
                </span>
            </label>
            <div class="weui-btn-area">
                <button class="weui-btn weui-btn_warn" lay-submit lay-filter="reg" type="submit" >注 册</button>
            </div>
        </form>
    </div>
{/block}
{block name="footer"}
<script type="text/javascript" src="__JS__/svg.js"></script>
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
                        layer.msg(info.msg);
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