<?php

namespace App\Models;

use App\Models\Scopes\Searchable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Producto extends Model
{
    use HasFactory;
    use Searchable;

    protected $fillable = [
        'categoria',
        'nombre',
        'presentacion',
        'concentracion',
        'envase',
        'unidad_medida',
    ];

    protected $searchableFields = ['*'];

    public function entradas()
    {
        return $this->hasMany(Entrada::class);
    }
}
