<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imports\UsersImport;
use App\Imports\EntradasImport;
use App\Imports\SalidasImport;
use App\Imports\DestinatariosImport;
use App\Imports\RemitentesImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\CompleteImport;

class ImportController extends Controller
{
    public function import_users(Request $request)
    {
        Excel::import(new UsersImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import_entradas(Request $request)
    {
        Excel::import(new EntradasImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import_salidas(Request $request)
    {
        Excel::import(new SalidasImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import_destinatarios(Request $request)
    {
        Excel::import(new DestinatariosImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import_remitentes(Request $request)
    {
        Excel::import(new RemitentesImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import(Request $request) {
        Excel::import(new CompleteImport, $request->file('file'));

        return back()->with('success', 'Importación completa.');
    }
}
