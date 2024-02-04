<?php
// App\Http\Controllers\ConsultaController.php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Producto;
use App\Models\Entrada;
use Barryvdh\DomPDF\PDF;

class ConsultaController extends Controller
{
    public function mostrarDatos(Request $request)
    {
        $productoId = $request->input('producto_id');
        $producto = Producto::findOrFail($productoId);
        $nombreProducto = $producto->nombre;
        $localidad = auth()->user()->localidad;
        $userId = auth()->user()->id;

        // Obtiene el último precio unitario no NULL para usarlo como valor predeterminado
        $precio_unitario = DB::table('entradas')
            ->where('cantidad_actual', '>', 0)
            ->whereNotNull('precio_unitario')
            ->orderByDesc('fecha')
            ->value('precio_unitario');

            $datos = DB::select("
            SELECT *
            FROM (
                SELECT
                    DATE_FORMAT(e.fecha, '%d/%m/%Y') AS Fecha,
                    e.numero_referencia AS Numero_de_referencia,
                    rem.nombre AS Remitente_Destinatario,
                    e.cantidad AS Cantidad_Entrada,
                    e.precio_unitario AS Precio_Unitario,
                    (e.cantidad * e.precio_unitario) AS Valor_Total,
                    DATE_FORMAT(e.fecha_vencimiento, '%d/%m/%Y') AS Fecha_vencimiento,
                    e.numero_lote AS Numero_Lote,
                    NULL AS Cantidad_Salida,
                    e.reajuste_positivo AS Reajuste,
                    e.cantidad As Cantidad_Total,
                    e.precio As Precio
                FROM
                    entradas e
                LEFT JOIN
                    remitentes rem ON e.remitente_id = rem.id
                WHERE
                    e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

                UNION ALL

                SELECT
                    DATE_FORMAT(s.fecha, '%d/%m/%Y') AS Fecha,
                    s.numero_referencia AS Numero_de_referencia,
                    des.nombre AS Remitente_Destinatario,
                    NULL AS Cantidad_Entrada,
                    s.precio_unitario AS Precio_Unitario,
                    NULL AS Valor_Total,
                    DATE_FORMAT(s.fecha_vencimiento, '%d/%m/%Y') AS Fecha_vencimiento,
                    s.lote_salida AS Numero_Lote,
                    s.cantidad_salida AS Cantidad_Salida,
                    s.reajuste_negativo AS Reajuste,
                    s.cantidad_actual AS Cantidad_Total,
                    s.precio AS Precio
                FROM
                    salidas s
                LEFT JOIN
                    destinatarios des ON s.destinatario_id = des.id
                WHERE
                    s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
            ) AS datos
            ORDER BY STR_TO_DATE(Fecha, '%d/%m/%Y') ASC
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
            SELECT *
            FROM (
                SELECT
                    DATE_FORMAT(e.fecha, '%d/%m/%Y') AS Fecha,
                    e.numero_referencia AS Numero_de_referencia,
                    rem.nombre AS Remitente_Destinatario,
                    e.cantidad AS Cantidad_Entrada,
                    e.precio_unitario AS Precio_Unitario,
                    (e.cantidad * e.precio_unitario) AS Valor_Total,
                    DATE_FORMAT(e.fecha_vencimiento, '%d/%m/%Y') AS Fecha_vencimiento,
                    e.numero_lote AS Numero_Lote,
                    NULL AS Cantidad_Salida,
                    e.reajuste_positivo AS Reajuste,
                    e.cantidad As Cantidad_Total,
                    e.precio As Precio
                FROM
                    entradas e
                LEFT JOIN
                    remitentes rem ON e.remitente_id = rem.id
                WHERE
                    e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

                UNION ALL

                SELECT
                    DATE_FORMAT(s.fecha, '%d/%m/%Y') AS Fecha,
                    s.numero_referencia AS Numero_de_referencia,
                    des.nombre AS Remitente_Destinatario,
                    NULL AS Cantidad_Entrada,
                    s.precio_unitario AS Precio_Unitario,
                    NULL AS Valor_Total,
                    DATE_FORMAT(s.fecha_vencimiento, '%d/%m/%Y') AS Fecha_vencimiento,
                    s.lote_salida AS Numero_Lote,
                    s.cantidad_salida AS Cantidad_Salida,
                    s.reajuste_negativo AS Reajuste,
                    s.cantidad_actual AS Cantidad_Total,
                    s.precio AS Precio
                FROM
                    salidas s
                LEFT JOIN
                    destinatarios des ON s.destinatario_id = des.id
                WHERE
                    s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
            ) AS datos
            ORDER BY STR_TO_DATE(Fecha, '%d/%m/%Y') ASC
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
