<?php

namespace App\Exports;

use App\Models\Entrada;
use Maatwebsite\Excel\Concerns\FromCollection;

class EntradasExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Entrada::all();
    }
}
