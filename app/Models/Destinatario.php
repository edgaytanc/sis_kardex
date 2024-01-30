<?php

namespace App\Models;

use App\Models\Scopes\Searchable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Destinatario extends Model
{
    use HasFactory;
    use Searchable;

    protected $fillable = ['nombre', 'id_user'];

    protected $searchableFields = ['*'];

    public function salidas()
    {
        return $this->hasMany(Salida::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }
}
