@extends('layouts.mainView')
@section('content')
<main>
	<section class="gray-bar">
		<div class="container">
			 <mian-component :sdata="{{ $users }}"></mian-component>
		</div>
	</section>
</main>
@stop
