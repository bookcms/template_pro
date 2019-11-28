<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// +----------------------------------------------------------------------
// | 缓存设置
// +----------------------------------------------------------------------

$book_cache_prefix = str_replace(".","_",explode('/',__DIR__))[3];

return [
    // 驱动方式
    'type'   => 'Redis',
    // 主机地址
    'host' => '127.0.0.1',
    // 主机端口
    'port' => '6379',
    // 缓存前缀
    'prefix' => $book_cache_prefix . '_',
    // 密码
    'password' => '',
    // 缓存有效期 0表示永久缓存
    'expire' => 1,
    // 链接超时
    'timeout' => 3600
];

