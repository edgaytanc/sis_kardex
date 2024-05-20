<?php

namespace App\Imports;

use App\Models\Salida;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\Importable;

class SalidasImport implements ToModel, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        // Busca el registro en la base de datos por su ID
        $salida = Salida::find($row['id']);
        

        if ($salida) {
            // Actualiza el registro si existe
            $salida->update([
                // Actualiza los campos con los valores de la importación
                'id' => $row['id'],
                'entrada_id' => $row['entrada_id'],
                'nombre_producto' => $row['nombre_producto'],
                'fecha' => $row['fecha'],
                'numero_referencia' => $row['numero_referencia'],
                'destinatario' => $row['destinatario'],
                'fecha_vencimiento' => $row['fecha_vencimiento'],
                'lote_salida' => $row['lote_salida'],
                'cantidad_salida' => $row['cantidad_salida'],
                'reajuste_negativo' => $row['reajuste_negativo'],
                'id_user' => $row['id_user'],
                'cantidad_actual' => $row['cantidad_actual'],
                'precio' => $row['precio'],
                'precio_unitario' => $row['precio_unitario'],
                'observaciones' => $row['observaciones'],
            ]);
        } else {
            // Crea un nuevo registro si no existe
            $salida = new Salida([
                // Asegúrate de tener el ID en caso de ser necesario
                'id' => $row['id'],
                'entrada_id' => $row['entrada_id'],
                'nombre_producto' => $row['nombre_producto'],
                'fecha' => $row['fecha'],
                'numero_referencia' => $row['numero_referencia'],
                'destinatario' => $row['destinatario'],
                'fecha_vencimiento' => $row['fecha_vencimiento'],
                'lote_salida' => $row['lote_salida'],
                'cantidad_salida' => $row['cantidad_salida'],
                'reajuste_negativo' => $row['reajuste_negativo'],
                'id_user' => $row['id_user'],
                'cantidad_actual' => $row['cantidad_actual'],
                'precio' => $row['precio'],
                'precio_unitario' => $row['precio_unitario'],
                'observaciones' => $row['observaciones'],
            ]);
        }

        return $salida;
    }

}
