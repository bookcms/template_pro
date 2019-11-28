<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]
namespace think;

// 加载基础文件
require __DIR__ . '/../thinkphp/base.php';

// 支持事先使用静态方法设置Request对象和Config对象

$_site_config_file = dirname(__FILE__) . "/../data/site_config.json";
if (!file_exists($_site_config_file)) {
    exit("站点配置文件不存在,请在BookCMS后台勾选站点,点击同步配置!");
}

$_site_config = json_decode(file_get_contents($_site_config_file),true);

// 执行应用并响应
Container::get('app')->bind(trim($_site_config['template']))->run()->send();
