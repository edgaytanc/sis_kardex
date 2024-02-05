{{-- resources/views/app/consultas/seleccionar_producto.blade.php --}}
@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card">
        <div class="card-header">
            <h3>Informe por Producto</h3>
        </div>
        <div class ="card-body">
            <p class="card-text"><b>Instrucciones: </b>Seleccione un producto del listado, luego de clic en el botón <em>Generar</em> para mostrar en pantalla el reporte.</p>
        </div>
    </div>
    <form action="{{ route('mostrar_datos') }}" method="POST">
        @csrf
        <div class="form-group">
            <label for="producto_id">Seleccione un Producto:</label>
            <select name="producto_id" id="producto_id" class="form-control">
                @foreach($productos as $producto)
                    <option value="{{ $producto->id }}">{{ $producto->id }} - {{ $producto->nombre }}</option>
                @endforeach
            </select>
        </div>
        <!-- Campo oculto para userId -->
        <input type="hidden" name="user_id" value="{{ $userId }}">
        <button type="submit" class="btn btn-primary">Generar</button>
    </form>
</div>
@endsection
