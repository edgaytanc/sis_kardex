@extends('layouts.app')

@section('content')
<div class="container">
    <div class="searchbar mt-0 mb-4">
        <div class="row">
            <div class="col-md-6">
                <form method="GET">
                    <div class="input-group">
                        <input id="createSearch" type="text" name="search" placeholder="{{ __('crud.common.search') }}" value="{{ $search ?? '' }}" class="form-control" autocomplete="off" />
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary">
                                <i class="icon ion-md-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <div class="card">
        <div class="card-header"><h4>Datos de Entrada</h4></div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-borderless table-hover">
                    <thead>
                        <tr>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.producto_id')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.cantidad')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.fecha_vencimiento')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.numero_lote')
                            </th>
                            <th class="text-center">
                                @lang('crud.common.actions')
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($entradas as $entrada)
                        <tr>
                            <td>{{ optional($entrada->producto)->nombre ?? '-' }}</td>
                            <td>{{ $entrada->cantidad ?? '-' }}</td>
                            <td>{{ $entrada->fecha_vencimiento->format('d-m-Y') ?? '-' }}</td>
                            <td>{{ $entrada->numero_lote ?? '-' }}</td>
                            <td class="text-center" style="width: 134px;">
                                <div role="group" aria-label="Row Actions" class="btn-group">
                                    <button type="button" class="btn btn-success" onclick="selectProduct('{{ $entrada->id }}', '{{ $entrada->producto->nombre }}', '{{ $entrada->numero_lote }}', '{{ $entrada->fecha_vencimiento->format('d-m-Y') }}')">
                                        <i class="icon ion-md-checkmark"></i> Seleccionar
                                    </button>
                                </div>
                            </td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="10">
                                @lang('crud.common.no_items_found')
                            </td>
                        </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
                
    <!-- Formulario oculto para almacenar la información del producto seleccionado -->
    <form id="selectedProductForm" method="POST" action="{{ route('salidas.store') }}" style="display: none;">
        @csrf
        <input type="hidden" name="selected_producto_id" id="selected_producto_id">
        <input type="hidden" name="nombre_producto" id="nombre_producto">
        <input type="hidden" name="lote_salida" id="numero_lote">
        <input type="hidden" name="fecha_vencimiento" id="fecha_vencimiento">
        <!-- Agrega otros campos que desees autocompletar -->

        
    </form>

    <div class="card">
        <div class="card-body">
            <h4 class="card-title">
                <a href="{{ route('salidas.index') }}" class="mr-4"><i class="icon ion-md-arrow-back"></i></a>
                @lang('crud.salidas.create_title')
            </h4>

            <x-form method="POST" action="{{ route('salidas.store') }}" class="mt-4">
                @include('app.salidas.form-inputs')
                


                <div class="mt-4">
                    <a href="{{ route('salidas.index') }}" class="btn btn-light">
                        <i class="icon ion-md-return-left text-primary"></i>
                        @lang('crud.common.back')
                    </a>

                    <button type="submit" class="btn btn-primary float-right">
                        <i class="icon ion-md-save"></i>
                        @lang('crud.common.create')
                    </button>

                    
                </div>
            </x-form>
        </div>
    </div>
</div>

<!-- Script JavaScript para manejar la selección del producto -->

<!-- Script JavaScript para manejar la selección del producto -->
<script>
    function selectProduct(id, nombre, lote, fechaVencimiento) {
        document.getElementById('selected_producto_id').value = id;
        document.getElementById('nombre_producto').value = nombre;
        document.getElementById('numero_lote').value = lote;

        // Convierte la fecha de vencimiento al formato "Y-m-d" para el input de tipo date
        var formattedFechaVencimiento = formatDate(fechaVencimiento);
        document.getElementById('fecha_vencimiento').value = formattedFechaVencimiento;

        // Envía el formulario automáticamente al seleccionar el producto
        document.getElementById('selectedProductForm').submit();
    }

    // Función para formatear la fecha al formato "Y-m-d"
    function formatDate(dateString) {
        // Se espera que dateString esté en el formato "dd-mm-YYYY"
        var dateParts = dateString.split("-");
        // Asegúrate de que el año, mes y día estén en el orden correcto
        return dateParts[2] + "-" + dateParts[1] + "-" + dateParts[0];
    }
</script>


@endsection
