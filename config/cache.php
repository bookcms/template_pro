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

$_site_config_file = dirname(__FILE__) . "/../data/site_config.json";
if (!file_exists($_site_config_file)) {
    exit("站点配置文件不存在,请在BookCMS后台勾选站点,点击同步配置!");
}
$_site_config = json_decode(file_get_contents($_site_config_file),true);

return [
    // 驱动方式
    'type'   => $_site_config['extend']['site_cache_type'] ? $_site_config['extend']['site_cache_type'] : "file",
    // 主机地址
    'host' => '127.0.0.1',
    // 主机端口
    'port' => '6379',
    // 缓存前缀
    'prefix' => str_replace(".","_",explode('/',__DIR__))[3] . '_',
    // 密码
    'password' => '',
    // 缓存有效期 0表示永久缓存
    'expire' => $_site_config['extend']['site_cache_time'] ? (int)$_site_config['extend']['site_cache_time'] : 30,
    // 链接超时
    'timeout' => 3600
];

