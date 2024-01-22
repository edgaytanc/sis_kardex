<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\View\View;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\ProductoStoreRequest;
use App\Http\Requests\ProductoUpdateRequest;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $this->authorize('view-any', Producto::class);

        $search = $request->get('search', '');

        $productos = Producto::search($search)
            ->latest()
            ->paginate(5)
            ->withQueryString();

        return view('app.productos.index', compact('productos', 'search'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request): View
    {
        $this->authorize('create', Producto::class);

        return view('app.productos.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(ProductoStoreRequest $request): RedirectResponse
    {
        $this->authorize('create', Producto::class);

        $validated = $request->validated();

        $producto = Producto::create($validated);

        return redirect()
            ->route('productos.edit', $producto)
            ->withSuccess(__('crud.common.created'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, Producto $producto): View
    {
        $this->authorize('view', $producto);

        return view('app.productos.show', compact('producto'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Producto $producto): View
    {
        $this->authorize('update', $producto);

        return view('app.productos.edit', compact('producto'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(
        ProductoUpdateRequest $request,
        Producto $producto
    ): RedirectResponse {
        $this->authorize('update', $producto);

        $validated = $request->validated();

        $producto->update($validated);

        return redirect()
            ->route('productos.edit', $producto)
            ->withSuccess(__('crud.common.saved'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(
        Request $request,
        Producto $producto
    ): RedirectResponse {
        $this->authorize('delete', $producto);

        $producto->delete();

        return redirect()
            ->route('productos.index')
            ->withSuccess(__('crud.common.removed'));
    }
}
