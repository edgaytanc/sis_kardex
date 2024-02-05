<?php

namespace App\Imports;

use App\Models\Remitente;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class RemitentesImport implements ToModel, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        //Verifica si existe un registro con el ID proporcionado.
        $remitente = Remitente::find($row['id']);

        if($remitente){
            //Actualiza el registro existente
            $remitente->update([
                'nombre' => $row['nombre'],
                'id_user' => $row['id_user'],
            ]);
            return null; // Retorna null para no crear un nuevo modelo
        } else {
            return new Remitente([
                'nombre' => $row['nombre'],
                'id_user' => $row['id_user'],
            ]);
        }
    }
}
