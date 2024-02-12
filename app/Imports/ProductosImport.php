<?php

namespace App\Imports;

use App\Models\Producto;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ProductosImport implements ToModel, WithHeadingRow
{
    use Importable;


    public function model(array $row)
    {

        //verifica si existe un registro con el ID proporcionado
        $producto = Producto::find($row['id']);

        if($producto){
            //Actualiza el registro existente
            $producto->update([
                'categoria'      => $row['categoria'],
                'nombre'         => $row['nombre'],
                'presentacion'   => $row['presentacion'],
                'concentracion'  => $row['concentracion'],
                'envase'         => $row['envase'],
                'unidad_medida'  => $row['unidad_medida'],
            ]);
            return null;
        } else{
            return new Producto([
                'categoria'      => $row[0],
                'nombre'         => $row[1],
                'presentacion'   => $row[2],
                'concentracion'  => $row[3],
                'envase'         => $row[4],
                'unidad_medida'  => $row[5],
            ]);
        }


    }
}

