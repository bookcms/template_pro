<?php

namespace app\index\controller;
use app\common\controller\Common;

class Info extends Common
{
    public function index ($type = ''){

        $this->site_seo('info');
        return $this->fetch('index',['type' => $type]);
    }
}