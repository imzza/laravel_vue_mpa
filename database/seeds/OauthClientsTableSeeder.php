<?php

use Illuminate\Database\Seeder;

class OauthClientsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('oauth_clients')->delete();
        
        \DB::table('oauth_clients')->insert(array (
            0 => 
            array (
                'id' => 1,
                'user_id' => NULL,
                'name' => 'Laravel Personal Access Client',
                'secret' => 'F0VkFJfsTNH8e6eU9xAbgKjnuNoQgxS4DcU7mn4K',
                'redirect' => 'http://localhost',
                'personal_access_client' => 1,
                'password_client' => 0,
                'revoked' => 0,
                'created_at' => '2019-03-11 05:54:07',
                'updated_at' => '2019-03-11 05:54:07',
            ),
            1 => 
            array (
                'id' => 2,
                'user_id' => NULL,
                'name' => 'Laravel Password Grant Client',
                'secret' => '1gTbomOfr05z2BJqp3mcebcqtBjcEbrQ1DmWsjL7',
                'redirect' => 'http://localhost',
                'personal_access_client' => 0,
                'password_client' => 1,
                'revoked' => 0,
                'created_at' => '2019-03-11 05:54:07',
                'updated_at' => '2019-03-11 05:54:07',
            ),
            2 => 
            array (
                'id' => 3,
                'user_id' => NULL,
                'name' => 'TimeClock Password Grant Client',
                'secret' => 'lHef9ty2asIHrkx16Zz0f4c7fxDM31J0piJaBa6D',
                'redirect' => 'http://localhost',
                'personal_access_client' => 0,
                'password_client' => 1,
                'revoked' => 0,
                'created_at' => '2019-09-03 16:54:25',
                'updated_at' => '2019-09-03 16:54:25',
            ),
        ));
        
        
    }
}