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
            <input type="text" id="searchProducto" class="form-control" placeholder="Buscar producto">
            <select name="producto_id" id="producto_id" class="form-control">
                @foreach($productos as $producto)
                    <option value="{{ $producto->id }}" data-search="{{ strtolower($producto->nombre) }}">{{ $producto->id }} - {{ $producto->nombre }}</option>
                @endforeach
            </select>
        </div>
        <!-- Campo oculto para userId -->
        <input type="hidden" name="user_id" value="{{ $userId }}">
        <button type="submit" class="btn btn-primary">Generar</button>
    </form>
</div>

<script>
    // Agregar evento de input al campo de búsqueda
    document.getElementById('searchProducto').addEventListener('input', function(event) {
        var searchValue = this.value.toLowerCase();
        var options = document.getElementById('producto_id').options;

        for (var i = 0; i < options.length; i++) {
            var dataSearch = options[i].getAttribute('data-search').toLowerCase();
            var contains = dataSearch.includes(searchValue);
            options[i].style.display = contains ? 'block' : 'none';
        }
    });

    // Deshabilitar el envío del formulario al presionar Enter en el campo de búsqueda
    document.getElementById('searchProducto').addEventListener('keydown', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
        }
    });
</script>

@endsection