<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Validator;


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

    public function rolesWithPermissions(Request $request) {

        $roles = Role::with('permissions')->get();


        $permissions = Permission::all();
        $parrent = [];
        foreach ($permissions as $perm) {
            if (!array_key_exists($perm['type'], $parrent)) {
                // checking if key not exist in array
                $parrent[$perm['type']] = [];
            }
            $parrent[$perm['type']][] = $perm;
        }

        return response()->json(['roles' => $roles, 'permissions'=> $parrent], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeRole(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:roles,name',
            'rolename' => 'required|min:3',
            'roledescription' => 'required',
        ]);
        $role = new Role();
        $role->name = $request->name;
        $role->rolename = $request->rolename;
        $role->role_descrip = $request->roledescription;
        $role->save();
        if ($role->id) {
            return response()->json($role, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    public function storePermission(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:permissions,name',
            'permissionkey' => 'required',
            'permissiontype' => 'required',
        ]);
        $permission = new Permission();
        $permission->name = $request->name;
        $permission->key = $request->permissionkey;
        $permission->type = $request->permissiontype;
        $permission->guard_name = 'web';
        $permission->save();
        if ($permission->id) {
            return response()->json($permission, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getRoleById($id)
    {
        $role = Role::where('id', $id)->first();
        if ($role->id) {
            return response()->json($role, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    public function getPermissionById($id)
    {
        $permission = Permission::where('id', $id)->first();
        if ($permission->id) {
            return response()->json($permission, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateRole(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:roles,name,'.$id,
            'rolename' => 'required|min:3',
            'roledescription' => 'required'
        ]);
        $updateRoleData = array(
            'name' => $request->name,
            'rolename' => $request->rolename,
            'role_descrip' => $request->roledescription
        );

        $affectedRows = Role::where('id', '=', $id)->update($updateRoleData);
        if ($affectedRows) {
            return response()->json($affectedRows, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }

    }

    public function updatePermission(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:permissions,name,'.$id,
            'permissionkey' => 'required',
            'permissiontype' => 'required'
        ]);
        $updatePermissionData = array(
            'name' => $request->name,
            'key' => $request->permissionkey,
            'type' => $request->permissiontype
        );
        $affectedRows = Permission::where('id', '=', $id)->update($updatePermissionData);
        if ($affectedRows) {
            return response()->json($affectedRows, 201);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroyPermission($id)
    {
        $affectedRows = Permission::where('id', '=', $id)->delete();
        if ($affectedRows) {
            return response()->json($affectedRows, 204);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }

    public function destroyRole($id)
    {
        $affectedRows = Role::where('id', '=', $id)->delete();
        if ($affectedRows) {
            return response()->json($affectedRows, 204);
        } else {
            return response()->json(['message' => 'Bad Request'], 400);
        }
    }


    public function roles(Request $request) {
        $sortRules = $request->input('sort');
        $limit = $request->input('per_page');
        list($field, $dir) = explode('|', $sortRules);

        $result = Role::orderBy($field, $dir);
        if ($request->filter != '') {
            $result = $result->where('name', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('role_descrip', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('rolename', 'like', '%'.$request->filter.'%');
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
            $result = $result->where('name', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('key', 'like', '%'.$request->filter.'%');
            $result = $result->orWhere('type', 'like', '%'.$request->filter.'%');
        }
        $result = $result->paginate($limit);

        return response()->json($result, 200);

    }

    public function permission_by_group() {
        $permissions = Permission::all();
        $parrent = [];
        foreach ($permissions as $perm) {
            if (!array_key_exists($perm['type'], $parrent)) {
                // checking if key not exist in array
                $parrent[$perm['type']] = [];
            }
            $parrent[$perm['type']][] = $perm;
        }
        if ($permissions) {
            return response()->json($parrent, 200);
        } else {
            return response()->json(null, 204);
        }
    }

    public function permission_by_role(Role $role) {
        $permissions = $role->permissions->toArray();
        $permissions = array_column($permissions, 'id');
        return response()->json($permissions, 200);
    }

    public function roles_assign_permissions(Request $request) {
        $role = Role::find($request->id);
        $assign = $role->syncPermissions($request->permissions);
        if ($assign) {
            return response()->json(['message' => 'Permissions assigned.'], 200);
        } else {
            return response()->json(['message' => 'Something went wrong'], 400);
        }
    }

}
