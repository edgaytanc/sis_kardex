{{-- resources/views/app/exports/users.blade.php --}}

@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row">
        <h3>Exportaciones a Excel</h3>
    </div>
    <div class="row">
        <div class="col-sm">
            <div class="row py-3">
                <a class=" btn btn-primary" href="{{ route('export.users')}}">Exportar Usuarios</a>
            </div>
            <div class="row py-3">
                <a class=" btn btn-primary" href="{{ route('export.destinatarios')}}">Exportar Destinatarios</a>
            </div>
        </div>
        <div class="col-sm">
            <div class="row py-3">
                <a class=" btn btn-primary" href="{{ route('export.remitentes')}}">Exportar Remitentes</a>
            </div>
            <div class="row py-3">
                <a class=" btn btn-primary" href="{{ route('export.entradas')}}">Exportar Entradas</a>
            </div>
        </div>
        <div class="col-sm">
            <div class="row p-3">
                <a class=" btn btn-primary" href="{{ route('export.salidas')}}">Exportar Salidas</a>
            </div>
        </div>
    </div>




    {{-- <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Contrana</th>
            <th>Localidad</th>
        </tr>

        @foreach ($users as $user)

        <tr>
            <td>{{ $user->id}}</td>
            <td>{{ $user->name}}</td>
            <td>{{ $user->email}}</td>
            <td>{{ $user->password}}</td>
            <td>{{ $user->localidad}}</td>
        </tr>

        @endforeach
    </table>

    {{ $users->links() }} --}}
</div>
@endsection
