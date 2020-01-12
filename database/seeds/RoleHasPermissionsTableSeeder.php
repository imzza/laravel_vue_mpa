<?php

use Illuminate\Database\Seeder;

class RoleHasPermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('role_has_permissions')->delete();
        
        \DB::table('role_has_permissions')->insert(array (
            0 => 
            array (
                'permission_id' => 1,
                'role_id' => 1,
            ),
            1 => 
            array (
                'permission_id' => 17,
                'role_id' => 1,
            ),
            2 => 
            array (
                'permission_id' => 18,
                'role_id' => 1,
            ),
            3 => 
            array (
                'permission_id' => 19,
                'role_id' => 1,
            ),
            4 => 
            array (
                'permission_id' => 20,
                'role_id' => 1,
            ),
            5 => 
            array (
                'permission_id' => 21,
                'role_id' => 1,
            ),
            6 => 
            array (
                'permission_id' => 22,
                'role_id' => 1,
            ),
            7 => 
            array (
                'permission_id' => 23,
                'role_id' => 1,
            ),
            8 => 
            array (
                'permission_id' => 1,
                'role_id' => 2,
            ),
        ));
        
        
    }
}