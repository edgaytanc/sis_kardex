{{-- resources/views/app/consultas/seleccionar_producto.blade.php --}}
@extends('layouts.app')

@section('content')
<div class="container">
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
        <button type="submit" class="btn btn-primary">Enviar</button>
    </form>
</div>
@endsection
