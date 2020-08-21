<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        \DB::table('users')->delete();
        \DB::table('users')->insert(array (
            0 =>
            array (
                'id' => 1,
                'name' => 'Test Admin',
                'first_name' => 'Test',
                'last_name' => 'Admin',
                'image' => NULL,
                'email' => 'admin@test.com',
                'password' => '$2y$10$DpoUX9yNGXXTiF6Fg18sZ.WFbg096Hx17tA00I4oYA4YQ5Xta/V6m',//password
                'is_active' => 1,
                'remember_token' => NULL,
                'created_at' => '2019-07-23 00:00:00',
                'updated_at' => NULL,
            ),
            1 =>
            array (
                'id' => 7,
                'name' => 'Test User',
                'first_name' => 'Test',
                'last_name' => 'User',
                'image' => NULL,
                'email' => 'test@test.com',
                'password' => '$argon2i$v=19$m=1024,t=2,p=2$SnZESGl2aTRvNndEWW9nWQ$gt5tDvma6cPv2WtVWpyH7MU+x5tTb/6nl1RsLPYXVIg',//password
                'is_active' => 0,
                'remember_token' => NULL,
                'created_at' => '2019-11-01 18:18:25',
                'updated_at' => '2019-11-01 18:18:25',
            ),
        ));
    }
}
