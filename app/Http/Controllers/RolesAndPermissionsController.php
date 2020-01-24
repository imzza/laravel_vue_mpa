<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class RolesAndPermissionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('RolesAndPermissions.index');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function roles(Request $request) {
        $sortRules = $request->input('sort');
        $limit = $request->input('per_page');
        list($field, $dir) = explode('|', $sortRules);

        $result = Role::orderBy($field, $dir);
        if ($request->filter != '') {
            $result = $result->where('name', 'like', $request->filter);
            $result = $result->orWhere('role_descrip', 'like', $request->filter);
            $result = $result->orWhere('rolename', 'like', $request->filter);
        }
        $result = $result->paginate($limit);

        return response()->json($result, 200);
    }

    public function permissions(Request $request) {
        $sortRules = $request->input('sort');
        $limit = $request->input('per_page');
        list($field, $dir) = explode('|', $sortRules);

        $result = Permission::orderBy($field, $dir);
        if ($request->filter != '') {
            $result = $result->where('name', 'like', $request->filter);
            $result = $result->orWhere('key', 'like', $request->filter);
            $result = $result->orWhere('type', 'like', $request->filter);
        }
        $result = $result->paginate($limit);

        return response()->json($result, 200);

    }
}
