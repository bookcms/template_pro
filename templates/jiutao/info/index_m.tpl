{extend name="base_m_no_nav" /}
{block name="nav"}
    {include file="nav_m_no_menu" /}
{/block}
{block name="body"}
<div class="novel">
    <div class="helpdetail">
        <p class="helpdetail-content">
            {ad alias='$type'/}
        </p>
    </div>
</div>
{/block}