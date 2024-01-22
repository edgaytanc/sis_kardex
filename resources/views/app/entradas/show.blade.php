@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">
                <a href="{{ route('entradas.index') }}" class="mr-4"
                    ><i class="icon ion-md-arrow-back"></i
                ></a>
                @lang('crud.entradas.show_title')
            </h4>

            <div class="mt-4">
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.producto_id')</h5>
                    <span
                        >{{ optional($entrada->producto)->nombre ?? '-' }}</span
                    >
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.fecha')</h5>
                    <span>{{ $entrada->fecha ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.numero_referencia')</h5>
                    <span>{{ $entrada->numero_referencia ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.cantidad')</h5>
                    <span>{{ $entrada->cantidad ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.precio_unitario')</h5>
                    <span>{{ $entrada->precio_unitario ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.fecha_vencimiento')</h5>
                    <span>{{ $entrada->fecha_vencimiento ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.remitente_id')</h5>
                    <span
                        >{{ optional($entrada->remitente)->nombre ?? '-'
                        }}</span
                    >
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.numero_lote')</h5>
                    <span>{{ $entrada->numero_lote ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.entradas.inputs.reajuste_positivo')</h5>
                    <span>{{ $entrada->reajuste_positivo ?? '-' }}</span>
                </div>
            </div>

            <div class="mt-4">
                <a href="{{ route('entradas.index') }}" class="btn btn-light">
                    <i class="icon ion-md-return-left"></i>
                    @lang('crud.common.back')
                </a>

                @can('create', App\Models\Entrada::class)
                <a href="{{ route('entradas.create') }}" class="btn btn-light">
                    <i class="icon ion-md-add"></i> @lang('crud.common.create')
                </a>
                @endcan
            </div>
        </div>
    </div>
</div>
@endsection
