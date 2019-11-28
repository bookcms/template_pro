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
        <div class="site-tree-mobile layui-hide"><i class="layui-icon"></i></div>
        <div class="site-mobile-shade"></div>
        <div class="fly-panel fly-panel-user" pad20="">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title" id="LAY_mine">
                    <li class="layui-this">我的资料</li>
                    <li><a href="{:url('/user/password')}">密码</a></li>
                </ul>
                <div class="layui-tab-content" style="padding: 20px 0;">
                    <div class="layui-form-pane layui-tab-item layui-show">
                        <form method="post" class="layui-form">
                            <div class="layui-form-item"><label class="layui-form-label">用户名</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="user_name" autocomplete="off" value="{$user_info.user_name}" class="layui-input" disabled="disabled" style="cursor: not-allowed !important;" />
                                </div>
                                <div class="layui-form-mid layui-word-aux">用户名不支持修改。</div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">电子邮箱</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="email" required="" lay-verify="email" autocomplete="off" value="{$user_info.email}" class="layui-input" />
                                </div>
<!--                                <div class="layui-form-mid layui-word-aux"> 您的邮箱尚未激活 &nbsp;&nbsp;<a href="/user/activate/" class="layui-btn layui-btn-sm layui-btn-normal" style="position: relative; top: -2px;">立即激活邮箱</a></div>-->
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">昵称</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="nick_name" required="" lay-verify="required" autocomplete="off" value="{$user_info.nick_name}" class="layui-input" />
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">性别</label>
                                <div class="layui-input-block">
                                    <input type="radio" name="sex" value="男" title="男">
                                    <input type="radio" name="sex" value="女" title="女" checked>
                                </div>
                            </div>
                            <div class="layui-form-item layui-form-text">
                                <label for="L_sign" class="layui-form-label">签名</label>
                                <div class="layui-input-block">
                                    <textarea placeholder="随便写些什么刷下存在感" id="L_sign" name="sign" autocomplete="off" class="layui-textarea" style="height: 80px;"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <button class="layui-btn" key="set-mine" lay-filter="*" lay-submit="">确认修改</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

{/block}
{block name="footer"}
{/block}