{{-- resources/views/app/exports/users.blade.php --}}

@extends('layouts.app')
@section('content')
<div class="container">
    <a class=" btn btn-primary" href="{{ route('export.destinatarios')}}">Exportar destinatarios</a>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Id_Usuario</th>
        </tr>

        @foreach ($destinatarios as $destinatario)

        <tr>
            <td>{{ $destinatario->id}}</td>
            <td>{{ $destinatario->nombre}}</td>
            <td>{{ $destinatario->id_user}}</td>
        </tr>

        @endforeach
    </table>

    {{ $users->links() }}
</div>
@endsection
