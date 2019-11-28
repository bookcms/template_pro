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
            <li class="layui-nav-item"><a href="{:url('/user/index')}"> <i class="iconfont icon-geren2"></i> 基本信息 </a></li>
            <li class="layui-nav-item"><a href="{:url('/user/rack_list')}"> <i class="iconfont icon-shujia"></i> 我的书架 </a></li>
            <li class="layui-nav-item"><a href="{:url('/user/collect_list')}"> <i class="iconfont icon-shoucang1"></i> 我的收藏 </a></li>
            <li class="layui-nav-item layui-this"><a href="{:url('/user/messages')}"> <i class="iconfont icon-xiaoxi1"></i> 我的消息 </a></li>
            <span class="layui-nav-bar" style="height: 0px; top: 122.5px; opacity: 0;"></span>
        </ul>
        <div class="fly-panel fly-panel-user" pad20="">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li class="layui-this">我的消息</li>
                </ul>
                <div class="layui-tab-content" style="padding: 20px 0;">
                </div>
            </div>
        </div>
    </div>

{/block}
{block name="footer"}
<script>


</script>
{/block}