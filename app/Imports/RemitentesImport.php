<?php

namespace App\Imports;

use App\Models\Remitente;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB; // Importa el facade DB aquí

class RemitentesImport implements ToModel, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        try {
            //Verifica si existe un registro con el ID proporcionado.
            $remitente = Remitente::find($row['id']);

            if($remitente){
                //Actualiza el registro existente
                $remitente->update([
                    'nombre' => $row['nombre'],
                    'id_user' => $row['id_user'],
                ]);
                Log::info('Remitente actualizado: ' . $row['id']);
            } else {
                DB::table('remitentes')->insert([
                    'id' => $row['id'],
                    'nombre' => $row['nombre'],
                    'id_user' => $row['id_user'],
                ]);

                Log::info('Remitente creado: ');
            }
        } catch (\Exception $e) {
            Log::error("Error al importar remitente: {$e->getMessage()}");
            // Opcionalmente, registra la fila que causó el error
            Log::error('Fila con error: ' . json_encode($row));
        }
    }
}
