<?php

namespace App\Imports;

use App\Models\Destinatario;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class DestinatariosImport implements ToModel, WithHeadingRow
{
    use Importable;

    public function model(array $row)
    {
        //Verifica si existe un registro con el ID proporcionado.
        $destinatario = Destinatario::find($row['id']);

        if($destinatario){
            //Actualiza el registro existente
            $destinatario->update([
                'nombre' => $row['nombre'],
                'id_user' => $row['id_user'],
            ]);
            return null; // Retorna null para no crear un nuevo modelo
        } else {
            return new Destinatario([
                'nombre' => $row['nombre'],
                'id_user' => $row['id_user'],
            ]);
        }
    }
}
