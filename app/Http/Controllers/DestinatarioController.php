<?php

namespace App\Http\Controllers;

use Illuminate\View\View;
use App\Models\Destinatario;
use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\DestinatarioStoreRequest;
use App\Http\Requests\DestinatarioUpdateRequest;

class DestinatarioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $this->authorize('view-any', Destinatario::class);

        $search = $request->get('search', '');

        $destinatarios = Destinatario::search($search)
            ->latest()
            ->paginate(5)
            ->withQueryString();

        return view(
            'app.destinatarios.index',
            compact('destinatarios', 'search')
        );
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request): View
    {
        $this->authorize('create', Destinatario::class);

        return view('app.destinatarios.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DestinatarioStoreRequest $request): RedirectResponse
    {
        $this->authorize('create', Destinatario::class);

        $validated = $request->validated();

        $destinatario = Destinatario::create($validated);

        return redirect()
            ->route('destinatarios.edit', $destinatario)
            ->withSuccess(__('crud.common.created'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, Destinatario $destinatario): View
    {
        $this->authorize('view', $destinatario);

        return view('app.destinatarios.show', compact('destinatario'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, Destinatario $destinatario): View
    {
        $this->authorize('update', $destinatario);

        return view('app.destinatarios.edit', compact('destinatario'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(
        DestinatarioUpdateRequest $request,
        Destinatario $destinatario
    ): RedirectResponse {
        $this->authorize('update', $destinatario);

        $validated = $request->validated();

        $destinatario->update($validated);

        return redirect()
            ->route('destinatarios.edit', $destinatario)
            ->withSuccess(__('crud.common.saved'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(
        Request $request,
        Destinatario $destinatario
    ): RedirectResponse {
        $this->authorize('delete', $destinatario);

        $destinatario->delete();

        return redirect()
            ->route('destinatarios.index')
            ->withSuccess(__('crud.common.removed'));
    }
}
