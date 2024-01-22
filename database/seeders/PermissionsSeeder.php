<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\PermissionRegistrar;

class PermissionsSeeder extends Seeder
{
    public function run(): void
    {
        // Reset cached roles and permissions
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        // Create default permissions
        Permission::create(['name' => 'list destinatarios']);
        Permission::create(['name' => 'view destinatarios']);
        Permission::create(['name' => 'create destinatarios']);
        Permission::create(['name' => 'update destinatarios']);
        Permission::create(['name' => 'delete destinatarios']);

        Permission::create(['name' => 'list entradas']);
        Permission::create(['name' => 'view entradas']);
        Permission::create(['name' => 'create entradas']);
        Permission::create(['name' => 'update entradas']);
        Permission::create(['name' => 'delete entradas']);

        Permission::create(['name' => 'list productos']);
        Permission::create(['name' => 'view productos']);
        Permission::create(['name' => 'create productos']);
        Permission::create(['name' => 'update productos']);
        Permission::create(['name' => 'delete productos']);

        Permission::create(['name' => 'list remitentes']);
        Permission::create(['name' => 'view remitentes']);
        Permission::create(['name' => 'create remitentes']);
        Permission::create(['name' => 'update remitentes']);
        Permission::create(['name' => 'delete remitentes']);

        Permission::create(['name' => 'list salidas']);
        Permission::create(['name' => 'view salidas']);
        Permission::create(['name' => 'create salidas']);
        Permission::create(['name' => 'update salidas']);
        Permission::create(['name' => 'delete salidas']);

        // Create user role and assign existing permissions
        $currentPermissions = Permission::all();
        $userRole = Role::create(['name' => 'user']);
        $userRole->givePermissionTo($currentPermissions);

        // Create admin exclusive permissions
        Permission::create(['name' => 'list roles']);
        Permission::create(['name' => 'view roles']);
        Permission::create(['name' => 'create roles']);
        Permission::create(['name' => 'update roles']);
        Permission::create(['name' => 'delete roles']);

        Permission::create(['name' => 'list permissions']);
        Permission::create(['name' => 'view permissions']);
        Permission::create(['name' => 'create permissions']);
        Permission::create(['name' => 'update permissions']);
        Permission::create(['name' => 'delete permissions']);

        Permission::create(['name' => 'list users']);
        Permission::create(['name' => 'view users']);
        Permission::create(['name' => 'create users']);
        Permission::create(['name' => 'update users']);
        Permission::create(['name' => 'delete users']);

        // Create admin role and assign all permissions
        $allPermissions = Permission::all();
        $adminRole = Role::create(['name' => 'super-admin']);
        $adminRole->givePermissionTo($allPermissions);

        $user = \App\Models\User::whereEmail('admin@admin.com')->first();

        if ($user) {
            $user->assignRole($adminRole);
        }
    }
}
