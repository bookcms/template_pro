{extend name="base_m_user" /}
{block name="body"}

    <!--header-->
    <div class="header user-head">
        <div class="site-logo"><a href="/"></a></div>
        <div class="member-login">{$user_info.user_name} | <a href="{:url('/login/logout')}">退出</a></div>
    </div>
    <!--header-->
    <div class="weui-cells memberhead usercp">
        <div class="weui-cell">
            <div class="weui-cell__hd" style="position: relative;margin-right: 10px;">
                <img src="__IMAGES__/noavatar_middle.gif	" style="width: 80px;display: block">
                <span class="weui-badge" style="position: absolute;top: -.4em;right: -.4em;">1</span>
            </div>
            <div class="weui-cell__bd">
                <p class="username">{$user_info.user_name} </p>
                <p style="font-size: 13px;color: #888888;"><a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_default">普通会员</a></p>
            </div>
            <!--a href="/e/DoInfo/AddInfo.php?enews=MAddInfo" class="weui-btn weui-btn_mini weui-btn_warn">上传小说</a-->
        </div>
    </div>

    <div class="weui-grids" style="border-bottom: 1px solid #d9d9d9;">
        <a href="{:url('/user/collect_list')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_like.png" alt="我的收藏"></div><p class="weui-grid__label">我的收藏</p>
        </a>
        <a href="{:url('/user/rack_list')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_novel.png" alt="我的书架"></div><p class="weui-grid__label">我的书架</p>
        </a>
        <a href="{:url('/info/about')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_center.png" alt="关于我们"></div><p class="weui-grid__label">关于我们</p>
        </a>
        <a href="{:url('/info/privacy')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_zone.png" alt="隐私条款"></div><p class="weui-grid__label">隐私条款</p>
        </a>
        <a href="{:url('/info/disdaimer')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_msg.png" alt="免责声明"></div><p class="weui-grid__label">免责声明</p>
        </a>
        <a href="{:url('/info/contact')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_comment.png" alt="联系我们"></div><p class="weui-grid__label">联系我们</p>
        </a>
        <a href="{:url('/user/password')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_password.png" alt="修改密码"></div><p class="weui-grid__label">修改密码</p>
        </a>
        <a href="#" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_bind.png" alt="账号绑定"></div><p class="weui-grid__label">账号绑定</p>
        </a>
        <a href="{:url('/login/logout')}" class="weui-grid">
            <div class="weui-grid__icon"><img src="__IMAGES__/wap_logout.png" alt="退出登录"></div><p class="weui-grid__label">退出登录</p>
        </a>
    </div>


{/block}
{block name="footer"}

{/block}