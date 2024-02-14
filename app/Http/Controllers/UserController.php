<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\View\View;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\RedirectResponse;
use App\Http\Requests\UserStoreRequest;
use App\Http\Requests\UserUpdateRequest;
use App\Exports\UsersExport;
use Maatwebsite\Excel\Facades\Excel;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request): View
    {
        $this->authorize('view-any', User::class);

        $search = $request->get('search', '');

        $users = User::search($search)
            ->latest()
            ->paginate(5)
            ->withQueryString();

        return view('app.users.index', compact('users', 'search'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request): View
    {
        $this->authorize('create', User::class);

        $roles = Role::get();

        return view('app.users.create', compact('roles'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(UserStoreRequest $request): RedirectResponse
    {
        $this->authorize('create', User::class);
        $roleNames = Role::whereIn('id',$request->roles)->pluck('name');  //prueba de error

        $validated = $request->validated();

        $validated['password'] = Hash::make($validated['password']);
        $validated['localidad'] = $request->input('localidad');

        $user = User::create($validated);

        // $user->syncRoles($request->roles);
        $user->syncRoles($roleNames); // prueba de error

        return redirect()
            ->route('users.edit', $user)
            ->withSuccess(__('crud.common.created'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, User $user): View
    {
        $this->authorize('view', $user);

        return view('app.users.show', compact('user'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, User $user): View
    {
        $this->authorize('update', $user);

        $roles = Role::get();

        return view('app.users.edit', compact('user', 'roles'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(
        UserUpdateRequest $request,
        User $user
    ): RedirectResponse {


        $this->authorize('update', $user);

        $roleNames = Role::whereIn('id', $request->roles)->pluck('name'); //para ver el error

        $validated = $request->validated();

        if (empty($validated['password'])) {
            unset($validated['password']);
        } else {
            $validated['password'] = Hash::make($validated['password']);
        }

        $validated['localidad'] = $request->input('localidad');

        $user->update($validated);

        // $user->syncRoles($request->roles);
        $user->syncRoles($roleNames); //para ver el error

        return redirect()
            ->route('users.edit', $user)
            ->withSuccess(__('crud.common.saved'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, User $user): RedirectResponse
    {
        $this->authorize('delete', $user);

        $user->delete();

        return redirect()
            ->route('users.index')
            ->withSuccess(__('crud.common.removed'));
    }

    public function export()
    {
        return Excel::download(new UsersExport, 'users.xlsx');
    }

    public function updatePermission(Request $request, User $user)
    {
        $user->update([
            'permiso' => $request->permiso,
        ]);

        return response()->json(['message' => 'Permiso actualizado con éxito.']);
    }

    public function permiso()
    {

        //Asegurate de que el rol 'user existe
        $roleUser = Role::where('name', 'user')->first();

        //Verifica si el rol existe para evitar erroes en caso de que no exista
        if($roleUser){
            //recupera todos los usuarios cone ese rol
            $users = User::role('user')->get();
        } else {
            // si no existe el rol 'user', devuelve una coleccion vacia
            $users = collect([]);
        }

        // //Recupera todos los usuarios
        // $users = User::all();

        //Retorna la vista con el listado de usuarios, pasando los usuarios como variable
        return view('app.users.permiso', compact('users'));
    }

}
