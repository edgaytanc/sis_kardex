<?php

namespace App\Imports;

use App\Models\Entrada;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\Importable;

class EntradasImport implements ToModel, WithHeadingRow
{
    use Importable;

    protected $importedIds = [];

    public function model(array $row)
    {
        if (!isset($row['id'])) {
            Log::warning("Fila omitida debido a la falta de la clave 'id': " . json_encode($row));
            return null;
        }

        // Buscar la entrada por su ID proporcionado
        $entrada = Entrada::find($row['id']);

        if ($entrada) {
            // Actualizar el registro existente
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
        } else {
            // Crear un nuevo registro si no existe.
            $entrada = new Entrada([
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

        // Registrar la ID importada
        $this->importedIds[] = $row['id'];

        return $entrada;
    }

    public function onCompleted()
    {
        // Eliminar las entradas que no están presentes en el archivo de Excel
        Entrada::whereNotIn('id', $this->importedIds)->delete();
    }
}
