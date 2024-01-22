<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Salida;
use Illuminate\Auth\Access\HandlesAuthorization;

class SalidaPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the salida can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasPermissionTo('list salidas');
    }

    /**
     * Determine whether the salida can view the model.
     */
    public function view(User $user, Salida $model): bool
    {
        return $user->hasPermissionTo('view salidas');
    }

    /**
     * Determine whether the salida can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasPermissionTo('create salidas');
    }

    /**
     * Determine whether the salida can update the model.
     */
    public function update(User $user, Salida $model): bool
    {
        return $user->hasPermissionTo('update salidas');
    }

    /**
     * Determine whether the salida can delete the model.
     */
    public function delete(User $user, Salida $model): bool
    {
        return $user->hasPermissionTo('delete salidas');
    }

    /**
     * Determine whether the user can delete multiple instances of the model.
     */
    public function deleteAny(User $user): bool
    {
        return $user->hasPermissionTo('delete salidas');
    }

    /**
     * Determine whether the salida can restore the model.
     */
    public function restore(User $user, Salida $model): bool
    {
        return false;
    }

    /**
     * Determine whether the salida can permanently delete the model.
     */
    public function forceDelete(User $user, Salida $model): bool
    {
        return false;
    }
}
