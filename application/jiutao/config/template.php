<?php

use think\facade\Env;

return [
    // +----------------------------------------------------------------------
    // | 后台模板设置
    // +----------------------------------------------------------------------
    'view_path' => '../templates/jiutao/',
    // 视图输出字符串内容替换
    'tpl_replace_string' => [
        '__STATIC__' => '/static/jiutao',
        '__IMAGES__' => '/static/jiutao/images',
        '__JS__'     => '/static/jiutao/js',
        '__CSS__'    => '/static/jiutao/css'
    ],
];
