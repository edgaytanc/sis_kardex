@extends('layouts.app')

@section('content')
<div class="container">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">
                <a href="{{ route('salidas.index') }}" class="mr-4"
                    ><i class="icon ion-md-arrow-back"></i
                ></a>
                @lang('crud.salidas.show_title')
            </h4>

            <div class="mt-4">
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.entrada_id')</h5>
                    <span>{{ optional($salida->entrada)->fecha ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.nombre_producto')</h5>
                    <span>{{ $salida->nombre_producto ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.fecha')</h5>
                    <span>{{ $salida->fecha ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.numero_referencia')</h5>
                    <span>{{ $salida->numero_referencia ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.destinatario_id')</h5>
                    <span
                        >{{ optional($salida->destinatario)->nombre ?? '-'
                        }}</span
                    >
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.fecha_vencimiento')</h5>
                    <span>{{ $salida->fecha_vencimiento ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.lote_salida')</h5>
                    <span>{{ $salida->lote_salida ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.cantidad_salida')</h5>
                    <span>{{ $salida->cantidad_salida ?? '-' }}</span>
                </div>
                <div class="mb-4">
                    <h5>@lang('crud.salidas.inputs.reajuste_negativo')</h5>
                    <span>{{ $salida->reajuste_negativo ?? '-' }}</span>
                </div>
            </div>

            <div class="mt-4">
                <a href="{{ route('salidas.index') }}" class="btn btn-light">
                    <i class="icon ion-md-return-left"></i>
                    @lang('crud.common.back')
                </a>

                @can('create', App\Models\Salida::class)
                <a href="{{ route('salidas.create') }}" class="btn btn-light">
                    <i class="icon ion-md-add"></i> @lang('crud.common.create')
                </a>
                @endcan
            </div>
        </div>
    </div>
</div>
@endsection
