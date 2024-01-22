<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Remitente;
use Illuminate\Auth\Access\HandlesAuthorization;

class RemitentePolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the remitente can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasPermissionTo('list remitentes');
    }

    /**
     * Determine whether the remitente can view the model.
     */
    public function view(User $user, Remitente $model): bool
    {
        return $user->hasPermissionTo('view remitentes');
    }

    /**
     * Determine whether the remitente can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasPermissionTo('create remitentes');
    }

    /**
     * Determine whether the remitente can update the model.
     */
    public function update(User $user, Remitente $model): bool
    {
        return $user->hasPermissionTo('update remitentes');
    }

    /**
     * Determine whether the remitente can delete the model.
     */
    public function delete(User $user, Remitente $model): bool
    {
        return $user->hasPermissionTo('delete remitentes');
    }

    /**
     * Determine whether the user can delete multiple instances of the model.
     */
    public function deleteAny(User $user): bool
    {
        return $user->hasPermissionTo('delete remitentes');
    }

    /**
     * Determine whether the remitente can restore the model.
     */
    public function restore(User $user, Remitente $model): bool
    {
        return false;
    }

    /**
     * Determine whether the remitente can permanently delete the model.
     */
    public function forceDelete(User $user, Remitente $model): bool
    {
        return false;
    }
}
