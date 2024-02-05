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


class EntradaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $this->authorize('view-any', Entrada::class);

        $search = $request->get('search', '');

        $entradas = Entrada::search($search)
            ->latest()
            ->paginate(5)
            ->withQueryString();

        return view('app.entradas.index', compact('entradas', 'search'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request): View
    {
        $this->authorize('create', Entrada::class);

        $productos = Producto::pluck('nombre', 'id');
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
    public function edit(Request $request, Entrada $entrada): View
    {
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

        // Asignar el valor de cantidad a cantidad_actual solo si se proporciona cantidad
        if (isset($validated['cantidad'])) {
            $validated['cantidad_actual'] = $validated['cantidad'];
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
        $this->authorize('delete', $entrada);

        $entrada->delete();

        return redirect()
            ->route('entradas.index')
            ->withSuccess(__('crud.common.removed'));
    }
}
