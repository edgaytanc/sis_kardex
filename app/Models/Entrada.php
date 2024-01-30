<?php

namespace App\Models;

use App\Models\Scopes\Searchable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Entrada extends Model
{
    use HasFactory;
    use Searchable;

    protected $fillable = [
        'producto_id',
        'fecha',
        'numero_referencia',
        'cantidad',
        'precio_unitario',
        'fecha_vencimiento',
        'remitente_id',
        'numero_lote',
        'reajuste_positivo',
        'id_user',
    ];

    protected $searchableFields = ['*'];

    protected $casts = [
        'fecha' => 'date',
        'fecha_vencimiento' => 'date',
    ];

    public function remitente()
    {
        return $this->belongsTo(Remitente::class);
    }

    public function producto()
    {
        return $this->belongsTo(Producto::class);
    }

    public function salidas()
    {
        return $this->hasMany(Salida::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
