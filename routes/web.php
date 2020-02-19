<?php
Auth::routes();




// Route::group(['middleware' => ['role:SUP', 'auth']], function () {
//     Route::group(['prefix' => 'admin'], function(){
//         Route::get('/', 'HomeController@admin')->name('admin.index');
//     });
// });

Route::group(['middleware' => ['auth']], function () {
    Route::get('/test/{any?}', 'HomeController@test')->where('any', '.*');
    Route::get('/roles_and_permissions/{any?}', 'RolesAndPermissionsController@index')->where('any', '.*');
    Route::get('/{any?}', 'HomeController@index')->where('any', '.*');
});
