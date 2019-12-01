<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStudentsTable extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up() {
        Schema::create('students', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('about');
            $table->string('address');
            $table->string('address2')->nullable();
            $table->string('city');
            $table->string('email');
            $table->string('first_name');
            $table->string('gender');
            $table->string('image');
            $table->string('last_name');
            $table->string('password');
            $table->string('state');
            $table->string('zip');
            $table->boolean('offers')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down() {
        Schema::dropIfExists('students');
    }
}
