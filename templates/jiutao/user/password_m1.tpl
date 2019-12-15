{extend name="base_m_no_nav" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__STATIC__/css/user_m.css">
{/block}
{block name="body"}

<form action="{:url('/user/password')}" class="layui-form" method="post">
    <div class="edit editpwd">
        <p>新密码：<input type="password" class="password" name="password" placeholder="请输入新密码"/>
        </p>
        <p>重复新密码：<input type="password" class="password2" name="password2" placeholder="再次输入新密码"/></p>
        <p>
            <button style="width: 100%" class="btn submit" lay-filter="*" lay-submit>确定提交</button>
        </p>
    </div>

</form>

{/block}
{block name="footer"}
<script>
    layui.use(['layer','jquery','form'],function () {
        var layer = layui.layer
            ,$ = layui.jquery
            ,form = layui.form;

        form.on('submit(*)', function (data) {

            var password = $('.password');
            var password2 = $('.password2');

            if (password.val().length < 6 || password2.val().length < 6) {
                layer.msg("密码长度请大于6位!");
                return false;
            }

            if (password.val() != password2.val()) {
                layer.msg("两次密码不一致!");
                return false;
            }

            $.post({
                url: data.form.action,
                data: $(data.form).serialize(),
                success: function (info) {
                    if (info.code == 0) {
                        setTimeout(function () {
                            location.href = info.data;
                        }, 1000);
                    }
                    layer.msg(info.msg);
                }
            });

            return false;
        });

    });

</script>
{/block}