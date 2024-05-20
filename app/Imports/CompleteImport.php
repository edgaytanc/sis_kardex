<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class CompleteImport implements WithMultipleSheets {
    public function sheets(): array {
        return [
            'Worksheet 2' => new RemitentesImport(),
            'Worksheet' => new UsersImport(),
            'Worksheet 1' => new DestinatariosImport(),
            'Worksheet 3' => new EntradasImport(),
            'Worksheet 4' => new SalidasImport(),
            
            

        ];
    }
}
