<?php

namespace App\Http\Controllers;

use App\Models\Salida;
use App\Models\Producto;
use App\Models\Entrada;
use Illuminate\View\View;
use Illuminate\Http\Request;
use App\Models\Destinatario;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\SalidaStoreRequest;
use App\Http\Requests\SalidaUpdateRequest;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class SalidaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $this->authorize('view-any', Salida::class);

        $search = $request->get('search', '');

        if (empty($search)) {
            $salidas = Salida::query();
        } else {
            $salidas = Salida::search($search);
        }

        $salidas = $salidas->latest()
            ->paginate(5)
            ->withQueryString();

        return view('app.salidas.index', compact('salidas', 'search'));
    }

    /**
     * Show the form for creating a new resource.
     */

     
    public function create(Request $request): View
    {
        $this->authorize('create', Salida::class);
    
        $search = $request->input('search');
    
        $entradas = Entrada::where(function ($query) use ($search) {
            $query->where('producto_id', 'like', '%' . $search . '%')
                ->orWhere('fecha_vencimiento', 'like', '%' . $search . '%')
                ->orWhere('numero_lote', 'like', '%' . $search . '%');
    
            // Agrega la búsqueda por nombre de producto
            $query->orWhereHas('producto', function ($subquery) use ($search) {
                $subquery->where('nombre', 'like', '%' . $search . '%');
            });
        })->get();
    
        $destinatarios = Destinatario::pluck('nombre', 'id');
    
        return view('app.salidas.create', compact('entradas', 'destinatarios'));
    }
    

    /**
     * Store a newly created resource in storage.
     */
    public function store(SalidaStoreRequest $request): RedirectResponse
    {
        try {
            // Utiliza el objeto Validator para validar los datos
            $validator = Validator::make($request->all(), [
                'nombre_producto' => 'required|string',
                'fecha' => 'required|date',
                'numero_referencia' => 'required|string',
                'destinatario_id' => 'required|integer',
                'fecha_vencimiento' => 'required|date',
                'lote_salida' => 'nullable|string',
                'cantidad_salida' => 'nullable|integer',
                'reajuste_negativo' => 'nullable|integer', // Cambiado a 'integer' para que acepte números negativos
            ]);

            // Si la validación falla, redirige de nuevo al formulario con los errores
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }

            // Obtén la información del producto seleccionado desde el formulario oculto
            $selectedProductoId = $request->input('selected_producto_id');
            $selectedProductoNombre = $request->input('nombre_producto');
            $selectedNumeroLote = $request->input('lote_salida');
            $selectedFechaVencimiento = $request->input('fecha_vencimiento');

            // Obtén la cantidad disponible en el lote seleccionado
            $cantidadDisponible = Entrada::where('numero_lote', $selectedNumeroLote)->sum('cantidad');

            // Valida que la cantidad de salida no supere la cantidad disponible
            $validator->after(function ($validator) use ($cantidadDisponible) {
                if ($validator->validated()['cantidad_salida'] > $cantidadDisponible) {
                    $validator->errors()->add('cantidad_salida', 'La cantidad de salida no puede ser mayor que la cantidad disponible en el lote.');
                }
            });

            // Valida que el reajuste_negativo no haga que la cantidad disponible sea negativa
            $validator->after(function ($validator) use ($cantidadDisponible) {
                $reajusteNegativo = $validator->validated()['reajuste_negativo'] ?? 0;
                if ($reajusteNegativo > $cantidadDisponible) {
                    $validator->errors()->add('reajuste_negativo', 'El reajuste negativo no puede hacer que la cantidad disponible sea negativa.');
                }
            });

            // Si la validación falla, redirige de nuevo al formulario con los errores
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }

            // Resta la cantidad de salida de la cantidad disponible
            $cantidadDisponible -= $request->input('cantidad_salida');

            // Resta el reajuste_negativo de la cantidad disponible
            $cantidadDisponible -= $request->input('reajuste_negativo');

            // Actualiza la cantidad disponible en el lote
            Entrada::where('numero_lote', $selectedNumeroLote)->update(['cantidad' => $cantidadDisponible]);

            // Intenta crear la salida utilizando los datos del formulario y del producto seleccionado
            $salida = new Salida([
                'producto_id' => $selectedProductoId,
                'nombre_producto' => $selectedProductoNombre,
                'lote_salida' => $selectedNumeroLote,
                'fecha_vencimiento' => $selectedFechaVencimiento,
                'fecha' => $validator->validated()['fecha'],
                'numero_referencia' => $request->input('numero_referencia'),
                'destinatario_id' => $request->input('destinatario_id'),
                'cantidad_salida' => $request->input('cantidad_salida'),
                'reajuste_negativo' => $request->input('reajuste_negativo'),
            ]);

            $salida->save();

            // Si llegas a este punto, la salida se creó correctamente
            return redirect()
                ->route('salidas.edit', $salida)
                ->withSuccess(__('crud.common.created'));
        } catch (\Exception $e) {
            // Maneja cualquier excepción que pueda ocurrir durante la creación
            dd('Excepción: ' . $e->getMessage());
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, Salida $salida): View
    {
        $this->authorize('view', $salida);

        return view('app.salidas.show', compact('salida'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Salida $salida): View
    {
        $this->authorize('update', $salida);

        $entradasSelect = Entrada::pluck('fecha', 'id');
        $destinatarios = Destinatario::pluck('nombre', 'id');

        return view(
            'app.salidas.edit',
            compact('salida', 'entradasSelect', 'destinatarios')
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(
        SalidaUpdateRequest $request,
        Salida $salida
    ): RedirectResponse {
        $this->authorize('update', $salida);

        $validated = $request->validated();

        $salida->update($validated);

        return redirect()
            ->route('salidas.edit', $salida)
            ->withSuccess(__('crud.common.saved'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, Salida $salida): RedirectResponse
    {
        $this->authorize('delete', $salida);

        $salida->delete();

        return redirect()
            ->route('salidas.index')
            ->withSuccess(__('crud.common.removed'));
    }
}