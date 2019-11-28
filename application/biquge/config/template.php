<?php

use think\facade\Env;

return [
    // +----------------------------------------------------------------------
    // | 后台模板设置
    // +----------------------------------------------------------------------
    'view_path' => '../templates/biquge/',
    // 视图输出字符串内容替换
    'tpl_replace_string' => [
        '__STATIC__' => '/static/biquge',
        '__IMAGES__' => '/static/biquge/images',
        '__JS__'     => '/static/biquge/js',
        '__CSS__'    => '/static/biquge/css'
    ],
];
