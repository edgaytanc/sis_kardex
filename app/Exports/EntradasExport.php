<?php

namespace App\Exports;

use App\Models\Entrada;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomCsvSettings;

class EntradasExport implements FromCollection, WithHeadings, WithCustomCsvSettings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Entrada::select('id','producto_id','fecha','numero_referencia','cantidad','precio_unitario','fecha_vencimiento','remitente','numero_lote','reajuste_positivo','id_user','cantidad_actual','precio','observaciones')->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'id',
            'producto_id',
            'fecha',
            'numero_referencia',
            'cantidad',
            'precio_unitario',
            'fecha_vencimiento',
            'remitente',
            'numero_lote',
            'reajuste_positivo',
            'id_user',
            'cantidad_actual',
            'precio',
            'observaciones',
            
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
