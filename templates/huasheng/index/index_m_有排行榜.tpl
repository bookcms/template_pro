{extend name="base_m" /}
{block name="header"}
    <link rel="stylesheet" href="__JS__/layui/css/layui.css" media="all">
{/block}
{block name="body"}
<!--header-->
<div class="header">
    <h1 class="logo">花生小说</h1>
    <span class="icon-grouop"><span class="icon-bookshelf"></span></span>
</div>
<!--wrap-->
<div class="wrap">
    <!--slide-->
    <div class="swiper-container">
        <div class="layui-carousel swiper-wrapper" id="swiper">
            <div carousel-item class="swiper-slide">
                {foreach $site_config.slide_list as $item }
                <a target="{$item.target}" {eq name="$item.url" value=""}href="javascript:void(0)"{else/}href="{$item.url}"{/eq}><img src="{$item.image | down_image}" alt="{$item.name}" /><span>{$item.name}</span></a>
                {/foreach}
            </div>
        </div>
    </div>
    <!-- search -->
    <div class="bar">
        <form method="get" name="search" action="{:url("/search","","",true)}">
            <input type="text" name="k" id="q" placeholder="请输入书名/作者" class="search-key">
            <button type="submit" class="search-btn" id="search-btn">Go</button>
        </form>
    </div>

    <!-- nav -->
    <div class="nav">
        <!--<a href="{:url("/top","","html",true)}"><img class="nav-img" src="__IMAGES__/nav-top.png" alt="排行榜"/><span>排行榜</span></a>-->
        <a href="#"><img class="nav-img" src="__IMAGES__/nav-top.png" alt="排行榜"/><span>排行榜</span></a>
        <a href="{:url("/tags","","html",true)}"><img class="nav-img" src="__IMAGES__/nav-tags.png" alt="标签"/><span>标签</span></a>
        <a href="{:url("/news","","html",true)}"><img class="nav-img" src="__IMAGES__/nav-news.png" alt="资讯"/><span>资讯</span></a>
        <a href="{:url("/classify","","html",true)}"><img class="nav-img" src="__IMAGES__/nav-book.png" alt="小说库"/><span>小说库</span></a>
    </div>

    <!-- rec-book -->
    <div class="mod rec-book">
        <div class="mod-head">
            <h3>编辑推荐</h3>
        </div>
        <div class="book-slide">
            <ul class="clearfix">
                <li>
                    <a href="/book/13536.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181230/32-1Q2301022450-L.jpg" alt="欢妻"/>
                        <span>欢妻</span>
                        <em><aria>作者：</aria>李鹏举</em>
                    </a>
                </li>
                <li>
                    <a href="/book/13314.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181225/35-1Q225111A70-L.jpg" alt="杀破狼"/>
                        <span>杀破狼</span>
                        <em><aria>作者：</aria>老给</em>
                    </a>
                </li>
                <li>
                    <a href="/book/13364.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181226/35-1Q2261021120-L.jpg" alt="沙发迷情"/>
                        <span>沙发迷情</span>
                        <em><aria>作者：</aria>果酱酱</em>
                    </a>
                </li>
                <li>
                    <a href="/book/13407.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181227/35-1Q22F930130-L.jpg" alt="武大郎"/>
                        <span>武大郎</span>
                        <em><aria>作者：</aria>梅八爷</em>
                    </a>
                </li>
                <li>
                    <a href="/book/13055.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181219/39-1Q2191332060-L.jpg" alt="秘密花园小城"/>
                        <span>秘密花园小城</span>
                        <em><aria>作者：</aria>小苹果</em>
                    </a>
                </li>
                <li>
                    <a href="/book/13238.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181222/39-1Q2221624120-L.jpg" alt="愿得君心笑离殇"/>
                        <span>愿得君心笑离殇</span>
                        <em><aria>作者：</aria>苏小爱</em>
                    </a>
                </li>
                <li>
                    <a href="/book/12965.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181217/39-1Q21G410310-L.jpg" alt="芷为轩生"/>
                        <span>芷为轩生</span>
                        <em><aria>作者：</aria>楠歌</em>
                    </a>
                </li>
                <li>
                    <a href="/book/13170.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181221/39-1Q221113A00-L.jpg" alt="一世逍遥"/>
                        <span>一世逍遥</span>
                        <em><aria>作者：</aria>冰城小南</em>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /rec-book -->
    <!-- hot-book -->
    <div class="mod hot-book">
        <div class="mod-head">
            <h3>热门小说</h3>
        </div>
        <div class="book-slide">
            <ul class="clearfix">
                <li>
                    <a href="/book/2644.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180621/30-1P621110G30-L.jpg" alt="首长爹地放肆宠"/>
                        <span>首长爹地放肆宠</span>
                        <em><aria>作者：</aria>心心</em>
                    </a>
                </li>
                <li>
                    <a href="/book/12491.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181206/38-1Q206141Q30-L.jpg" alt="我与空姐的荒岛求生记"/>
                        <span>我与空姐的荒岛求生记</span>
                        <em><aria>作者：</aria>没穿秋裤</em>
                    </a>
                </li>
                <li>
                    <a href="/book/5183.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180804/36-1PP41136150-L.jpg" alt="重生之都市修仙"/>
                        <span>重生之都市修仙</span>
                        <em><aria>作者：</aria>洛书</em>
                    </a>
                </li>
                <li>
                    <a href="/book/260.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180109/22-1P109111Z20-L.jpg" alt="桃色小乡村"/>
                        <span>桃色小乡村</span>
                        <em><aria>作者：</aria>一条小墨鱼</em>
                    </a>
                </li>
                <li>
                    <a href="/book/7420.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180908/31-1PZQ136050-L.jpg" alt="公媳诱惑"/>
                        <span>公媳诱惑</span>
                        <em><aria>作者：</aria>银雪</em>
                    </a>
                </li>
                <li>
                    <a href="/book/2493.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180612/34-1P6121F6070-L.jpg" alt="你是夏日繁花"/>
                        <span>你是夏日繁花</span>
                        <em><aria>作者：</aria>斯歌</em>
                    </a>
                </li>
                <li>
                    <a href="/book/5534.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180810/36-1PQ01132430-L.jpg" alt="荒岛上的故事"/>
                        <span>荒岛上的故事</span>
                        <em><aria>作者：</aria>没穿秋裤</em>
                    </a>
                </li>
                <li>
                    <a href="/book/7024.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180903/35-1PZ31101530-L.jpg" alt="浮华逝梦"/>
                        <span>浮华逝梦</span>
                        <em><aria>作者：</aria>红尘烟雨</em>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /hot-book -->
    <!-- new-topic -->
    <div class="mod new-topic">
        <div class="mod-head">
            <h3>最新标签</h3>
            <a href="/tags/">更多</a>
        </div>
        <div class="tags-list">
            <ul class="clearfix">
                <li>
                    <a href="/tags/31.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/171207/1-1G20F942150-L.jpg" alt="架空小说"/>
                        <span>架空小说</span>
                    </a>
                </li>
                <li>
                    <a href="/tags/77.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/171228/22-1G22Q335070-L.jpg" alt="古言小说"/>
                        <span>古言小说</span>
                    </a>
                </li>
                <li>
                    <a href="/tags/3.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/180427/30-1P42G459260-L.jpg" alt="现情小说"/>
                        <span>现情小说</span>
                    </a>
                </li>
                <li>
                    <a href="/tags/86.html">
                        <img class="lazy" src="http://img.p.com/uploads/allimg/181011/1-1Q0111040020-L.jpg" alt="辣文合集"/>
                        <span>辣文合集</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- /new-topic -->
    <!-- new-book -->
    <div class="mod new-book">
        <div class="mod-head">
            <h3>最新小说</h3>
            <a href="/book/">更多</a>
        </div>
        <div class="book-list">
            <ul class="clearfix">
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190211/39-1Z211103P00-L.jpg" alt="庶女惊华帝后无双"/>
                    <a class="tit" href="/book/14825.html">庶女惊华帝后无双</a>
                    <p class="intro">就算你不承认，但是我知道，就是你！有些人，只需要一眼，就能确认心意。</p>
                    <p class="info"><span><aria>作者：</aria>终离弃</span><em class="type">古言</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190210/38-1Z2101J9490-L.jpg" alt="首席体验官"/>
                    <a class="tit" href="/book/14824.html">首席体验官</a>
                    <p class="intro">陶勇这份工作让他变得愈发的受女人的喜爱。</p>
                    <p class="info"><span><aria>作者：</aria>小幸福</span><em class="type">现情</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190210/38-1Z2101I1470-L.jpg" alt="8889"/>
                    <a class="tit" href="/book/14823.html">8889</a>
                    <p class="intro">只有放手去寻找自己的幸福，才不会一直忍气吞声的委屈下去......</p>
                    <p class="info"><span><aria>作者：</aria>鼓楼</span><em class="type">都市</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190210/39-1Z2101105480-L.jpg" alt="野性诱惑"/>
                    <a class="tit" href="/book/14822.html">野性诱惑</a>
                    <p class="intro">“李城兄弟，鞋鞋鞋带系好了。”李城脑子一热，脱口而出：“我能摸你一下吗？”</p>
                    <p class="info"><span><aria>作者：</aria>青木大人</span><em class="type">都市</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190210/39-1Z2101031150-L.jpg" alt="错爱"/>
                    <a class="tit" href="/book/14821.html">错爱</a>
                    <p class="intro">李洁开了一点点的缝，湿漉漉的手伸了出来，但因为离得近，她的身体又贴着玻璃，所以看得更清楚了：“谢谢爸。”</p>
                    <p class="info"><span><aria>作者：</aria>鸾伦</span><em class="type">都市</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190210/39-1Z2101002190-L.jpg" alt="春野乡情"/>
                    <a class="tit" href="/book/14820.html">春野乡情</a>
                    <p class="intro">张巧花扭头望着林东，觉着这小子还有几分帅气，人也结实，春心便有些动漾。有些陶醉的样子望着林东，逗笑说：“想不想看安逸的？”</p>
                    <p class="info"><span><aria>作者：</aria>乡村老江</span><em class="type">都市</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190209/38-1Z209100Z60-L.jpg" alt="谁许谁一世深情"/>
                    <a class="tit" href="/book/14819.html">谁许谁一世深情</a>
                    <p class="intro">爱可以一见钟情，也可以慢慢培养，日久生情。</p>
                    <p class="info"><span><aria>作者：</aria>桔烁</span><em class="type">都市</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190209/38-1Z20Z956330-L.jpg" alt="6668"/>
                    <a class="tit" href="/book/14818.html">6668</a>
                    <p class="intro">上天开的玩笑，总是让人在喜怒，生死之间不断徘徊......</p>
                    <p class="info"><span><aria>作者：</aria>朱古力</span><em class="type">都市</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190208/38-1Z20Q011550-L.jpg" alt="天下第一女衙役"/>
                    <a class="tit" href="/book/14817.html">天下第一女衙役</a>
                    <p class="intro">穿越到书中，成为了书中的人物，修罗会发生什么有意思的故事，值得期待。</p>
                    <p class="info"><span><aria>作者：</aria>孟家女郎</span><em class="type">古言</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190207/38-1Z20GJ6140-L.jpg" alt="腹黑总裁谋婚记"/>
                    <a class="tit" href="/book/14816.html">腹黑总裁谋婚记</a>
                    <p class="intro">原来只是想打个酱油，没想到成了主角。</p>
                    <p class="info"><span><aria>作者：</aria>尚亦儿</span><em class="type">都市</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190207/40-1Z20G25I60-L.jpg" alt="重征影途之绯闻人生"/>
                    <a class="tit" href="/book/14815.html">重征影途之绯闻人生</a>
                    <p class="intro">丢过命才会发现谁才是那个对自己好的人</p>
                    <p class="info"><span><aria>作者：</aria>胖猫儿</span><em class="type">重生</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190207/40-1Z20G239590-L.jpeg" alt="一方星"/>
                    <a class="tit" href="/book/14814.html">一方星</a>
                    <p class="intro">两个女生之间的感情也是那么动人</p>
                    <p class="info"><span><aria>作者：</aria>洛卿玉</span><em class="type">现情</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190206/38-1Z2061625370-L.jpg" alt="9326"/>
                    <a class="tit" href="/book/14813.html">9326</a>
                    <p class="intro">故事的最后总是让人意想不到，却又在情理之中。</p>
                    <p class="info"><span><aria>作者：</aria>万贵妃</span><em class="type">古言</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190206/38-1Z206160A60-L.jpg" alt="9331"/>
                    <a class="tit" href="/book/14812.html">9331</a>
                    <p class="intro">你给的爱连同悲伤都一并给我，这样未免太过于残忍。</p>
                    <p class="info"><span><aria>作者：</aria>万贵妃</span><em class="type">都市</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190206/40-1Z2060953500-L.jpg" alt="沈先生，我没那么喜欢你"/>
                    <a class="tit" href="/book/14811.html">沈先生，我没那么喜欢你</a>
                    <p class="intro">为什么会有这样的亲妈</p>
                    <p class="info"><span><aria>作者：</aria>路垚知码力</span><em class="type">都市</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190206/40-1Z2060933450-L.jpg" alt="妃你不撩：太子殿下深藏不露"/>
                    <a class="tit" href="/book/14810.html">妃你不撩：太子殿下深藏不露</a>
                    <p class="intro">所以说，不爱干嘛给她希望</p>
                    <p class="info"><span><aria>作者：</aria>凉小小</span><em class="type">古言</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190205/38-1Z2051ZK90-L.jpg" alt="妹纸你好坏"/>
                    <a class="tit" href="/book/14809.html">妹纸你好坏</a>
                    <p class="intro">只要有了把柄，就是希望的源泉。</p>
                    <p class="info"><span><aria>作者：</aria>银笔书生</span><em class="type">现情</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190205/38-1Z2051Z2030-L.jpg" alt="时光与你共眠"/>
                    <a class="tit" href="/book/14807.html">时光与你共眠</a>
                    <p class="intro">十三年的时光是一个女人最美好的青春，夏洛汐她无怨无悔的给了慕言希，爱情的力量真是伟大。</p>
                    <p class="info"><span><aria>作者：</aria>夏鱼</span><em class="type">都市</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190205/40-1Z2051ST20-L.jpg" alt="鼠仙"/>
                    <a class="tit" href="/book/14808.html">鼠仙</a>
                    <p class="intro">奇幻人生，女主男主的姻缘也很奇妙</p>
                    <p class="info"><span><aria>作者：</aria>从那天开始再也没见过他了</span><em class="type">玄幻</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190205/40-1Z2051G9240-L.jpg" alt="给鬼王生了儿子以后"/>
                    <a class="tit" href="/book/14806.html">给鬼王生了儿子以后</a>
                    <p class="intro">温柔阴郁的吸血鬼王，小编觉得好刺激</p>
                    <p class="info"><span><aria>作者：</aria>穿靴子的猫</span><em class="type">耽美</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190204/38-1Z2041209230-L.jpg" alt="业主的诱惑"/>
                    <a class="tit" href="/book/14805.html">业主的诱惑</a>
                    <p class="intro">老罗是一个本事很强的男人，征服冯若曦是势在必得。</p>
                    <p class="info"><span><aria>作者：</aria>小六子</span><em class="type">现情</em><em class="serial">连载中</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190204/38-1Z2041149480-L.jpg" alt="9202"/>
                    <a class="tit" href="/book/14804.html">9202</a>
                    <p class="intro">爱了那么多年，却换来那么多年的仇恨。</p>
                    <p class="info"><span><aria>作者：</aria>夏西</span><em class="type">都市</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190204/39-1Z2040924110-L.jpg" alt="日久生情花开夏"/>
                    <a class="tit" href="/book/14802.html">日久生情花开夏</a>
                    <p class="intro">谁能告诉她，这场无爱的婚姻，为何慢慢让她泥足深陷，情难自禁，最后变成了她仅有的出路？</p>
                    <p class="info"><span><aria>作者：</aria>鄀宁宁</span><em class="type">都市</em><em class="finish">已完结</em></p>
                </li>
                <li>
                    <img class="pic lazy" src="http://img.p.com/uploads/allimg/190204/-1Z2040U4540-L.jpg" alt="两情若是久长时"/>
                    <a class="tit" href="/book/14801.html">两情若是久长时</a>
                    <p class="intro"> 这两个字从孟铁城的嘴里说出来，桑柠的心还是狠狠的被揪了一把。

                        　 这世上，怕是只有孟铁城对她的侮辱能伤害到她。</p>
                    <p class="info"><span><aria>作者：</aria>六零</span><em class="type">短篇</em><em class="finish">已完结</em></p>
                </li>
            </ul>
        </div>
    </div>
    <!-- /new-book -->
    <!-- new-news -->
    <div class="mod new-news">
        <div class="mod-head">
            <h3>最新资讯</h3>
            <a href="/news/">更多</a>
        </div>
        <div class="news-list">
            <ul class="clearfix">
                <li><a href="/news/104588.html">庶女惊华帝后无双司马梵终离落小说第20章节完整阅读</a><span>02-11</span></li>
                <li><a href="/news/104587.html">主角是司马梵终离落的小说by终离弃《庶女惊华帝后无双》小说在线阅读</a><span>02-11</span></li>
                <li><a href="/news/104586.html">庶女惊华帝后无双司马梵终离落小说在哪看-《庶女惊华帝后无双》小说在线阅读</a><span>02-11</span></li>
                <li><a href="/news/104585.html">庶女惊华帝后无双司马梵终离落小说在线阅读</a><span>02-11</span></li>
                <li><a href="/news/104584.html">《庶女惊华帝后无双》（司马梵终离落）小说阅读by终离弃</a><span>02-11</span></li>
                <li><a href="/news/104583.html">作者终离弃的小说-庶女惊华帝后无双司马梵终离落小说在线阅读</a><span>02-11</span></li>
                <li><a href="/news/104582.html">首席体验官陶勇珺珺崔亚楠小说第十六章节完整阅读</a><span>02-10</span></li>
                <li><a href="/news/104581.html">主角是陶勇珺珺崔亚楠的小说by小幸福《首席体验官》小说在线阅读</a><span>02-10</span></li>
                <li><a href="/news/104580.html">首席体验官陶勇珺珺崔亚楠小说在哪看-《首席体验官》小说在线阅读</a><span>02-10</span></li>
                <li><a href="/news/104579.html">首席体验官陶勇珺珺崔亚楠小说在线阅读</a><span>02-10</span></li>
            </ul>
        </div>
    </div>
    <!-- /new-news -->
    <!-- rank -->
    <div class="mod new-news">
        <div class="mod-head">
            <h3>小说排行榜</h3>
            <a href="/top/">更多</a>
        </div>
        <mip-vd-tabs>
            <!-- <div class="mod-tabs"> -->
            <ol class="clearfix">
                <li class="on">推荐榜</li>
                <li>人气榜</li>
                <li>女生榜</li>
                <li>男生榜</li>
            </ol>
            <!-- </div> -->
            <!--tab1-->
            <div class="mod-body">
                <div class="top-list">
                    <ul class="clearfix">
                        <li class="s1">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181230/32-1Q2301022450-L.jpg" alt="欢妻"/>
                            <a class="tit" href="/book/13536.html">欢妻</a>
                            <p class="intro">我看着她发过来的消息抬头看了她一眼，发现她正楚楚可怜的看着我。</p>
                            <p class="info"><span><aria>作者：</aria>李鹏举</span><em class="type">都市</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP1</em></i>
                        </li>
                        <li class="s2">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181225/35-1Q225111A70-L.jpg" alt="杀破狼"/>
                            <a class="tit" href="/book/13314.html">杀破狼</a>
                            <p class="intro">出狱后，杜老三也开始老老实实的干起了黑车生意，没想到却意外遇见了夏薇这个纠缠的女人。</p>
                            <p class="info"><span><aria>作者：</aria>老给</span><em class="type">都市</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP2</em></i>
                        </li>
                        <li class="s3">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181226/35-1Q2261021120-L.jpg" alt="沙发迷情"/>
                            <a class="tit" href="/book/13364.html">沙发迷情</a>
                            <p class="intro">她牵过张良的手，又一次引着他伸进了自己的衣服内，张良没有抗拒，罗源，一时间张良被撩地轻声惊呼了起来。</p>
                            <p class="info"><span><aria>作者：</aria>果酱酱</span><em class="type">都市</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP3</em></i>
                        </li>
                        <li class="s4">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181227/35-1Q22F930130-L.jpg" alt="武大郎"/>
                            <a class="tit" href="/book/13407.html">武大郎</a>
                            <p class="intro">武大是武大郎，镶金莲叶无穷碧，落水西门不做官。</p>
                            <p class="info"><span><aria>作者：</aria>梅八爷</span><em class="type">都市</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP4</em></i>
                        </li>
                        <li class="s5">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181219/39-1Q2191332060-L.jpg" alt="秘密花园小城"/>
                            <a class="tit" href="/book/13055.html">秘密花园小城</a>
                            <p class="intro">一场繁华梦，乱了他们的身躯，是因为心动还是情动？</p>
                            <p class="info"><span><aria>作者：</aria>小苹果</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP5</em></i>
                        </li>
                        <li class="s6">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181222/39-1Q2221624120-L.jpg" alt="愿得君心笑离殇"/>
                            <a class="tit" href="/book/13238.html">愿得君心笑离殇</a>
                            <p class="intro">山高月浅慕凌云，愿得君心笑离殇。 云浅月眼眸怔怔，眼底掠过痛意，后悔……该是后悔的吧。</p>
                            <p class="info"><span><aria>作者：</aria>苏小爱</span><em class="type">古言</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP6</em></i>
                        </li>
                        <li class="s7">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181217/39-1Q21G410310-L.jpg" alt="芷为轩生"/>
                            <a class="tit" href="/book/12965.html">芷为轩生</a>
                            <p class="intro">顾芷涵用手用力的煽了煽绯红滚烫的脸颊，可怎么也褪不去。平复了下情绪，才缓缓把卧室门打开。</p>
                            <p class="info"><span><aria>作者：</aria>楠歌</span><em class="type">现情</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP7</em></i>
                        </li>
                        <li class="s8">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181221/39-1Q221113A00-L.jpg" alt="一世逍遥"/>
                            <a class="tit" href="/book/13170.html">一世逍遥</a>
                            <p class="intro">“王叔，再用点力！”

                                　　更重要的是，随着我的动作，赵雅欣脸上的表情从一开始的痛苦慢慢变成一种愉悦的红晕，喘息的口中竟发出了一声催促，听的我心头一跳。</p>
                            <p class="info"><span><aria>作者：</aria>冰城小南</span><em class="type">都市</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP8</em></i>
                        </li>
                        <li class="s9">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181030/38-1Q0301351530-L.jpg" alt="奈何流光渡"/>
                            <a class="tit" href="/book/10604.html">奈何流光渡</a>
                            <p class="intro">小说的女主是一个悲情角色，男主其实也是一样。女主的悲情在于自己最爱的人不爱自己，在男主怀里的是别的女人，而自己要受到两个人的无情伤害，还危及到了自己的亲人。男主悲在自己是一个被欺骗，被隐瞒还在当一个自以为是好人的角色，实际上是愚昧，以致于后来知道真相的男主追悔莫及，却发现自己已经什么都没有了.....</p>
                            <p class="info"><span><aria>作者：</aria>秋无痕</span><em class="type">都市</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP9</em></i>
                        </li>
                        <li class="s10">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181206/38-1Q206141Q30-L.jpg" alt="我与空姐的荒岛求生记"/>
                            <a class="tit" href="/book/12491.html">我与空姐的荒岛求生记</a>
                            <p class="intro">荒岛求生！！！只要与美女相伴，张飞一辈子都想生活在岛上，与世隔绝，享受着天伦之乐.....</p>
                            <p class="info"><span><aria>作者：</aria>没穿秋裤</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP10</em></i>
                        </li>
                    </ul>
                </div>
            </div>
            <!--tab2-->
            <div class="mod-body">
                <div class="top-list">
                    <ul class="clearfix">
                        <li class="s1">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180621/30-1P621110G30-L.jpg" alt="首长爹地放肆宠"/>
                            <a class="tit" href="/book/2644.html">首长爹地放肆宠</a>
                            <p class="intro">*为了维护该小说的合法权益以及更好的阅读体验，请大家点击右侧提示中打开本页面
                                《首长爹地放肆宠》又名《弃妻真难追》，是心心写的一部经典都市言情小说。</p>
                            <p class="info"><span><aria>作者：</aria>心心</span><em class="type">现情</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP1</em></i>
                        </li>
                        <li class="s2">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181206/38-1Q206141Q30-L.jpg" alt="我与空姐的荒岛求生记"/>
                            <a class="tit" href="/book/12491.html">我与空姐的荒岛求生记</a>
                            <p class="intro">荒岛求生！！！只要与美女相伴，张飞一辈子都想生活在岛上，与世隔绝，享受着天伦之乐.....</p>
                            <p class="info"><span><aria>作者：</aria>没穿秋裤</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP2</em></i>
                        </li>
                        <li class="s3">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180804/36-1PP41136150-L.jpg" alt="重生之都市修仙"/>
                            <a class="tit" href="/book/5183.html">重生之都市修仙</a>
                            <p class="intro">《重生之都市修仙》这本都市修仙小说很吸引眼球值得一读。</p>
                            <p class="info"><span><aria>作者：</aria>洛书</span><em class="type">重生</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP3</em></i>
                        </li>
                        <li class="s4">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180109/22-1P109111Z20-L.jpg" alt="桃色小乡村"/>
                            <a class="tit" href="/book/260.html">桃色小乡村</a>
                            <p class="intro">虽是小说，但里面的情节也折射出了很大一部分社会的现实，总之写的很接地气，看着很爽。</p>
                            <p class="info"><span><aria>作者：</aria>一条小墨鱼</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP4</em></i>
                        </li>
                        <li class="s5">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180908/31-1PZQ136050-L.jpg" alt="公媳诱惑"/>
                            <a class="tit" href="/book/7420.html">公媳诱惑</a>
                            <p class="intro">林曼曼是小区里公认的美女，她是一名舞蹈老师，脸蛋不光长的精致，最关键是她那走到哪里，都惹人眼红的身姿。</p>
                            <p class="info"><span><aria>作者：</aria>银雪</span><em class="type">都市</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP5</em></i>
                        </li>
                        <li class="s6">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180612/34-1P6121F6070-L.jpg" alt="你是夏日繁花"/>
                            <a class="tit" href="/book/2493.html">你是夏日繁花</a>
                            <p class="intro">很好看的一本现代言情小说,喜欢现代言情小说的读者们千万不要错过哦!</p>
                            <p class="info"><span><aria>作者：</aria>斯歌</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP6</em></i>
                        </li>
                        <li class="s7">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180810/36-1PQ01132430-L.jpg" alt="荒岛上的故事"/>
                            <a class="tit" href="/book/5534.html">荒岛上的故事</a>
                            <p class="intro">《荒岛上的故事》这本小说看了还想看，纯爱没有任何的废话。</p>
                            <p class="info"><span><aria>作者：</aria>没穿秋裤</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP7</em></i>
                        </li>
                        <li class="s8">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180903/35-1PZ31101530-L.jpg" alt="浮华逝梦"/>
                            <a class="tit" href="/book/7024.html">浮华逝梦</a>
                            <p class="intro">失足少女的青春，说说那些不堪回首的往事……</p>
                            <p class="info"><span><aria>作者：</aria>红尘烟雨</span><em class="type">都市</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP8</em></i>
                        </li>
                        <li class="s9">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180205/23-1P2051623090-L.jpg" alt="重生暖婚：甜妻，新上线"/>
                            <a class="tit" href="/book/517.html">重生暖婚：甜妻，新上线</a>
                            <p class="intro">她心高气傲，娇纵任性，一心要与墨景深离婚，最终彻底地把这个一直将她宠在手心的男人推开。我是一条鱼，只栖息在你掌心的湾</p>
                            <p class="info"><span><aria>作者：</aria>青青谁笑</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP9</em></i>
                        </li>
                        <li class="s10">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180705/31-1PF51456220-L.jpg" alt="完美人生"/>
                            <a class="tit" href="/book/3402.html">完美人生</a>
                            <p class="intro">神秘高手龙潜花都，与冰山美女总裁签订婚约，但无奈被嫌弃。可怜的沈浪，只得外出觅食。</p>
                            <p class="info"><span><aria>作者：</aria>花幽山月</span><em class="type">都市</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP10</em></i>
                        </li>
                    </ul>
                </div>
            </div>
            <!--tab3-->
            <div class="mod-body">
                <div class="top-list">
                    <ul class="clearfix">
                        <li class="s1">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180621/30-1P621110G30-L.jpg" alt="首长爹地放肆宠"/>
                            <a class="tit" href="/book/2644.html">首长爹地放肆宠</a>
                            <p class="intro">*为了维护该小说的合法权益以及更好的阅读体验，请大家点击右侧提示中打开本页面
                                《首长爹地放肆宠》又名《弃妻真难追》，是心心写的一部经典都市言情小说。</p>
                            <p class="info"><span><aria>作者：</aria>心心</span><em class="type">现情</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP1</em></i>
                        </li>
                        <li class="s2">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181206/38-1Q206141Q30-L.jpg" alt="我与空姐的荒岛求生记"/>
                            <a class="tit" href="/book/12491.html">我与空姐的荒岛求生记</a>
                            <p class="intro">荒岛求生！！！只要与美女相伴，张飞一辈子都想生活在岛上，与世隔绝，享受着天伦之乐.....</p>
                            <p class="info"><span><aria>作者：</aria>没穿秋裤</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP2</em></i>
                        </li>
                        <li class="s3">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180109/22-1P109111Z20-L.jpg" alt="桃色小乡村"/>
                            <a class="tit" href="/book/260.html">桃色小乡村</a>
                            <p class="intro">虽是小说，但里面的情节也折射出了很大一部分社会的现实，总之写的很接地气，看着很爽。</p>
                            <p class="info"><span><aria>作者：</aria>一条小墨鱼</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP3</em></i>
                        </li>
                        <li class="s4">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180908/31-1PZQ136050-L.jpg" alt="公媳诱惑"/>
                            <a class="tit" href="/book/7420.html">公媳诱惑</a>
                            <p class="intro">林曼曼是小区里公认的美女，她是一名舞蹈老师，脸蛋不光长的精致，最关键是她那走到哪里，都惹人眼红的身姿。</p>
                            <p class="info"><span><aria>作者：</aria>银雪</span><em class="type">都市</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP4</em></i>
                        </li>
                        <li class="s5">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180612/34-1P6121F6070-L.jpg" alt="你是夏日繁花"/>
                            <a class="tit" href="/book/2493.html">你是夏日繁花</a>
                            <p class="intro">很好看的一本现代言情小说,喜欢现代言情小说的读者们千万不要错过哦!</p>
                            <p class="info"><span><aria>作者：</aria>斯歌</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP5</em></i>
                        </li>
                        <li class="s6">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180810/36-1PQ01132430-L.jpg" alt="荒岛上的故事"/>
                            <a class="tit" href="/book/5534.html">荒岛上的故事</a>
                            <p class="intro">《荒岛上的故事》这本小说看了还想看，纯爱没有任何的废话。</p>
                            <p class="info"><span><aria>作者：</aria>没穿秋裤</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP6</em></i>
                        </li>
                        <li class="s7">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180903/35-1PZ31101530-L.jpg" alt="浮华逝梦"/>
                            <a class="tit" href="/book/7024.html">浮华逝梦</a>
                            <p class="intro">失足少女的青春，说说那些不堪回首的往事……</p>
                            <p class="info"><span><aria>作者：</aria>红尘烟雨</span><em class="type">都市</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP7</em></i>
                        </li>
                        <li class="s8">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180205/23-1P2051623090-L.jpg" alt="重生暖婚：甜妻，新上线"/>
                            <a class="tit" href="/book/517.html">重生暖婚：甜妻，新上线</a>
                            <p class="intro">她心高气傲，娇纵任性，一心要与墨景深离婚，最终彻底地把这个一直将她宠在手心的男人推开。我是一条鱼，只栖息在你掌心的湾</p>
                            <p class="info"><span><aria>作者：</aria>青青谁笑</span><em class="type">现情</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP8</em></i>
                        </li>
                        <li class="s9">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180705/31-1PF51456220-L.jpg" alt="完美人生"/>
                            <a class="tit" href="/book/3402.html">完美人生</a>
                            <p class="intro">神秘高手龙潜花都，与冰山美女总裁签订婚约，但无奈被嫌弃。可怜的沈浪，只得外出觅食。</p>
                            <p class="info"><span><aria>作者：</aria>花幽山月</span><em class="type">都市</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP9</em></i>
                        </li>
                        <li class="s10">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180716/35-1PG61336170-L.jpg" alt="缺失的爱"/>
                            <a class="tit" href="/book/3815.html">缺失的爱</a>
                            <p class="intro">丈夫经常在外出差，18岁的儿子高考前夕，突然对萧红提出了无礼要求，为了不影响儿子第二天考试，身为后妈的萧红，不得不答应和儿子……</p>
                            <p class="info"><span><aria>作者：</aria>佚名</span><em class="type">都市</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP10</em></i>
                        </li>
                    </ul>
                </div>
            </div>
            <!--tab4-->
            <div class="mod-body">
                <div class="top-list">
                    <ul class="clearfix">
                        <li class="s1">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180804/36-1PP41136150-L.jpg" alt="重生之都市修仙"/>
                            <a class="tit" href="/book/5183.html">重生之都市修仙</a>
                            <p class="intro">《重生之都市修仙》这本都市修仙小说很吸引眼球值得一读。</p>
                            <p class="info"><span><aria>作者：</aria>洛书</span><em class="type">重生</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP1</em></i>
                        </li>
                        <li class="s2">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181029/39-1Q02Z929200-L.jpg" alt="鸿运官路"/>
                            <a class="tit" href="/book/10523.html">鸿运官路</a>
                            <p class="intro">粉身碎骨浑不怕，要留清白在人间。在官场里，清与浊就在一念之间。</p>
                            <p class="info"><span><aria>作者：</aria>宅春秋</span><em class="type">官场</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP2</em></i>
                        </li>
                        <li class="s3">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180724/36-1PH41003470-L.jpg" alt="棺叩首"/>
                            <a class="tit" href="/book/4446.html">棺叩首</a>
                            <p class="intro">《棺叩首》又名《鬼门棺》这本恐怖的小说非常的又看点。</p>
                            <p class="info"><span><aria>作者：</aria>苗棋淼</span><em class="type">恐怖</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP3</em></i>
                        </li>
                        <li class="s4">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180825/36-1PR51029260-L.jpg" alt="浮生难寄相思泪"/>
                            <a class="tit" href="/book/6513.html">浮生难寄相思泪</a>
                            <p class="intro">《浮生难寄相思泪》这本古代玄幻小说非常的好看。</p>
                            <p class="info"><span><aria>作者：</aria>木子溪</span><em class="type">玄幻</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP4</em></i>
                        </li>
                        <li class="s5">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180118/23-1P11Q051090-L.jpg" alt="快穿：我只想种田"/>
                            <a class="tit" href="/book/364.html">快穿：我只想种田</a>
                            <p class="intro">本文无CP。女主经历磨难方化蝶而飞，作者的文基本都是对话逗比但是往往剧情深沉，期待更新。</p>
                            <p class="info"><span><aria>作者：</aria>沧澜止戈</span><em class="type">玄幻</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP5</em></i>
                        </li>
                        <li class="s6">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180123/23-1P1231131300-L.jpg" alt="重生宠婚：顾少，小心爱！"/>
                            <a class="tit" href="/book/398.html">重生宠婚：顾少，小心爱！</a>
                            <p class="intro">重活一世，她不求轰轰烈烈，不求名动全城，只求相濡以沫。她要向全世界证明，活在过去的不是她！ 她要守望自己的幸福！</p>
                            <p class="info"><span><aria>作者：</aria>苏眉心</span><em class="type">重生</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP6</em></i>
                        </li>
                        <li class="s7">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180510/26-1P5100940440-L.jpg" alt="帝君宠：养只狐妃来暖床"/>
                            <a class="tit" href="/book/1363.html">帝君宠：养只狐妃来暖床</a>
                            <p class="intro">这只宠物，暖床正好！</p>
                            <p class="info"><span><aria>作者：</aria>凤涅狂</span><em class="type">玄幻</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP7</em></i>
                        </li>
                        <li class="s8">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/181218/39-1Q21Q602310-L.png" alt="全才无双"/>
                            <a class="tit" href="/book/13029.html">全才无双</a>
                            <p class="intro">在教育局，章子梅是众多男人渴慕的对象！

                                叶兴盛常常感叹，他女友要是也这么漂亮该多好，那样的话，他天天搂着她，怎么亲怎么抱都不够！</p>
                            <p class="info"><span><aria>作者：</aria>喜鹊</span><em class="type">官场</em><em class="serial">连载中</em></p>
                            <i class="num"><em>TOP8</em></i>
                        </li>
                        <li class="s9">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180829/39-1PR9114H30-L.png" alt="灵异直播间"/>
                            <a class="tit" href="/book/7411.html">灵异直播间</a>
                            <p class="intro">《猛鬼直播间》是作者吞鬼的女孩创作的现代言情小说，主要讲述的是主角元君瑶和唐明黎直播捉鬼的故事。小说剧情跌宕起伏，值得一看。小说引人入胜，推荐阅读</p>
                            <p class="info"><span><aria>作者：</aria>吞鬼的女孩</span><em class="type">恐怖</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP9</em></i>
                        </li>
                        <li class="s10">
                            <img class="pic lazy" src="http://img.p.com/uploads/allimg/180723/35-1PH31543130-L.jpg" alt="日日思君不见君"/>
                            <a class="tit" href="/book/4379.html">日日思君不见君</a>
                            <p class="intro"><span>他荣登大宝之日，她等来的却不是封后的圣旨，而是满门抄斩的厄运……</span></p>
                            <p class="info"><span><aria>作者：</aria>柒色</span><em class="type">官场</em><em class="finish">已完结</em></p>
                            <i class="num"><em>TOP10</em></i>
                        </li>
                    </ul>
                </div>
            </div>
        </mip-vd-tabs>
    </div>
    <!-- /rank -->
</div>
{/block}
{block name="footer"}
    <script>
        layui.config({
            version: (new Date).getTime()
        }).use(['carousel', 'jquery'], function(){

            var carousel = layui.carousel,
            $ = layui.jquery;

            $(function () {
                carousel.render({
                    elem: '#swiper'
                    ,width: '100%' //设置容器宽度
                    ,height: "10rem"
                    ,arrow: 'none' //不显示箭头
                    ,anim: 'fade' //切换动画方式
                });
            });
    });
</script>
{/block}