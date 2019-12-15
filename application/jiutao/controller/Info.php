<?php

namespace app\jiutao\controller;
use app\common\controller\Common;

class Info extends Base
{
    public function index ($type = ''){

        $this->site_seo('info');
        return $this->fetch('index',['type' => $type]);
    }
}