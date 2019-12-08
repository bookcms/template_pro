<?php

namespace app\common\model;
use think\Model;

class News extends  Model
{
    protected function initialize()
    {
        parent::initialize();
    }

    public function getPrimaryIdAttr($value = ''){
        return get_offset_value($value);
    }

    public function getNewsIdAttr($value = ''){
        return get_offset_value($value);
    }

    public function getCidAttr($value = ''){
        return get_offset_value($value);
    }

}
