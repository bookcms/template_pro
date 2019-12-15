{extend name="base" /}
{block name="uaredirect"}
    <script type="text/javascript">uaredirect("");</script>
{/block}
{block name="body"}
<div class="main">
    <div class="layui-main">
        <div class="box">
            <div class="path">
                <a href="{$site_config.site_domain}">{$site_config.site_name}</a> &gt;<a href="{:url("/classify/all","","html",true)}"> 书库大全</a>
            </div>
        </div>
        <div class="box left w_260">
            <ul class="filter">
                <li>
                    <dl>
                        <dt>书籍分类：</dt>
                        {foreach $classify as $item}
                        <dd {eq name="$item.alias" value="$current_alias"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></dd>
                        {/foreach}
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>连载状态：</dt>
                        {foreach $classify_status as $item}
                        <dd {eq name="$item.status" value="$current_status"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></dd>
                        {/foreach}
                    </dl>
                </li>

                <li>
                    <dl>
                        <dt>更新时间：</dt>
                        {foreach $classify_update_times as $item}
                        <dd {eq name="$item.time" value="$current_update_time"}class="on"{/eq}><a href="{:url($item.path,"","html",true)}">{$item.name}</a></dd>
                        {/foreach}
                    </dl>
                </li>
            </ul>
        </div>
        <div class="box right w_840">
            <ul class="library">
                {foreach $list as $novel}
                <li>
                    <a class="bookimg" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}"><img src="{$novel.LocalImage | down_image}" alt="{$novel.Title}"></a>
                    <a class="bookname" href="{:url("/book/" . $novel['PrimaryId'],"","html",true)}">{$novel.Title}</a>
                    <span class="layui-badge {eq name="$novel.Full" value='0'}layui-bg-blue{/eq}">{eq name="$novel.Full" value='0'}连载中{else/}已完结{/eq}</span>
                    <p>作者：<a class="author" href="{:url('/author/' . urlencode($novel.Author))}">西贝猫</a><i>|</i>{$novel.Cid | show_cid_name}<i>|</i>{$novel.UpdateTime | date="Y-m-d"}</p>
                    <p class="intro">{$novel.Introduction}</p>
                    <a class="chapter" href="{:url("/chapter/" . $novel['PrimaryId'] . "/" . get_last_offset_sort($novel.LastChapterSort,$novel['SourceList'],$novel['LastChapterFlag']),"","html",true)}">{$novel.LastChapterTitle}</a>
                </li>
                {/foreach}
            </ul>
            <div class="clear"></div>
            <?php echo $pages;?>
        </div>
    </div>
</div>
{/block}