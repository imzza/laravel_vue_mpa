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

    //Route::apiResource('students', 'StudentsController');

    Route::get('/students', 'StudentsController@index');
    Route::post('/students', 'StudentsController@store');
    Route::get('/students/{student}', 'StudentsController@show');
    Route::put('/students/{student}', 'StudentsController@update');
    Route::delete('/students/{student}', 'StudentsController@destroy');

    Route::get('roles_with_permissions', 'RolesAndPermissionsController@rolesWithPermissions');
    Route::get('/roles', 'RolesAndPermissionsController@roles');
    Route::post('/roles', 'RolesAndPermissionsController@storeRole');
    Route::get('/roles/{id}', 'RolesAndPermissionsController@getRoleById');
    Route::put('/roles/{id}', 'RolesAndPermissionsController@updateRole');
    Route::delete('/roles/{id}', 'RolesAndPermissionsController@destroyRole');

    // All routes about permissions
    Route::get('/permissions', 'RolesAndPermissionsController@permissions');
    Route::post('/permissions', 'RolesAndPermissionsController@storePermission');
    Route::get('permissions/{id}', 'RolesAndPermissionsController@getPermissionById');
    Route::put('permissions/{id}', 'RolesAndPermissionsController@updatePermission');
    Route::delete('permissions/{id}', 'RolesAndPermissionsController@destroyPermission');

    Route::get('/permission_by_group', 'RolesAndPermissionsController@permission_by_group');
    Route::post('/roles_assign_permissions', 'RolesAndPermissionsController@roles_assign_permissions');
    Route::get('/permission_by_role/{role}', 'RolesAndPermissionsController@permission_by_role');
    //Employe Assign Roles
    Route::get('/get_user_role/{user}', 'RolesAndPermissionsController@get_user_role');
    Route::post('/assign_role', 'RolesAndPermissionsController@assign_role');
});
