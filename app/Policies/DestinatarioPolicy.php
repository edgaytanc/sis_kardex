<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Destinatario;
use Illuminate\Auth\Access\HandlesAuthorization;

class DestinatarioPolicy
{
    use HandlesAuthorization;

    /**
     * Determine whether the destinatario can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasPermissionTo('list destinatarios');
    }

    /**
     * Determine whether the destinatario can view the model.
     */
    public function view(User $user, Destinatario $model): bool
    {
        return $user->hasPermissionTo('view destinatarios');
    }

    /**
     * Determine whether the destinatario can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasPermissionTo('create destinatarios');
    }

    /**
     * Determine whether the destinatario can update the model.
     */
    public function update(User $user, Destinatario $model): bool
    {
        return $user->hasPermissionTo('update destinatarios');
    }

    /**
     * Determine whether the destinatario can delete the model.
     */
    public function delete(User $user, Destinatario $model): bool
    {
        return $user->hasPermissionTo('delete destinatarios');
    }

    /**
     * Determine whether the user can delete multiple instances of the model.
     */
    public function deleteAny(User $user): bool
    {
        return $user->hasPermissionTo('delete destinatarios');
    }

    /**
     * Determine whether the destinatario can restore the model.
     */
    public function restore(User $user, Destinatario $model): bool
    {
        return false;
    }

    /**
     * Determine whether the destinatario can permanently delete the model.
     */
    public function forceDelete(User $user, Destinatario $model): bool
    {
        return false;
    }
}
