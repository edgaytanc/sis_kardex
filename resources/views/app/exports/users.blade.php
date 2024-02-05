{{-- resources/views/app/exports/users.blade.php --}}

@extends('layouts.app')
@section('content')
<div class="container">
    <div class="card">
        <div class="card-header">
            <h3>Exportación de Datos</h3>
        </div>
        <div class="card-body">
            <p class ="card-text"><b>Instrucciones: </b>Aquí puedes exportar los datos de las tablas específicas o realizar una exportación completa
            en un solo archivo. Selecciona la tabla que deseas exportar o elige la opción de exportación completa
            para obtener un archivo con todos los datos relevantes.</p>
            <div class="row align-items-center justify-content-around py-3">
                <div class="col-auto">
                    <a class="btn btn-primary " href="{{ route('export.users') }}">Exportar Usuarios</a>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary " href="{{ route('export.destinatarios') }}">Exportar Destinatarios</a>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary " href="{{ route('export.remitentes') }}">Exportar Remitentes</a>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary " href="{{ route('export.entradas') }}">Exportar Entradas</a>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary " href="{{ route('export.salidas') }}">Exportar Salidas</a>
                </div>
                <div class="col-auto">
                    <a class="btn btn-danger " href="{{ route('export.all') }}">Exportar Todo</a>
                </div>
            </div>
        </div>
    </div>
    <div class="row align-items-center justify-content-around py-3">


    </div>

    <div class="card">
        <div class="card-header">
            <h3>Importación de Datos</h3>
        </div>
        <div class="card-body">
            <p class="card-title"><b>Instrucciones: </b>Desde aquí puedes importar datos a tablas específicas o
            realizar una importación completa desde un solo archivo. Elige la tabla a la cual deseas importar datos o selecciona la opción de <em>Archivo
            Completo</em> para actualizar múltiples tablas a partir de un archivo único."</p>
        </div>
    </div>

    <div class="row align-items-center justify-content-around py-3">

    </div>

    <div class="container">
    <!-- Fila 1 -->
    <div class="row py-3">
        <!-- Columna 1 - Usuarios -->



        <div class="col-md-6">

            <div class="card">
                <div class="card-header">
                    <label for="file">Archivo CVS de Usuarios:</label>
                </div>
                <div class="card-body">
                    <form action="{{ route('users.import') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            {{-- <label for="file">Archivo CVS de Usuarios:</label> --}}
                            <input type="file" name="file" class="form-control-file" required>
                        </div>
                        <button type="submit" class="btn btn-primary ">Importar Usuarios</button>
                    </form>
                </div>
            </div>

        </div>
        <!-- Columna 2 - Entradas -->
        <div class="col-md-6">

            <div class="card">
                <div class="card-header">
                    <label for="file">Archivo CVS de Entradas:</label>
                </div>
                <div class="card-body">
                    <form action="{{ route('entradas.import') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            {{-- <label for="file">Archivo CVS de Usuarios:</label> --}}
                            <input type="file" name="file" class="form-control-file" required>
                        </div>
                        <button type="submit" class="btn btn-primary ">Importar Entradas</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
    <!-- Fila 2 -->
    <div class="row py-3">
        <!-- Columna 1 - Salidas -->
        <div class="col-md-6">


            <div class="card">
                <div class="card-header">
                    <label for="file">Archivo CVS de Salidas:</label>
                </div>
                <div class="card-body">
                    <form action="{{ route('salidas.import') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            {{-- <label for="file">Archivo CVS de Usuarios:</label> --}}
                            <input type="file" name="file" class="form-control-file" required>
                        </div>
                        <button type="submit" class="btn btn-primary ">Importar Salidas</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Columna 2 - Destinatarios -->
        <div class="col-md-6">


            <div class="card">
                <div class="card-header">
                    <label for="file">Archivo CVS de Destinatarios:</label>
                </div>
                <div class="card-body">
                    <form action="{{ route('destinatarios.import') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            {{-- <label for="file">Archivo CVS de Usuarios:</label> --}}
                            <input type="file" name="file" class="form-control-file" required>
                        </div>
                        <button type="submit" class="btn btn-primary ">Importar Destinatarios</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Fila 3 -->
    <div class="row py-3">
        <!-- Columna 1 - Remitentes -->
        <div class="col-md-6">

            <div class="card">
                <div class="card-header">
                    <label for="file">Archivo CVS de Remitentes:</label>
                </div>
                <div class="card-body">
                    <form action="{{ route('remitentes.import') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            {{-- <label for="file">Archivo CVS de Usuarios:</label> --}}
                            <input type="file" name="file" class="form-control-file" required>
                        </div>
                        <button type="submit" class="btn btn-primary ">Importar Remitentes</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- Columna 2 - Vacía para mantener la simetría -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <label for="file">Archivo Completo:</label>
                </div>
                <div class="card-body">
                    <form action="{{ route('importar') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group">
                            {{-- <label for="file">Archivo CVS de Usuarios:</label> --}}
                            <input type="file" name="file" class="form-control-file" required>
                        </div>
                        <button type="submit" class="btn btn-danger ">Importar todo</button>
                    </form>
                </div>
            </div>
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
