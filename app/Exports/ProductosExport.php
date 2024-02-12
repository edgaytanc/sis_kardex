<?php

namespace App\Exports;

use App\Models\Producto;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomCsvSettings;

class ProductosExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return Producto::all();
    }

    public function headings(): array
    {
        return [
            'id',
            'categoría',
            'nombre',
            'presentación',
            'concentración',
            'envase',
            'unidad_medida',
            'Creado',
            'Actualizado'
        ];
    }

    // public function getCsvSettings(): array
    // {
    //     return [
    //         'delimiter' => ';',
    //         // Agregar cualquier otro ajuste de CSV que necesites
    //     ];
    // }
}
