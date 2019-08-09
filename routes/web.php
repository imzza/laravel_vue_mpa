<?php


Auth::routes();

Route::group(['middleware' => ['auth']], function () {

	Route::get('/{any?}', 'HomeController@index')->where('any', '.*');

	// Route::get('/dashboard/{any?}', function(){
	// 	return view('dashboard');
	// })->where('any', '.*');
});
