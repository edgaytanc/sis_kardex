<?php

namespace App\Exports;

use App\Models\Destinatario;
use Maatwebsite\Excel\Concerns\FromCollection;

class DestinatariosExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Destinatario::all();
    }
}
