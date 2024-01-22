<?php

namespace App\Http\Controllers;

use App\Models\Remitente;
use Illuminate\View\View;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\RemitenteStoreRequest;
use App\Http\Requests\RemitenteUpdateRequest;

class RemitenteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $this->authorize('view-any', Remitente::class);

        $search = $request->get('search', '');

        $remitentes = Remitente::search($search)
            ->latest()
            ->paginate(5)
            ->withQueryString();

        return view('app.remitentes.index', compact('remitentes', 'search'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request): View
    {
        $this->authorize('create', Remitente::class);

        return view('app.remitentes.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(RemitenteStoreRequest $request): RedirectResponse
    {
        $this->authorize('create', Remitente::class);

        $validated = $request->validated();

        $remitente = Remitente::create($validated);

        return redirect()
            ->route('remitentes.edit', $remitente)
            ->withSuccess(__('crud.common.created'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, Remitente $remitente): View
    {
        $this->authorize('view', $remitente);

        return view('app.remitentes.show', compact('remitente'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Remitente $remitente): View
    {
        $this->authorize('update', $remitente);

        return view('app.remitentes.edit', compact('remitente'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(
        RemitenteUpdateRequest $request,
        Remitente $remitente
    ): RedirectResponse {
        $this->authorize('update', $remitente);

        $validated = $request->validated();

        $remitente->update($validated);

        return redirect()
            ->route('remitentes.edit', $remitente)
            ->withSuccess(__('crud.common.saved'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(
        Request $request,
        Remitente $remitente
    ): RedirectResponse {
        $this->authorize('delete', $remitente);

        $remitente->delete();

        return redirect()
            ->route('remitentes.index')
            ->withSuccess(__('crud.common.removed'));
    }
}
