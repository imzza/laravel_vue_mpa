@extends('layouts.mainView')
@section('content')
<main>
    <section class="gray-bar">
        <div class="container">
            {{-- <mian-component :sdata="{{ $users }}"></mian-component> --}}
             <div class="content">
                <div class="title m-b-md">
                    <h1>Dashboard Here</h1>
                        <a href="{url('/')}">Go to Crud App</a>
                </div>
            </div>
        </div>
    </section>
</main>
@stop



