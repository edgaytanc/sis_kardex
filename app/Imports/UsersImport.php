<?php
namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class UsersImport implements ToModel, WithHeadingRow
{
    public function model(array $row)
    {
        $user = User::where('email', $row['email'])->first();

        if (!$user) {
            // Si el usuario no existe, crear uno nuevo sin actualizar la contraseña
            return new User([
                'name'     => $row['name'],
                'email'    => $row['email'],
                'localidad' => $row['localidad'],
                'permiso' => $row['permiso'],
            ]);
        } else {
            // Si el usuario existe, actualizar sus datos sin cambiar la contraseña
            $user->update([
                'name'     => $row['name'],
                'localidad' => $row['localidad'],
                'permiso' => $row['permiso'],
            ]);
        }
    }
}
