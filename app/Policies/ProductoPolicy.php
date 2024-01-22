<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Producto;
use Illuminate\Auth\Access\HandlesAuthorization;

class ProductoPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the producto can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasPermissionTo('list productos');
    }

    /**
     * Determine whether the producto can view the model.
     */
    public function view(User $user, Producto $model): bool
    {
        return $user->hasPermissionTo('view productos');
    }

    /**
     * Determine whether the producto can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasPermissionTo('create productos');
    }

    /**
     * Determine whether the producto can update the model.
     */
    public function update(User $user, Producto $model): bool
    {
        return $user->hasPermissionTo('update productos');
    }

    /**
     * Determine whether the producto can delete the model.
     */
    public function delete(User $user, Producto $model): bool
    {
        return $user->hasPermissionTo('delete productos');
    }

    /**
     * Determine whether the user can delete multiple instances of the model.
     */
    public function deleteAny(User $user): bool
    {
        return $user->hasPermissionTo('delete productos');
    }

    /**
     * Determine whether the producto can restore the model.
     */
    public function restore(User $user, Producto $model): bool
    {
        return false;
    }

    /**
     * Determine whether the producto can permanently delete the model.
     */
    public function forceDelete(User $user, Producto $model): bool
    {
        return false;
    }
}
