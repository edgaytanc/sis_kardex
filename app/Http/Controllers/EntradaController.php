<?php

namespace App\Http\Controllers;

use App\Models\Entrada;
use App\Models\Producto;
use Illuminate\View\View;
use App\Models\Remitente;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\EntradaStoreRequest;
use App\Http\Requests\EntradaUpdateRequest;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;



class EntradaController extends Controller
{


    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $this->authorize('view-any', Entrada::class);

        $search = $request->get('search', '');

        if (empty($search)) {
            $entradas = Entrada::query();
        } else {
            $entradas = Entrada::search($search);
        }

        $entradas = $entradas->latest()
            ->paginate(5)
            ->withQueryString();

        return view('app.entradas.index', compact('entradas', 'search'));
    }

    /**
     * Show the form for creating a new resource.
     */
   // EntradaController.php

public function create(Request $request): View
{
    $this->authorize('create', Entrada::class);

    // Obtener todos los productos con sus nombres y categorías
    $productos = Producto::pluck('nombre', 'id')->map(function ($nombre, $id) {
        $producto = Producto::find($id);
        return $nombre . ' -- ' . $producto->categoria;
    });

    $remitentes = Remitente::pluck('nombre', 'id');

    return view('app.entradas.create', compact('productos', 'remitentes'));
}

    /**
     * Store a newly created resource in storage.
     */
    public function store(EntradaStoreRequest $request): RedirectResponse
    {
        $this->authorize('create', Entrada::class);

        $validated = $request->validated();
        $validated['id_user'] = Auth::id();

        // Asignar el valor de cantidad a cantidad_actual
        $validated['cantidad_actual'] = $validated['cantidad'];
        $validated['precio'] = $validated['cantidad'] * $validated['precio_unitario'];

        // Verificar si hay reajuste positivo y ajustar la cantidad actual en consecuencia
        $reajustePositivo = $validated['reajuste_positivo'] ?? 0;
        if ($reajustePositivo > 0) {
            $validated['cantidad_actual'] += $reajustePositivo;
        }

        $entrada = Entrada::create($validated);

        return redirect()
            ->route('entradas.edit', $entrada)
            ->withSuccess(__('crud.common.created'));
    }
    /**
     * Display the specified resource.
     */
    public function show(Request $request, Entrada $entrada): View
    {
        $this->authorize('view', $entrada);

        return view('app.entradas.show', compact('entrada'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Entrada $entrada): View|RedirectResponse
    {

        $user = auth()->user();
        $permiso =$user->permiso;
        $isSuperAdmin = $user->hasRole('super-admin');

        if (!$isSuperAdmin && $permiso==0) {
            $fechaEntrada = Carbon::parse($entrada->fecha);
            $fechaLimite = Carbon::now()->subMonth();

            if ($fechaEntrada->lt($fechaLimite)) {
                return redirect()->route('entradas.index')->with('error', 'No puedes editar registros con más de un mes de antigüedad.');
            }
        }

        $this->authorize('update', $entrada);

        $productos = Producto::pluck('nombre', 'id');
        $remitentes = Remitente::pluck('nombre', 'id');

        return view(
            'app.entradas.edit',
            compact('entrada', 'productos', 'remitentes')
        );
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(
        EntradaUpdateRequest $request,
        Entrada $entrada
    ): RedirectResponse {
        $this->authorize('update', $entrada);

        $validated = $request->validated();
        $validated['id_user'] = Auth::id();

        // Recuperar el registro de entrada actual por ID para obtener la cantidad_actual
        $entradaActual = Entrada::find($entrada->id);

        // Asignar el valor de cantidad a cantidad_actual solo si se proporciona cantidad
        // if (isset($validated['cantidad'])) {
        //     $validated['cantidad_actual'] = $validated['cantidad'];
        // }
    

        if (isset($validated['cantidad']) || isset($validated['reajuste_positivo'])) {
            // Inicializar la diferencia en cero
            $diferencia = 0;
        
            // Calcular la diferencia para la cantidad, si se proporciona
            if (isset($validated['cantidad'])) {
                $diferencia += $validated['cantidad'] - $entradaActual->cantidad;
            }
        
            // Calcular la diferencia para el reajuste positivo, si se proporciona
            if (isset($validated['reajuste_positivo'])) {
                $diferencia += $validated['reajuste_positivo'] - $entradaActual->reajuste_positivo;
            }

            // Ajustar cantidad_actual basado en la diferencia calculada
            $validated['cantidad_actual'] = $entradaActual->cantidad_actual + $diferencia;
        }

        $entrada->update($validated);

        return redirect()
            ->route('entradas.edit', $entrada)
            ->withSuccess(__('crud.common.saved'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(
        Request $request,
        Entrada $entrada
    ): RedirectResponse {

        $user = auth()->user();
        $permiso =$user->permiso;
        $isSuperAdmin = $user->hasRole('super-admin');

        if (!$isSuperAdmin && $permiso==0) {
            $fechaEntrada = Carbon::parse($entrada->fecha);
            $fechaLimite = Carbon::now()->subMonth();

            if ($fechaEntrada->lt($fechaLimite)) {
                return redirect()->route('entradas.index')->with('error', 'No puedes eliminar registros con más de un mes de antigüedad.');
            }
        }


        $this->authorize('delete', $entrada);

        // Verificar si hay movimientos de salida asociados a esta entrada
        $salidasCount = $entrada->salidas()->count();
    
        if ($salidasCount > 0) {
            // Usar mensaje flash para mostrar el error
            return redirect()->route('entradas.index')
            ->withSuccess(__('crud.common.delete_error'));
        }
    
        $entrada->delete();
    
        return redirect()
            ->route('entradas.index')
            ->withSuccess(__('crud.common.removed'));
    }
}
