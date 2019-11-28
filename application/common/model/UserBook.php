<?php

namespace app\common\model;
use think\Model;

class UserBook extends  Model
{
    protected function initialize()
    {
        parent::initialize();
    }

    public function getPrimaryIdAttr($value = ''){
        return get_offset_value($value);
    }

    public function getLastChapterSortAttr($value = ''){
        return get_offset_value($value);
    }

}
