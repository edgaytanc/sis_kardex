<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ConsolidadoKardex extends Model
{
    protected $table = 'vista_consolidado_kardex'; // Nombre de la vista en la base de datos
    public $timestamps = false; // Si tu vista no tiene columnas created_at y updated_at
}
