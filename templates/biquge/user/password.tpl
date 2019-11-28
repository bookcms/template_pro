{extend name="base" /}
{block name="header"}
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/user_pc.css">
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/iconfont/iconfont.css">
{/block}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("{:url('/user/index',array(),'html','m')}");</script>
{/block}
{block name="body"}

<div class="layui-container fly-marginTop fly-user-main">
        <ul class="layui-nav layui-nav-tree layui-inline">
            <li class="layui-nav-item layui-this"><a href="{:url('/user/index')}"> <i class="iconfont icon-geren2"></i> 基本信息 </a></li>
            <li class="layui-nav-item "><a href="{:url('/user/rack_list')}"> <i class="iconfont icon-shujia"></i> 我的书架 </a></li>
            <li class="layui-nav-item "><a href="{:url('/user/collect_list')}"> <i class="iconfont icon-shoucang1"></i> 我的收藏 </a></li>
            <li class="layui-nav-item "><a href="{:url('/user/messages')}"> <i class="iconfont icon-xiaoxi1"></i> 我的消息 </a></li>
            <span class="layui-nav-bar" style="height: 0px; top: 122.5px; opacity: 0;"></span>
        </ul>
        <div class="fly-panel fly-panel-user" pad20="">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li><a href="{:url('/user/index')}">我的资料</a></li>
                    <li class="layui-this">密码</li>
                </ul>
                <div class="layui-tab-content" style="padding: 20px 0;">
                    <form method="post" action="{:url('/user/password')}" class="layui-form">
                        <div class="layui-form-pane layui-tab-item layui-show">
                            <div class="layui-form-item">
                                <label class="layui-form-label">新密码</label>
                                <div class="layui-input-inline">
                                    <input type="password"  name="password" required="" lay-verify="required" autocomplete="off" class="layui-input password" />
                                </div>
                                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">确认密码</label>
                                <div class="layui-input-inline">
                                    <input type="password"  name="password2" required="" lay-verify="required" autocomplete="off" class="layui-input password2">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" lay-filter="*" lay-submit>确认修改</button>
                            </div>
                        </div>
                    </form>
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