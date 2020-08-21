<?php

namespace App\Http\Controllers\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Auth\Events\Login;
use App\dbUser;

class LoginController extends Controller {
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */
    // $results = DB::select("SELECT LOGIN_DATA_TABLE.EMPLOYEE, DBUser.Name, LOGIN_DATA_TABLE.LOGIN_AUTONUMBER, DBUser.User
    // FROM LOGIN_DATA_TABLE INNER JOIN DBUser ON LOGIN_DATA_TABLE.EMPLOYEE = DBUser.Group WHERE ((DBUser.User)=True) AND LOGIN_DATA_TABLE.EMPLOYEE_ID");

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    // protected $redirectTo = '/dashboard';

    /**
     * Create a new controller instance.
     *
     * @return void
     */

    //Do teh Dynamic Magic Here


    protected function authenticated(Request $request, $user) {
        if ($user->hasAnyRole(['SUP']) ) {
            return redirect()->route('admin.index');
        }
        return redirect('/');
    }

    protected function redirectTo() {
        return '/';
    }

    public function __construct() {
        $this->middleware('guest')->except('logout');
    }
}
