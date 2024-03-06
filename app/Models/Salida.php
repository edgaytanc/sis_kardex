<?php

namespace App\Models;

use App\Models\Scopes\Searchable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Salida extends Model
{
    use HasFactory;
    use Searchable;

    protected $fillable = [
        'entrada_id',
        'nombre_producto',
        'fecha',
        'numero_referencia',
        'destinatario',
        'fecha_vencimiento',
        'lote_salida',
        'cantidad_salida',
        'reajuste_negativo',
        'id_user',
        'precio_unitario',
        'cantidad_actual',
        'precio',
        'observaciones',
    ];

    protected $searchableFields = ['*'];

    protected $casts = [
        'fecha' => 'date',
        'fecha_vencimiento' => 'date',
    ];

    public function entrada()
    {
        return $this->belongsTo(Entrada::class);
    }

    public function producto()
    {
        return $this->entrada->producto ?? null;
    }

    public function numero_lote()
    {
        return $this->entrada->numero_lote ?? null;
    }

    public function producto_id()
    {
        return $this->entrada->producto_id ?? null;
    }

    public function getCantidadDisponible($lote)
    {
        return $this->where('numero_lote', $lote)->sum('cantidad');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
