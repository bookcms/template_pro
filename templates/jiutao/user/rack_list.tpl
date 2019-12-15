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
            <li class="layui-nav-item layui-this"><a href="{:url('/user/rack_list')}"> <i class="iconfont icon-shujia"></i> 我的书架 </a></li>
            <li class="layui-nav-item "><a href="{:url('/user/collect_list')}"> <i class="iconfont icon-shoucang1"></i> 我的收藏 </a></li>
            <li class="layui-nav-item "><a href="{:url('/user/messages')}"> <i class="iconfont icon-xiaoxi1"></i> 我的消息 </a></li>
            <span class="layui-nav-bar" style="height: 0px; top: 122.5px; opacity: 0;"></span>
        </ul>
        <div class="fly-panel fly-panel-user" pad20="">
            <div class="layui-tab layui-tab-brief">
                <ul class="layui-tab-title">
                    <li class="layui-this">我的书架</li>
                </ul>
                <div class="layui-tab-content" style="padding:0;">
                    <table class="layui-hide layui-table" id="table-list" lay-filter="table-filter"></table>

                    <script type="text/html" id="titleTpl">
                        <a target="_blank" href="{{d.url}}" class="last_chapter">{{d.title}}</a>
                    </script>

                    <script type="text/html" id="readChapterTpl">
                        <a target="_blank" href="{{d.read_chapter_url}}" class="last_chapter">{{d.read_chapter_title}}</a>
                    </script>

                    <script type="text/html" id="lastChapterTpl">
                        <a target="_blank" href="{{d.last_chapter_url}}" class="last_chapter">{{d.last_chapter_title}}</a>
                    </script>

                    <script type="text/html" id="bar">
                        <a lay-event="delete" class="layui-btn layui-btn-danger layui-btn-sm">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>

{/block}
{block name="footer"}
<script src="__STATIC__/layui/layui.js" type="text/javascript"></script>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#table-list'
            ,url: '{:url("/user/rack_list")}'
            ,method: 'post'
            ,parseData: function(info){
                return {
                    "code": info.code,
                    "msg":  info.msg,
                    "count":  info.data.total,
                    "data":  info.data.list
                };
            }
            ,cols: [[ //表头
                 {field: 'id', title: '小说ID', width:130,sort:true,align:'center', fixed: 'left'}
                ,{field: 'title', title: '小说名称',align:'center',templet: '#titleTpl'}
                ,{field: 'read_chapter_title', title: '阅读至',templet: '#readChapterTpl'}
                ,{field: 'last_chapter_title', title: '最新章节',templet: '#lastChapterTpl'}
                ,{fixed: 'right',title:"操作", width:80, align:'center', toolbar: '#bar', unresize: true}
            ]]
            ,id: 'listReload'
            ,height: 520
            ,page: true //开启分页
            ,loading: true //加载进度条
        });

        //监听工具条
        table.on('tool(table-filter)', function(obj){
            var data = obj.data;

            if(obj.event === 'delete'){
                layer.confirm('是否删除【'+data.title+'】？', function(index){
                    var jsData = {'book_id':data.id,"act_type":"rack"};
                    $.post('{:url("/user/delete_book")}', jsData, function (info) {
                        if (info.code == 0) {
                            setTimeout(function () {
                                table.reload('listReload');
                            },1000)
                        }

                        layer.msg(info.msg)
                    }, "json");

                    layer.close(index);
                })
            }

        });

    });
</script>
{/block}