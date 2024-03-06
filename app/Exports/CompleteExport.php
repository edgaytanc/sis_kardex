<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class CompleteExport implements WithMultipleSheets
{
    public function sheets(): array
    {
        $sheets =[];
        $sheets[] = new UsersExport();
        $sheets[] = new DestinatariosExport();
        $sheets[] = new RemitentesExport();
        $sheets[] = new EntradasExport();
        $sheets[] = new SalidasExport();


        return $sheets;
    }
}
