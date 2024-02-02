<?php

namespace App\Imports;

use App\Models\Salida;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class SalidasImport implements ToModel, WithHeadingRow
{
    use Importable;
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        // Verifica si existe el registro ID Proporcionado
        $salida = Salida::find($row['id']);

        if($salida){
            //Actualiza el registro existente
            $salida->update([
                'entrada_id' => $row['entrada_id'],
                'nombre_producto' => $row['nombre_producto'],
                'fecha' => $row['fecha'],
                'numero_referencia' => $row['numero_referencia'],
                'destinatario_id' => $row['destinatario_id'],
                'fecha_vencimiento' => $row['fecha_vencimiento'],
                'lote_salida' => $row['lote_salida'],
                'cantidad_salida' => $row['cantidad_salida'],
                'reajuste_negativo' => $row['reajuste_negativo'],
                'id_user' => $row['id_user'],
            ]);
            return null; // retorna new para no crear un nuevo modelo

        } else{
            // Crear un nuevo registro si no existe.
            return new Salida([
                'entrada_id' => $row['entrada_id'],
                'nombre_producto' => $row['nombre_producto'],
                'fecha' => $row['fecha'],
                'numero_referencia' => $row['numero_referencia'],
                'destinatario_id' => $row['destinatario_id'],
                'fecha_vencimiento' => $row['fecha_vencimiento'],
                'lote_salida' => $row['lote_salida'],
                'cantidad_salida' => $row['cantidad_salida'],
                'reajuste_negativo' => $row['reajuste_negativo'],
                'id_user' => $row['id_user'],
            ]);
        }
    }
}
