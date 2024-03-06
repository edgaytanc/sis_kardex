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
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;




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

         $entradas = Entrada::where('cantidad_actual', '>', 0)
                             ->where(function ($query) use ($search) {
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
            // Validación de los datos, incluyendo 'entrada_id'
                $validator = Validator::make($request->all(), [
                    'entrada_id' => 'integer',
                    'nombre_producto' => 'required|string',
                    'fecha' => 'required|date',
                    'numero_referencia' => 'required|string',
                    'destinatario' => 'required|string',
                    'fecha_vencimiento' => 'nullable|date',
                    'lote_salida' => 'nullable|string',
                    'cantidad_salida' => 'nullable|integer',
                    'reajuste_negativo' => 'nullable|integer',
                    'observaciones' => 'nullable|string',
                ]);

                if ($validator->fails()) {
                    return redirect()->back()->withErrors($validator)->withInput();
                }

                // Obtener datos del formulario
                $entradaId = $request->input('entrada_id');
                $selectedProductoId = $request->input('selected_producto_id');
                $selectedProductoNombre = $request->input('nombre_producto');
                $selectedNumeroLote = $request->input('lote_salida');
                $selectedFechaVencimiento = $request->input('fecha_vencimiento');
                $entradaId = $request->input('entrada_id');
                $userId = Auth::id();

                // $cantidadDisponible = Entrada::where('numero_lote', $selectedNumeroLote)->sum('cantidad_actual');
                $cantidadDisponible = Entrada::where('numero_lote', $selectedNumeroLote)
                            ->where('id', $entradaId)
                            ->sum('cantidad_actual');

                $precioUnitario = DB::table('entradas')
                ->where('cantidad_actual', '>', 0)
                ->whereNotNull('precio_unitario')
                ->orderByDesc('fecha')
                ->value('precio_unitario');

                // Validaciones adicionales
                $validator->after(function ($validator) use ($cantidadDisponible) {
                    if ($validator->validated()['cantidad_salida'] > $cantidadDisponible) {
                        $validator->errors()->add('cantidad_salida', 'La cantidad de salida no puede ser mayor que la cantidad disponible en el lote.');
                    }
                });

                $validator->after(function ($validator) use ($cantidadDisponible) {
                    $reajusteNegativo = $validator->validated()['reajuste_negativo'] ?? 0;
                    if ($reajusteNegativo > $cantidadDisponible) {
                        $validator->errors()->add('reajuste_negativo', 'El reajuste negativo no puede hacer que la cantidad disponible sea negativa.');
                    }
                });

                if ($validator->fails()) {
                    return redirect()->back()->withErrors($validator)->withInput();
                }

                $cantidadDisponible -= $request->input('cantidad_salida');
                $cantidadDisponible += $request->input('reajuste_negativo');

                $precio = $precioUnitario * $cantidadDisponible;

                // Entrada::where('numero_lote', $selectedNumeroLote)->update(['cantidad_actual' => $cantidadDisponible]);
                Entrada::where('numero_lote', $selectedNumeroLote)
                        ->where('id', $entradaId)
                        ->update(['cantidad_actual' => $cantidadDisponible]);

                // Crear la salida con 'entrada_id'
                $salida = new Salida([
                    'entrada_id' => $entradaId,
                    'producto_id' => $selectedProductoId,
                    'nombre_producto' => $selectedProductoNombre,
                    'lote_salida' => $selectedNumeroLote,
                    'fecha_vencimiento' => $selectedFechaVencimiento,
                    'fecha' => $validator->validated()['fecha'],
                    'numero_referencia' => $request->input('numero_referencia'),
                    'destinatario' => $request->input('destinatario'),
                    'cantidad_salida' => $request->input('cantidad_salida'),
                    'reajuste_negativo' => $request->input('reajuste_negativo'),
                    'id_user' => $userId,
                    'precio_unitario' =>$precioUnitario,
                    'cantidad_actual' =>$cantidadDisponible,
                    'precio' =>$precio,
                    'observaciones' => $request->input('observaciones')

                ]);

                $salida->save();

                return redirect()
                    ->route('salidas.edit', $salida)
                    ->withSuccess(__('crud.common.created'));
            }
            catch (\Exception $e) {
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
    public function edit(Request $request, Salida $salida): View|RedirectResponse
    {
        $user = auth()->user();
        $permiso =$user->permiso;
        $isSuperAdmin = $user->hasRole('super-admin');

        // Añadir restricción basada en la fecha para usuarios que no son super-admin
        if (!$isSuperAdmin && $permiso==0) {
            $fechaSalida = Carbon::parse($salida->fecha);
            $fechaLimite = Carbon::now()->subMonth();

            if ($fechaSalida->lt($fechaLimite)) {
                return redirect()->route('salidas.index')->with('error', 'No puedes editar registros con más de un mes de antigüedad.');
            }
        }

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
    public function update(SalidaUpdateRequest $request, Salida $salida): RedirectResponse {
        $this->authorize('update', $salida);

        $validated = $request->validated();
        $validated['id_user'] = Auth::id();

        // Recalcula la cantidad disponible y otros valores si la cantidad_salida ha cambiado
        if (isset($validated['cantidad_salida'])) {
            $entradaId=$salida->entrada_id;
            // Recupera la cantidad disponible antes de la actualización
            $cantidadDisponible = Entrada::where('numero_lote', $salida->lote_salida)
                                        //  ->where('id', $entradaId)
                                         ->sum('cantidad_actual');


            // Resta la cantidad de salida anterior
            $cantidadDisponible += $salida->cantidad_salida;

            // Resta el reajuste negativo anterior
            $cantidadDisponible += $salida->reajuste_negativo;

            // Resta la nueva cantidad de salida y el nuevo reajuste negativo
            $cantidadDisponible -= $validated['cantidad_salida'] ?? 0;
            $cantidadDisponible -= $validated['reajuste_negativo'] ?? 0;

            // Calcula el precio unitario antes de la lógica de actualización
            $precioUnitario = $this->calcularPrecioUnitario($salida);

            // Realiza otras operaciones necesarias, como la actualización de precio
            $precio = $precioUnitario * $cantidadDisponible;

            // Actualiza la cantidad actual en las entradas asociadas
            // Entrada::where('numero_lote', $salida->lote_salida)->update(['cantidad_actual' => $cantidadDisponible]);
            Entrada::where('numero_lote', $salida->lote_salida)
                        ->where('id', $entradaId)
                        ->update(['cantidad_actual' => $cantidadDisponible]);

            // Actualiza otros campos necesarios en la salida
            $validated['precio_unitario'] = $precioUnitario;
            $validated['precio'] = $precio;
            $validated['cantidad_actual'] = $cantidadDisponible;
        }

        // Actualiza la salida con los datos validados
        $salida->update($validated);

        return redirect()
            ->route('salidas.edit', $salida)
            ->withSuccess(__('crud.common.saved'));
    }

    // Función para calcular el precio unitario (adaptar según tus necesidades)
    private function calcularPrecioUnitario(Salida $salida): float {
        // Implementa aquí la lógica para calcular el precio unitario según tus necesidades
        // Puedes obtenerlo de una tabla, realizar cálculos, etc.
        // Por ejemplo, aquí se asume que el precio unitario se obtiene de una relación con Entrada
        return $salida->entrada->precio_unitario ?? 0.0;
    }

    /**
     * Remove the specified resource from storage.
     */


     public function destroy(Request $request, Salida $salida): RedirectResponse
     {
         $this->authorize('delete', $salida);

         try {
             // Obtener la cantidad de salida que se restó de la cantidad actual
             $cantidadSalida = intval($salida->cantidad_salida);
             $reajusteNegativo = intval($salida->reajuste_negativo);
             $numeroLote = $salida->lote_salida;

             // Actualizar la cantidad actual en las entradas asociadas sumando la cantidad de salida
             Entrada::where('numero_lote', $numeroLote)->increment('cantidad_actual', $cantidadSalida);
             Entrada::where('numero_lote', $numeroLote)->increment('cantidad_actual', $reajusteNegativo);

             // Eliminar el registro de salida
             $salida->delete();

             return redirect()
                 ->route('salidas.index')
                 ->withSuccess(__('crud.common.removed'));
         } catch (\Exception $e) {
             dd('Excepción: ' . $e->getMessage());
         }
     }
    }
