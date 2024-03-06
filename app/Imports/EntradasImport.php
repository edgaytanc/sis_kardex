<?php

namespace App\Imports;

use App\Models\Entrada;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Log;


class EntradasImport implements ToModel, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {

        if(!isset($row['id'])){
            log::warning("Fila omitida debido a la falta de la clave 'id': ". json_encode($row));
            return null;
        }
        else{
            // Verificar si existe un registro con el ID proporcionado.
        $entrada = Entrada::find($row['id']);
        }



        if ($entrada) {
            // Actualizar el registro existente.
            $entrada->update([
                'producto_id' => $row['producto_id'],
                'fecha' => $row['fecha'],
                'numero_referencia' => $row['numero_referencia'],
                'cantidad' => $row['cantidad'],
                'precio_unitario' => $row['precio_unitario'],
                'fecha_vencimiento' => $row['fecha_vencimiento'],
                'remitente' => $row['remitente'],
                'numero_lote' => $row['numero_lote'],
                'reajuste_positivo' => $row['reajuste_positivo'],
                'id_user' => $row['id_user'],
                'cantidad_actual' => $row['cantidad_actual'],
                'precio' => $row['precio'],
                'observaciones' => $row['observaciones'],
            ]);
            return null; // Retorna null para no crear un nuevo modelo
        } else {
            // Crear un nuevo registro si no existe.
            return new Entrada([
                'id' => $row['id'],
                'producto_id' => $row['producto_id'],
                'fecha' => $row['fecha'],
                'numero_referencia' => $row['numero_referencia'],
                'cantidad' => $row['cantidad'],
                'precio_unitario' => $row['precio_unitario'],
                'fecha_vencimiento' => $row['fecha_vencimiento'],
                'remitente' => $row['remitente'],
                'numero_lote' => $row['numero_lote'],
                'reajuste_positivo' => $row['reajuste_positivo'],
                'id_user' => $row['id_user'],
                'cantidad_actual' => $row['cantidad_actual'],
                'precio' => $row['precio'],
                'observaciones' => $row['observaciones'],
            ]);
        }
    }
}
