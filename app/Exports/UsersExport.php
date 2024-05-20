<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomCsvSettings;
use App\Models\User;

class UsersExport implements FromCollection, WithHeadings, WithCustomCsvSettings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return User::select('name', 'email', 'password', 'localidad','permiso')->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'Name',
            'Email',
            'Localidad',
            'Permiso',
        ];
    }

    /**
     * @return array
     */
    public function getCsvSettings(): array
    {
        return [
            'delimiter' => ';',
            // Agregar cualquier otro ajuste de CSV que necesites
        ];
    }
}
