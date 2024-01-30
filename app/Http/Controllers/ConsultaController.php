<?php
// App\Http\Controllers\ConsultaController.php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Producto;
use Barryvdh\DomPDF\PDF;

class ConsultaController extends Controller
{
    public function mostrarDatos(Request $request)
    {
        $productoId = $request->input('producto_id');
        $producto = Producto::findOrFail($productoId);
        $nombreProducto = $producto->nombre;
        $localidad = auth()->user()->localidad;
        $userId = auth()->user()->id; // Obtener el id del usuario actual

        $datos = DB::select("
            SELECT
                DATE_FORMAT(COALESCE(e.fecha, s.fecha), '%d/%m/%Y') AS Fecha,
                COALESCE(e.numero_referencia, s.numero_referencia) AS Numero_de_referencia,
                COALESCE(rem.nombre, des.nombre) AS Remitente_Destinatario,
                e.cantidad AS Cantidad_Entrada,
                e.precio_unitario AS Precio_Unitario,
                (e.cantidad * e.precio_unitario) AS Valor_Total,
                DATE_FORMAT(COALESCE(e.fecha_vencimiento, s.fecha_vencimiento), '%d/%m/%Y') AS Fecha_vencimiento,
                COALESCE(e.numero_lote, s.lote_salida) AS Numero_Lote,
                s.cantidad_salida AS Cantidad_Salida,
                COALESCE(s.reajuste_negativo, e.reajuste_positivo) AS Reajuste
            FROM
                entradas e
            LEFT JOIN
                salidas s ON e.id = s.entrada_id
            LEFT JOIN
                remitentes rem ON e.remitente_id = rem.id
            LEFT JOIN
                destinatarios des ON s.destinatario_id = des.id
            WHERE
                e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

            UNION

            SELECT
                DATE_FORMAT(COALESCE(s.fecha, e.fecha), '%d/%m/%Y') AS Fecha,
                COALESCE(s.numero_referencia, e.numero_referencia) AS Numero_de_referencia,
                COALESCE(des.nombre, rem.nombre) AS Remitente_Destinatario,
                e.cantidad AS Cantidad_Entrada,
                e.precio_unitario AS Precio_Unitario,
                (e.cantidad * e.precio_unitario) AS Valor_Total,
                DATE_FORMAT(COALESCE(s.fecha_vencimiento, e.fecha_vencimiento), '%d/%m/%Y') AS Fecha_vencimiento,
                COALESCE(s.lote_salida, e.numero_lote) AS Numero_Lote,
                s.cantidad_salida AS Cantidad_Salida,
                COALESCE(s.reajuste_negativo, e.reajuste_positivo) AS Reajuste
            FROM
                salidas s
            LEFT JOIN
                entradas e ON s.entrada_id = e.id
            LEFT JOIN
                remitentes rem ON e.remitente_id = rem.id
            LEFT JOIN
                destinatarios des ON s.destinatario_id = des.id
            WHERE
                s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
        ", [
            'productoIdEntrada' => $productoId,
            'userIdEntrada' => $userId,
            'nombreProductoSalida' => $nombreProducto,
            'userIdSalida' => $userId
        ]);


        return view('app.consultas.mostrar_datos', compact('datos','nombreProducto','localidad','productoId'));


    }


    public function generatePdf($productoId)
    {
        $producto = Producto::findOrFail($productoId);
        $nombreProducto = $producto->nombre;
        $localidad = auth()->user()->localidad;
        $userId = auth()->user()->id;

        $datos = DB::select("
            SELECT
                DATE_FORMAT(COALESCE(e.fecha, s.fecha), '%d/%m/%Y') AS Fecha,
                COALESCE(e.numero_referencia, s.numero_referencia) AS Numero_de_referencia,
                COALESCE(rem.nombre, des.nombre) AS Remitente_Destinatario,
                e.cantidad AS Cantidad_Entrada,
                e.precio_unitario AS Precio_Unitario,
                (e.cantidad * e.precio_unitario) AS Valor_Total,
                DATE_FORMAT(COALESCE(e.fecha_vencimiento, s.fecha_vencimiento), '%d/%m/%Y') AS Fecha_vencimiento,
                COALESCE(e.numero_lote, s.lote_salida) AS Numero_Lote,
                s.cantidad_salida AS Cantidad_Salida,
                COALESCE(s.reajuste_negativo, e.reajuste_positivo) AS Reajuste
            FROM
                entradas e
            LEFT JOIN
                salidas s ON e.id = s.entrada_id
            LEFT JOIN
                remitentes rem ON e.remitente_id = rem.id
            LEFT JOIN
                destinatarios des ON s.destinatario_id = des.id
            WHERE
                e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

            UNION

            SELECT
                DATE_FORMAT(COALESCE(s.fecha, e.fecha), '%d/%m/%Y') AS Fecha,
                COALESCE(s.numero_referencia, e.numero_referencia) AS Numero_de_referencia,
                COALESCE(des.nombre, rem.nombre) AS Remitente_Destinatario,
                e.cantidad AS Cantidad_Entrada,
                e.precio_unitario AS Precio_Unitario,
                (e.cantidad * e.precio_unitario) AS Valor_Total,
                DATE_FORMAT(COALESCE(s.fecha_vencimiento, e.fecha_vencimiento), '%d/%m/%Y') AS Fecha_vencimiento,
                COALESCE(s.lote_salida, e.numero_lote) AS Numero_Lote,
                s.cantidad_salida AS Cantidad_Salida,
                COALESCE(s.reajuste_negativo, e.reajuste_positivo) AS Reajuste
            FROM
                salidas s
            LEFT JOIN
                entradas e ON s.entrada_id = e.id
            LEFT JOIN
                remitentes rem ON e.remitente_id = rem.id
            LEFT JOIN
                destinatarios des ON s.destinatario_id = des.id
            WHERE
                s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
        ", [
            'productoIdEntrada' => $productoId,
            'userIdEntrada' => $userId,
            'nombreProductoSalida' => $nombreProducto,
            'userIdSalida' => $userId
        ]);

        $pdf = app('dompdf.wrapper');
        $pdf->loadView('pdf.reporte', compact('datos', 'nombreProducto', 'localidad'))
            ->setPaper('legal', 'landscape');

        return $pdf->download('reporte_kardex.pdf');
    }




    public function index()
    {
        $productos = Producto::all();
        return view('app.consultas.seleccionar_producto', compact('productos'));
    }
}
