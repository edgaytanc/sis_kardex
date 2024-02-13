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
                @can('create', App\Models\Entrada::class)
                <a
                    href="{{ route('entradas.create') }}"
                    class="btn btn-primary"
                >
                    <i class="icon ion-md-add"></i> @lang('crud.common.create')
                </a>
                @endcan
            </div>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <div style="display: flex; justify-content: space-between;">
                <h4 class="card-title">@lang('crud.entradas.index_title')</h4>
            </div>

            <div class="table-responsive">
                <table class="table table-borderless table-hover">
                    <thead>
                        <tr>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.producto_id')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.fecha')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.numero_referencia')
                            </th>
                            <th class="text-right">
                                @lang('crud.entradas.inputs.cantidad')
                            </th>
                            <th class="text-right">
                                @lang('crud.entradas.inputs.precio_unitario')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.fecha_vencimiento')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.remitente_id')
                            </th>
                            <th class="text-left">
                                @lang('crud.entradas.inputs.numero_lote')
                            </th>
                            <th class="text-right">
                                @lang('crud.entradas.inputs.reajuste_positivo')
                            </th>
                            <th class="text-center">
                                @lang('crud.common.actions')
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($entradas as $entrada)
                        <tr>
                            <td>
                                {{ optional($entrada->producto)->nombre ?? '-'
                                }}
                            </td>
                            <td>{{ $entrada->fecha ?? '-' }}</td>
                            <td>{{ $entrada->numero_referencia ?? '-' }}</td>
                            <td>{{ $entrada->cantidad ?? '-' }}</td>
                            <td>{{ $entrada->precio_unitario ?? '-' }}</td>
                            <td>{{ $entrada->fecha_vencimiento ?? '-' }}</td>
                            <td>
                                {{ optional($entrada->remitente)->nombre ?? '-'
                                }}
                            </td>
                            <td>{{ $entrada->numero_lote ?? '-' }}</td>
                            <td>{{ $entrada->reajuste_positivo ?? '-' }}</td>
                            <td class="text-center" style="width: 134px;">
                                <div
                                    role="group"
                                    aria-label="Row Actions"
                                    class="btn-group"
                                >
                                    @can('update', $entrada)
                                    <a
                                        href="{{ route('entradas.edit', $entrada) }}"
                                    >
                                        <button
                                            type="button"
                                            class="btn btn-light"
                                        >
                                            <i class="icon ion-md-create"></i>
                                        </button>
                                    </a>
                                    @endcan @can('view', $entrada)
                                    <a
                                        href="{{ route('entradas.show', $entrada) }}"
                                    >
                                        <button
                                            type="button"
                                            class="btn btn-light"
                                        >
                                            <i class="icon ion-md-eye"></i>
                                        </button>
                                    </a>
                                    @endcan @can('delete', $entrada)
                                    <form
                                        action="{{ route('entradas.destroy', $entrada) }}"
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
                            <td colspan="10">{!! $entradas->render() !!}</td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal para mensajes de error -->
<div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="errorModalLabel">Error</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Mensaje de error se llenará dinámicamente -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<script>
  @if(session('error'))
    $('#errorModal').find('.modal-body').text('{{ session("error") }}');
    $('#errorModal').modal('show');
  @endif
</script>
@endsection
