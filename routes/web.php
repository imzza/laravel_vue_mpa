<?php

Auth::routes();
Route::group(['middleware' => ['auth']], function () {
    Route::get('/test/{any?}', 'HomeController@test')->where('any', '.*');
    Route::get('/{any?}', 'HomeController@index')->where('any', '.*');
});
