@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">
                <a href="{{ route('productos.index') }}" class="mr-4"
                    ><i class="icon ion-md-arrow-back"></i
                ></a>
                @lang('crud.productos.show_title')
            </h4>

            <div class="mt-4">
                <div class="mb-4">
                    <h5>@lang('crud.productos.inputs.categoria')</h5>
                    <span>{{ $producto->categoria ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.productos.inputs.nombre')</h5>
                    <span>{{ $producto->nombre ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.productos.inputs.presentacion')</h5>
                    <span>{{ $producto->presentacion ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.productos.inputs.concentracion')</h5>
                    <span>{{ $producto->concentracion ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.productos.inputs.envase')</h5>
                    <span>{{ $producto->envase ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.productos.inputs.unidad_medida')</h5>
                    <span>{{ $producto->unidad_medida ?? '-' }}</span>
                </div>
            </div>

            <div class="mt-4">
                <a href="{{ route('productos.index') }}" class="btn btn-light">
                    <i class="icon ion-md-return-left"></i>
                    @lang('crud.common.back')
                </a>

                @can('create', App\Models\Producto::class)
                <a href="{{ route('productos.create') }}" class="btn btn-light">
                    <i class="icon ion-md-add"></i> @lang('crud.common.create')
                </a>
                @endcan
            </div>
        </div>
    </div>
</div>
@endsection
