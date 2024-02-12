<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ConsolidadoKardex;
use Barryvdh\DomPDF\PDF;
use Carbon\Carbon;


class ConsolidadoKardexController extends Controller
{
    public function index()
    {
        $datos = ConsolidadoKardex::all(); // Obtiene todos los registros de la vista
        $categorias = ConsolidadoKardex::select('Categoria')
                    ->distinct()
                    ->orderBy('Categoria','asc')
                    ->get();

        //Define valores iniciales para evitar errores
        $fechaKardex = '';
        $categoria = '';
        return view('app.consultas.reporteConsolidado', compact('datos','categorias','fechaKardex','categoria')); // Envía los datos al view
    }

    public function filtrar(Request $request)
    {
        $fechaKardex = $request->input('fechaKardex');
        $categoria = $request->input('categoria');
        $datos = ConsolidadoKardex::whereDate('FechaKardex', '=', $fechaKardex)
                ->where('Categoria','=',$categoria) //Asegurate de ajustar el nombre del campo  si es necesario
                ->get(); // Asegúrate que 'fecha' sea el nombre correcto del campo en tu base de datos

        // Mantén las categorías disponibles después de filtrar
        $categorias = ConsolidadoKardex::select('Categoria')->distinct()->orderBy('Categoria', 'asc')->get();

        return view('app.consultas.reporteConsolidado', compact('datos','fechaKardex','categoria','categorias'));
    }

    public function generarPDF(Request $request)
    {
        // Loguear o devolver los datos recibidos para depuración
        logger('Fecha Kardex: ' . $request->input('fechaKardex'));
        logger('Categoría: ' . $request->input('categoria'));
        $fechaKardex = $request->input('fechaKardex');
        $categoria = $request->input('categoria');

        //Usando Carbon par parsear $fechakardex
        $fecha = Carbon::parse($fechaKardex);

        //extrae mes en letras y anio en formato yyyy
        $mes = $fecha->locale('es')->isoFormat('MMMM');
        $anio = $fecha->format('Y');

        $datos = ConsolidadoKardex::whereDate('FechaKardex', '=', $fechaKardex)
                    ->when($categoria, function ($query, $categoria) {
                        return $query->where('Categoria', '=', $categoria);
                    })
                    ->get();

        $pdf = app('dompdf.wrapper');
        $pdf->loadView('app.consultas.pdfReporteConsolidado', compact('datos', 'fechaKardex', 'categoria','mes','anio'));
        return $pdf->download('reporteKardex.pdf');
    }

}
