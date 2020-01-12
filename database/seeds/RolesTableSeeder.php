<?php

use Illuminate\Database\Seeder;

class RolesTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('roles')->delete();
        
        \DB::table('roles')->insert(array (
            0 => 
            array (
                'id' => 1,
                'name' => 'SUP',
                'guard_name' => 'web',
                'role_descrip' => 'Complete Access to the Application',
                'rolename' => 'Super Admin',
                'created_at' => '2019-07-09 22:34:10',
                'updated_at' => '2019-07-29 14:40:07',
            ),
            1 => 
            array (
                'id' => 2,
                'name' => 'USER',
                'guard_name' => 'web',
                'role_descrip' => 'Regular User',
                'rolename' => 'Standered User',
                'created_at' => '2019-07-09 22:34:10',
                'updated_at' => '2019-07-12 11:57:10',
            ),
        ));
        
        
    }
}