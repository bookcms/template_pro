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

use think\facade\Route;

//分类
Route::get('classify/:where', 'category/index');
Route::get('classify', 'category/index');

Route::get('ajax/home_cid_list','index/home_cid_list');

//资讯
Route::get('news/list_:page', 'news/index');
Route::get('news/:id', 'news/detail');
Route::get('news', 'news/index');

return [];
