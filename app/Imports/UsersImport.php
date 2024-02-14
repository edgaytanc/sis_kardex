<?php

namespace App\Imports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Hash;

class UsersImport implements ToModel, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        $user = User::where('email', $row['email'])->first();

        if (!$user) {
            return new User([
                'name'     => $row['name'],
                'email'    => $row['email'],
                'password' => Hash::make($row['password']),
                'localidad' => $row['localidad'], // Asegúrate de que tu archivo Excel tenga una columna 'localidad'
                'permiso' => $row['permiso'],
            ]);
        }

        return null;
    }
}
