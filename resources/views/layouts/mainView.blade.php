<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ config('app.name') }}</title>
        <link href="{{ asset(mix('public/dist/css/app.css')) }}" rel="stylesheet">
        <link href="{{ asset(mix('public/dist/css/style.css')) }}" rel="stylesheet">
        {{-- <script src="https://kit.fontawesome.com/f84026e448.js" crossorigin="anonymous"></script> --}}
       {{--  <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet"> --}}
        <script>
          @auth
            window.Permissions = {!! json_encode(Auth::user()->allPermissions, true) !!};
          @else
            window.Permissions = [];
          @endauth
        </script>
</head>
<body>
    <div id="app">
        <div id="main">
            {{-- navbar Common --}}
            <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                <div class="container">
                    <a class="navbar-brand" href="{{ url('/') }}">
                        {{ config('app.name', 'Laravel') }}
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Left Side Of Navbar -->
                        <ul class="navbar-nav mr-auto">
                            @auth
                                <li class="nav-item active">
                                    <a class="nav-link" href="{{ url('/') }}">Students <span class="sr-only">(current)</span></a>
                                </li>
                                @can('role_and_permissions')
                                <li class="nav-item active">
                                    <a class="nav-link" href="{{ url('/roles_and_permissions') }}">Roles And Permissions <span class="sr-only"></span></a>
                                </li>
                                @endcan
                                @can('testing')
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ url('/test') }}">Testing <span class="sr-only">(current)</span></a>
                                </li>
                                @endcan
                            @endauth
                        </ul>

                        <!-- Right Side Of Navbar -->
                        <ul class="navbar-nav ml-auto">
                            <!-- Authentication Links -->
                            @guest
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                                </li>
                                @if (Route::has('register'))
                                    <li class="nav-item">
                                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                    </li>
                                @endif
                            @else
                                <li class="nav-item dropdown">
                                    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                        {{ Auth::user()->name }} ({{ Auth::user()->roleName }}) <span class="caret"></span>
                                    </a>

                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="{{ route('logout') }}"
                                           onclick="event.preventDefault();
                                                         document.getElementById('logout-form').submit();">
                                            {{ __('Logout') }}
                                        </a>

                                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                            @csrf
                                        </form>
                                    </div>
                                </li>
                            @endguest
                        </ul>
                    </div>
                </div>
            </nav>
            @yield('content')
        </div>
    </div>
</body>

{{-- Laravel Mix Files --}}
<script src="{{ asset(mix('public/dist/js/vendor.js')) }}"></script>
<script src="{{ asset(mix('public/dist/js/app.js')) }}"></script>

</html>
</html>
