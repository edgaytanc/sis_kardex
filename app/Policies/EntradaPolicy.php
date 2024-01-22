<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Entrada;
use Illuminate\Auth\Access\HandlesAuthorization;

class EntradaPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the entrada can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasPermissionTo('list entradas');
    }

    /**
     * Determine whether the entrada can view the model.
     */
    public function view(User $user, Entrada $model): bool
    {
        return $user->hasPermissionTo('view entradas');
    }

    /**
     * Determine whether the entrada can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasPermissionTo('create entradas');
    }

    /**
     * Determine whether the entrada can update the model.
     */
    public function update(User $user, Entrada $model): bool
    {
        return $user->hasPermissionTo('update entradas');
    }

    /**
     * Determine whether the entrada can delete the model.
     */
    public function delete(User $user, Entrada $model): bool
    {
        return $user->hasPermissionTo('delete entradas');
    }

    /**
     * Determine whether the user can delete multiple instances of the model.
     */
    public function deleteAny(User $user): bool
    {
        return $user->hasPermissionTo('delete entradas');
    }

    /**
     * Determine whether the entrada can restore the model.
     */
    public function restore(User $user, Entrada $model): bool
    {
        return false;
    }

    /**
     * Determine whether the entrada can permanently delete the model.
     */
    public function forceDelete(User $user, Entrada $model): bool
    {
        return false;
    }
}
