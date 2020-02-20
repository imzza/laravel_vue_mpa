<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller {
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index() {
        // Auth::user()->syncRoles(['SUP']);
        //  $role = Auth::user()->getRoleNames();
        //  dd($role);
        // return $role;

        return view('dashboard', ['users' => \App\User::all()]);
    }


    public function admin() {


        return view('welcome', ['users' => 'dummy data']);


    }

    public function test() {
        return view('test');
    }
}
