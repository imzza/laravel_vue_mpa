<?php

use Illuminate\Database\Seeder;

class StudentsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {


        \DB::table('students')->delete();

        \DB::table('students')->insert(array (
            0 =>
            array (
                'id' => 1,
                'about' => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quia harum cum, nemo architecto quos quae consectetur omnis consequatur, ad aspernatur, excepturi fugiat quaerat nihil voluptates illum modi. Explicabo, asperiores, ipsa.',
                'address' => 'qwqwqww',
                'address2' => 'qwqwqwqw',
                'city' => 'qwqwqw',
                'email' => 'testaccount@gmail.com',
                'first_name' => 'qwqwq',
                'gender' => 'male',
                'image' => '1571780681.jpeg',
                'last_name' => 'qwqwq',
                'password' => 'qwqwqw',
                'state' => 'LA',
                'zip' => '54000',
                'offers' => 1,
                'created_at' => '2019-10-23 16:44:41',
                'updated_at' => '2019-10-23 16:44:41',
            ),
        ));
    }
}
