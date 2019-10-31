<?php


Auth::routes();
Route::group(['middleware' => ['auth']], function () {
	Route::get('/{any?}', 'HomeController@index')->where('any', '.*');
});
