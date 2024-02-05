<?php

namespace App\Exports;

use App\Models\Salida;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithCustomCsvSettings;

class SalidasExport implements FromCollection, WithHeadings, WithCustomCsvSettings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Salida::select('id','entrada_id','nombre_producto','fecha','numero_referencia','destinatario_id','fecha_vencimiento','lote_salida','cantidad_salida','reajuste_negativo','id_user','precio','cantidad_actual','precio_unitario')->get();
    }

    /**
     * @return array
     */
    public function headings(): array
    {
        return [
            'id',
            'entrada_id',
            'nombre_producto',
            'fecha',
            'numero_referencia',
            'destinatario_id',
            'fecha_vencimiento',
            'lote_salida',
            'cantidad_salida',
            'reajuste_negativo',
            'id_user',
            'precio',
            'cantidad_actual',
            'precio_unitario',
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
