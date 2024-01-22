@extends('layouts.app')

@section('content')
<div class="container">
    <div class="searchbar mt-0 mb-4">
        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="input-group">
                        <input
                            id="indexSearch"
                            type="text"
                            name="search"
                            placeholder="{{ __('crud.common.search') }}"
                            value="{{ $search ?? '' }}"
                            class="form-control"
                            autocomplete="off"
                        />
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-primary">
                                <i class="icon ion-md-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-6 text-right">
                @can('create', App\Models\Salida::class)
                <a href="{{ route('salidas.create') }}" class="btn btn-primary">
                    <i class="icon ion-md-add"></i> @lang('crud.common.create')
                </a>
                @endcan
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div style="display: flex; justify-content: space-between;">
                <h4 class="card-title">@lang('crud.salidas.index_title')</h4>
            </div>

            <div class="table-responsive">
                <table class="table table-borderless table-hover">
                    <thead>
                        <tr>
                            <th class="text-left">
                                @lang('crud.salidas.inputs.entrada_id')
                            </th>
                            <th class="text-left">
                                @lang('crud.salidas.inputs.nombre_producto')
                            </th>
                            <th class="text-left">
                                @lang('crud.salidas.inputs.fecha')
                            </th>
                            <th class="text-left">
                                @lang('crud.salidas.inputs.numero_referencia')
                            </th>
                            <th class="text-left">
                                @lang('crud.salidas.inputs.destinatario_id')
                            </th>
                            <th class="text-left">
                                @lang('crud.salidas.inputs.fecha_vencimiento')
                            </th>
                            <th class="text-left">
                                @lang('crud.salidas.inputs.lote_salida')
                            </th>
                            <th class="text-right">
                                @lang('crud.salidas.inputs.cantidad_salida')
                            </th>
                            <th class="text-right">
                                @lang('crud.salidas.inputs.reajuste_negativo')
                            </th>
                            <th class="text-center">
                                @lang('crud.common.actions')
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($salidas as $salida)
                        <tr>
                            <td>
                                {{ optional($salida->entrada)->fecha ?? '-' }}
                            </td>
                            <td>{{ $salida->nombre_producto ?? '-' }}</td>
                            <td>{{ $salida->fecha ?? '-' }}</td>
                            <td>{{ $salida->numero_referencia ?? '-' }}</td>
                            <td>
                                {{ optional($salida->destinatario)->nombre ??
                                '-' }}
                            </td>
                            <td>{{ $salida->fecha_vencimiento ?? '-' }}</td>
                            <td>{{ $salida->lote_salida ?? '-' }}</td>
                            <td>{{ $salida->cantidad_salida ?? '-' }}</td>
                            <td>{{ $salida->reajuste_negativo ?? '-' }}</td>
                            <td class="text-center" style="width: 134px;">
                                <div
                                    role="group"
                                    aria-label="Row Actions"
                                    class="btn-group"
                                >
                                    @can('update', $salida)
                                    <a
                                        href="{{ route('salidas.edit', $salida) }}"
                                    >
                                        <button
                                            type="button"
                                            class="btn btn-light"
                                        >
                                            <i class="icon ion-md-create"></i>
                                        </button>
                                    </a>
                                    @endcan @can('view', $salida)
                                    <a
                                        href="{{ route('salidas.show', $salida) }}"
                                    >
                                        <button
                                            type="button"
                                            class="btn btn-light"
                                        >
                                            <i class="icon ion-md-eye"></i>
                                        </button>
                                    </a>
                                    @endcan @can('delete', $salida)
                                    <form
                                        action="{{ route('salidas.destroy', $salida) }}"
                                        method="POST"
                                        onsubmit="return confirm('{{ __('crud.common.are_you_sure') }}')"
                                    >
                                        @csrf @method('DELETE')
                                        <button
                                            type="submit"
                                            class="btn btn-light text-danger"
                                        >
                                            <i class="icon ion-md-trash"></i>
                                        </button>
                                    </form>
                                    @endcan
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
                    <tfoot>
                        <tr>
                            <td colspan="10">{!! $salidas->render() !!}</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection
