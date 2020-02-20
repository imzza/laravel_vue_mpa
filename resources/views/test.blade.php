@extends('layouts.mainView')
@section('content')
<main>
    <section class="gray-bar">
        <div class="container">

             <div class="content">
                <div class="title m-b-md">
                    {{-- :sdata="{{ $users }}" --}}
                    <test-component ></test-component>
                </div>
            </div>
        </div>
    </section>
</main>
@stop

