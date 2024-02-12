@extends('layouts.app')

@section('content')
<div class="container">
    <div>
        <h3>DIRECCION DEPARTAMENTAL <BR>
            DIRECCION DE AREA DE SALUD DE TOTONICAPAN <BR>
            REGISTRO DE INVENTARIO FISICO GENERAL<BR></h3>
    </div>

    <!-- Agregar al principio de tu archivo reporteKardex.blade.php -->
    <form action="{{ url('/consolidado-kardex/filtrar') }}" method="POST" class="form-inline">
        @csrf <!-- Seguridad para formularios en Laravel -->
        <div class="form-group mb-2 py-3">
            <label for="fechaKardex" class="pr-3">Fecha Kardex:</label>
            <input type="date" class="form-control pr-3" id="fechaKardex" name="fechaKardex" required>
        </div>
        <!-- Dentro del formulario en reporteConsolidado.blade.php -->
        <div class="form-group mb-2 py-3">
            <label for="categoria" class="pr-3">Categoría:</label>
            <select class="form-control pr-3" id="categoria" name="categoria" required>
                <option value="">Selecciona una categoría</option>
                @foreach($categorias as $categoria)
                    <option value="{{ $categoria->Categoria }}" {{ old('categoria') == $categoria->Categoria ? 'selected' : '' }}>{{ $categoria->Categoria }}</option>
                @endforeach
            </select>
        </div>

        <button type="submit" class="btn btn-primary mb-2 pl-3">Filtrar</button>
    </form>


    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>No.</th>
                <th>Medicamento/Insumos</th>
                <th>Conteo Fisico</th>
                <th>Fecha Vencimiento</th>
                <th>Lote</th>
                <th>Fecha Kardex</th>
                <th>Saldo</th>
            </tr>
        </thead>
        <tbody>
            @foreach($datos as $dato)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $dato->Medicamento }}</td>
                    <td></td>
                    <td>{{ $dato->FechaVencimiento }}</td>
                    <td>{{ $dato->Lote }}</td>
                    <td>{{ $dato->FechaKardex }}</td>
                    <td>{{ $dato->Saldo }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <form action="{{ url('/consolidado-kardex/pdf') }}" method="POST" class="d-inline">
        @csrf
        <input type="hidden" name="fechaKardex" value="{{ isset($fechaKardex) ? $fechaKardex : '' }}">
        <input type="hidden" name="categoria" value="{{ isset($categoria) ? $categoria['Categoria'] : '' }}">
        <button type="submit" class="btn btn-success mb-2">Generar PDF</button>
    </form>

</div>



@endsection
