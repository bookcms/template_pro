{extend name="base_m_no_nav" /}
{block name="header"}
<link rel="stylesheet" type="text/css" href="__STATIC__/css/user_m.css">
{/block}
{block name="body"}

<div class="edit">
    <p class="info">
        用户名：<em>{$user_info.user_name}</em><br/>
        电子邮箱：<em>{$user_info.email}</em>
    </p>

    <p class="opt"><a href="{:url('/user/rack_list')}" class="btn">我的书架</a></p>
    <p class="opt"><a href="{:url('/user/collect_list')}" class="btn">我的收藏</a></p>
    <p class="opt"><a href="{:url('/user/password')}" class="btn">修改密码</a></p>
    <p class="opt"><a href="{:url('/login/logout')}" class="btn">退出登录</a></p>
</div>

{/block}
{block name="footer"}

{/block}