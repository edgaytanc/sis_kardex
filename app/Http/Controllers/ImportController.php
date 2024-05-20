<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imports\UsersImport;
use App\Imports\EntradasImport;
use App\Imports\SalidasImport;
use App\Imports\DestinatariosImport;
use App\Imports\RemitentesImport;
use App\Imports\ProductosImport;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\CompleteImport;
use Illuminate\Support\Facades\DB;

class ImportController extends Controller
{
    /**
     * Vaciar la tabla de salidas.
     */
    private function vaciarTablaSalidas(): void
    {
        try {
            DB::table('salidas')->truncate();
        } catch (\Exception $e) {
            dd('Excepción al vaciar la tabla de salidas: ' . $e->getMessage());
        }
    }
  


    public function import_users(Request $request)
    {
        $this->vaciarTablaSalidas();
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
        $this->vaciarTablaSalidas();
        Excel::import(new SalidasImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import_destinatarios(Request $request)
    {
        $this->vaciarTablaSalidas();
        Excel::import(new DestinatariosImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import_remitentes(Request $request)
    {
        $this->vaciarTablaSalidas();
        Excel::import(new RemitentesImport, $request->file('file'));

        return redirect()->back()->with('success', 'Importación completada con éxito.');
    }

    public function import(Request $request)
    {
        
        $this->vaciarTablaSalidas();
      
        Excel::import(new CompleteImport, $request->file('file'));

        return back()->with('success', 'Importación completa.');
    }

    public function import_productos(Request $request)
    {
        $this->vaciarTablaSalidas();
        Excel::import(new ProductosImport, $request->file('file'));

        return redirect()->back()->with('success', 'Productos importados con éxito.');
    }
}