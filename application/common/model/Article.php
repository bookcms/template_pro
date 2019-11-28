<?php

namespace app\common\model;
use think\Model;

class Article extends  Model
{
    protected function initialize()
    {
        parent::initialize();
    }

    public function getPrimaryIdAttr($value = ''){
        return get_offset_value($value);
    }

}
