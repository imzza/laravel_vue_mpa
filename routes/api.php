<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('me', function (Request $request) {
    return response()->json($request->user(), 200);
});

Route::group(['middleware' => 'auth:api'], function () {
    // Route::post('getToken', 'UserController@getToken');

    Route::apiResource('students', 'StudentsController');

    Route::get('api/students', 'StudentsController@index');
    Route::post('api/students', 'StudentsController@store');
    Route::get('api/students/{student}', 'StudentsController@show');
    Route::put('api/students/{student}', 'StudentsController@update');
    Route::delete('api/students/{student}', 'StudentsController@destroy');

    // For Api Calls
    // Route::put()
    // Route::delete();
    // Route::post();
});
