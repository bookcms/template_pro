<?php
/**
 * Created by PhpStorm.
 * User: bookcms
 * Date: 2018/7/11
 * Time: 下午8:56
 */

namespace app\common\taglib;

use think\Db;
use think\facade\Config;
use think\facade\Url;
use think\template\TagLib;

class Tag extends TagLib
{
    /**
     * 定义标签列表
     */
    protected $tags = [
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'web' => ['attr' => 'name,value', 'close' => 0],
        'ad' => ['attr' => 'alias', 'close' => 0],
        'novel_list' => ['attr' => 'cid_list,limit', 'close' => 1],
        'block_list' => ['attr' => 'block_id,limit', 'close' => 1],
        'slide_list' => ['attr' => 'limit', 'close' => 1],
        'ranking_list' => ['attr' => 'cid,limit,name', 'close' => 1],
        'cid_ranking_list' => ['attr' => 'cid,limit,name', 'close' => 1],
        'random_list' => ['attr' => 'cid,limit', 'close' => 1],
        'author_list' => ['attr' => 'author,limit', 'close' => 1],
        'hot_full_list' => ['attr' => 'limit', 'close' => 1],
    ];

    public function tagAd($tag, $content) {
        $alias = isset($tag['alias']) ? $tag['alias'] : '';

        //分类id
        if (!empty($alias)) {
            $alias  = $this->autoBuildVar($alias);
        }

        $parse = <<<EOF
        <?php
                \$content = get_ad('$alias');
                echo \$content;
            ?>
EOF;
        return $parse;
    }

    /**
     * 热门全本
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagHot_full_list($tag, $content) {
        $limit = isset($tag['limit']) ? $tag['limit'] : 8;

        $parse = <<<EOF

        <?php

            \$__LIST__ = get_hot_full_list($limit);
            if(is_array(\$__LIST__)):
                foreach(\$__LIST__ as \$index => \$hot_full):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';
        return $parse;
    }

    /**
     * 随机数据
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagRandom_list($tag, $content) {
        $limit = isset($tag['limit']) ? $tag['limit'] : 8;
        $cid = isset($tag['cid']) ? $tag['cid'] : "''";

        //分类id
        if (!empty($cid)) {
            $cid  = $this->autoBuildVar($cid);
        }

        $parse = <<<EOF

        <?php

            \$__LIST__ = get_random_list($cid,$limit);
            if(is_array(\$__LIST__)):
                foreach(\$__LIST__ as \$index => \$random):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';
        return $parse;
    }

    /**
     * 作者书籍列表
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagAuthor_list($tag, $content) {
        $limit = isset($tag['limit']) ? $tag['limit'] : 8;
        $author = isset($tag['author']) ? $tag['author'] : "''";
        $cid = isset($tag['cid']) ? $tag['cid'] : "''";

        //分类id
        if (!empty($cid)) {
            $cid  = $this->autoBuildVar($cid);
        }
        $cid = (int)$cid;

        if (!empty($author)) {
            $author  = $this->autoBuildVar($author);
        }

        $parse = <<<EOF

        <?php

            \$__LIST__ = get_author_list($author,$limit,$cid);
            if(is_array(\$__LIST__)):
                foreach(\$__LIST__ as \$index => \$author):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';
        return $parse;
    }

    /**
     * 排行榜数据
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagRanking_list($tag, $content) {
        $limit = isset($tag['limit']) ? $tag['limit'] : 8;
        $cid = isset($tag['cid']) ? $tag['cid'] : "''";
        $name = isset($tag['name']) ? $tag['name'] : 'top';

        //分类id
        if (!empty($cid)) {
            $cid  = $this->autoBuildVar($cid);
        }

        $parse = <<<EOF

        <?php

            \$__LIST__ = get_redis_all_ranking_list($cid,"$limit","$name");
            if(is_array(\$__LIST__)):
                foreach(\$__LIST__ as \$index => \$ranking):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';
        return $parse;
    }

    /**
     * 分类id排行
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagCid_ranking_list($tag, $content) {
        $limit = isset($tag['limit']) ? $tag['limit'] : 8;
        $cid = isset($tag['cid']) ? $tag['cid'] : "''";
        $name = isset($tag['name']) ? $tag['name'] : 'top';

        //分类id
        if (!empty($cid)) {
            $cid  = $this->autoBuildVar($cid);
        }

        $parse = <<<EOF

        <?php

            \$__LIST__ = get_redis_cid_ranking_list($cid,"$limit","$name");
            if(is_array(\$__LIST__)):
                foreach(\$__LIST__ as \$index => \$ranking):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';
        return $parse;
    }

    /**
     * 幻灯片标签
     * @param $tag
     * @param $content
     * @return string
     */
    public function tagSlide_list($tag, $content)
    {
        $limit = isset($tag['limit']) ? $tag['limit'] : 4;
        $parse = <<<EOF

        <?php

            \$__LIST__ = get_slide_list($limit);
            if(is_array(\$__LIST__)):
               foreach(\$__LIST__ as \$index => \$slide):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';
        return $parse;
    }

    public function tagNovel_list($tag, $content)
    {
        $limit = isset($tag['limit']) ? $tag['limit'] : 10;
        $offset = isset($tag['offset']) ? $tag['offset'] : 0;
        $cid_list = isset($tag['cid_list']) ? $tag['cid_list'] : '';

        //分类id
        if (!empty($cid_list)) {
            $cid_list  = $this->autoBuildVar($cid_list);
        }

        $parse = <<<EOF
        <?php

           \$__LIST__ = \model('article')->whereIn('Cid',$cid_list)->limit($offset,$limit)->order('PrimaryId','desc')->cache()->select();
           if(!empty(\$__LIST__)):
                foreach(\$__LIST__ as \$index => \$novel):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';
        return $parse;
    }

    public function tagBlock_list($tag, $content)
    {
        $limit = isset($tag['limit']) ? $tag['limit'] : 10;
        $block_id = isset($tag['block_id']) ? $tag['block_id'] : '';

        if (!empty($block_id)) {
            $block_id  = $this->autoBuildVar($block_id);
        }

        $parse = <<<EOF
        <?php
                \$__LIST__ = get_block_list($block_id,$limit);
                if(is_array(\$__LIST__)):
                   foreach(\$__LIST__ as \$index => \$block):
            ?>
EOF;

        $parse .= $content;
        $parse .= '<?php endforeach; ?>';
        $parse .= '<?php endif; ?>';

        return $parse;
    }


}