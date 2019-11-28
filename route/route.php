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

//排行榜
Route::get('top', 'top/index');

//下载桌面快捷方式
Route::get('desktop', 'index/desktop');

//用户中心
Route::rule('user/password', 'user/password');
Route::get('user/index', 'user/index');
Route::rule('user/rack_list', 'user/rack_list');
Route::rule('user/collect_list', 'user/collect_list');
Route::rule('user/messages', 'user/messages');
Route::post('user/add_book', 'user/add_book');
Route::post('user/delete_book', 'user/delete_book');
Route::post('user/update_book', 'user/update_book');

//登录 注册 退出
Route::get('login/logout', 'login/logout');
Route::rule('login/reg', 'login/reg');
Route::rule('login/index', 'login/index');
Route::post('login/check', 'login/check');

//信息
Route::get('info/:type', 'info/index');
//全本
Route::get('full_:page', 'index/full');
Route::get('full', 'index/full');
//搜索
Route::get('search', 'index/search');
//更新缓存
Route::post('update_cache', 'article/update_cache');
//站点地图
Route::get('sitemap_:page.xml', 'index/build_site_index_map');
Route::get('sitemap.xml', 'index/build_site_map');
//章节详情
Route::get('chapter/:primary_id/:chapter_id', 'chapter/index');
//小说详情
Route::get('book/:primary_id', 'article/index');
//作者
Route::get('author/:name', 'article/author');
//排行榜
Route::get('ranking', 'ranking/index');


return [];
