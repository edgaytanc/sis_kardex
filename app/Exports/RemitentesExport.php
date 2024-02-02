<?php

namespace App\Exports;

use App\Models\Remitente;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomCsvSettings;

class RemitentesExport implements FromCollection, WithHeadings, WithCustomCsvSettings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Remitente::select('id','nombre','id_user')->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'id',
            'nombre',
            'id_user',
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
