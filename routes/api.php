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

    // Route::get('/students', 'StudentsController@index');
    // Route::post('/students', 'StudentsController@store');
    // Route::get('/students/{student}', 'StudentsController@show');
    // Route::put('/students/{student}', 'StudentsController@update');
    // Route::delete('/students/{student}', 'StudentsController@destroy');




    // Route::get('profile', 'UserController@profile');
    // Route::post('profile', 'UserController@update');

        // Route::apiResource('roles', 'RolesController');


        Route::get('/roles', 'RolesAndPermissionsController@roles');
        Route::post('/roles', 'RolesAndPermissionsController@store');
        Route::get('/roles/{id}', 'RolesAndPermissionsController@show');
        Route::put('/roles/{id}', 'RolesAndPermissionsController@update');
        Route::delete('/roles/{id}', 'RolesAndPermissionsController@destroy');




        //Route::apiResource('permissions', 'PermissionsController');
        Route::get('/permissions', 'RolesAndPermissionsController@permissions');


        Route::get('employees_all', 'EmployeesController@employees_all');
        Route::get('permission_by_group', 'PermissionsController@permission_by_group');
        Route::post('roles_assign_permissions', 'RolesController@roles_assign_permissions');
        Route::get('permission_by_role/{role}', 'PermissionsController@permission_by_role');
        //Employe Assign Roles
        // Route::get('get_user_role/{user}', 'EmployeesController@get_user_role');
        // Route::post('assign_role', 'EmployeesController@assign_role');

        Route::get('all_permissions', 'PermissionsController@index');
        Route::post('permissions', 'PermissionsController@store');
        Route::get('permissions/{permission}', 'PermissionsController@show');
        Route::put('permissions/{permission}', 'PermissionsController@update');
        Route::delete('permissions/{permission}', 'PermissionsController@destroy');


    // For Api Calls
    // Route::put()
    // Route::delete();
    // Route::post();
});
