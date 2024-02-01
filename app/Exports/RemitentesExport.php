<?php

namespace App\Exports;

use App\Models\Remitente;
use Maatwebsite\Excel\Concerns\FromCollection;

class RemitentesExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Remitente::all();
    }
}
