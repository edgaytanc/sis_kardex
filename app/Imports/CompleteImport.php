<?php

namespace App\Imports;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class CompleteImport implements WithMultipleSheets {
    public function sheets(): array {
        return [
            'Worksheet' => new EntradasImport(),
            'Worksheet 1' => new SalidasImport(),
            'Worksheet 2' => new DestinatariosImport(),
            'Worksheet 3' => new RemitentesImport(),
            'Worksheet 4' => new UsersImport(),

        ];
    }
}
