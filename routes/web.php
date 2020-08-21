<?php
Auth::routes();

// For Role base Authorization
// Route::group(['middleware' => ['role:SUP', 'auth']], function () {});


Route::group(['prefix' => 'admin'], function(){
    Route::get('/', 'HomeController@admin')->name('admin.index');
});

Route::group(['middleware' => ['auth']], function () {
    Route::get('/test/{any?}', 'HomeController@test')->where('any', '.*')->middleware(['permission:testing']);
    Route::get('/roles_and_permissions/{any?}', 'RolesAndPermissionsController@index')->where('any', '.*')->middleware(['role_or_permission:SUP|role_and_permissions']);
    Route::get('/{any?}', 'HomeController@index')->where('any', '.*');
});
