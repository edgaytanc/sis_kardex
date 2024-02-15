<?php
// App\Http\Controllers\ConsultaController.php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Producto;
use App\Models\Entrada;
use Barryvdh\DomPDF\PDF;
use App\Models\User;

class ConsultaController extends Controller
{
    public function mostrarDatos(Request $request)
    {
        $productoId = $request->input('producto_id');
        $producto = Producto::findOrFail($productoId);
        $nombreProducto = $producto->nombre;
        $userId = $request->input('user_id');

        $user = User::find($userId);

        // Verifica si el usuario existe antes de intentar acceder a su localidad
        if ($user) {
            $localidad = $user->localidad;
        } else {
            // Manejar el caso en que el usuario no existe, por ejemplo, asignar un valor predeterminado a $localidad o lanzar un error
            $localidad = auth()->user()->localidad;
        }

        // Usa el userId enviado desde la vista si está disponible, de lo contrario, usa el userId del usuario activo

        if($userId==null){
            $userId= auth()->user()->id;
            // $localidad = auth()->user()->localidad;
        }

        // Obtiene el último precio unitario no NULL para usarlo como valor predeterminado
        $precio_unitario = DB::table('entradas')
            ->where('cantidad_actual', '>', 0)
            ->whereNotNull('precio_unitario')
            ->orderByDesc('fecha')
            ->value('precio_unitario');

            $datos = DB::select("
            SELECT
                DATE_FORMAT(datos.FechaOriginal, '%d/%m/%Y') AS Fecha,
                datos.Numero_de_referencia,
                datos.Remitente_Destinatario,
                datos.Cantidad_Entrada,
                datos.Precio_Unitario,
                datos.Valor_Total,
                DATE_FORMAT(datos.Fecha_vencimiento_original, '%d/%m/%Y') AS Fecha_vencimiento,
                datos.Numero_Lote,
                datos.Cantidad_Salida,
                datos.Reajuste,
                datos.Cantidad_Total,
                datos.Precio
            FROM (
                SELECT
                    e.fecha AS FechaOriginal,
                    e.numero_referencia AS Numero_de_referencia,
                    rem.nombre AS Remitente_Destinatario,
                    e.cantidad AS Cantidad_Entrada,
                    e.precio_unitario AS Precio_Unitario,
                    (e.cantidad * e.precio_unitario) AS Valor_Total,
                    e.fecha_vencimiento AS Fecha_vencimiento_original,
                    e.numero_lote AS Numero_Lote,
                    NULL AS Cantidad_Salida,
                    e.reajuste_positivo AS Reajuste,
                    e.cantidad AS Cantidad_Total,
                    e.precio AS Precio,
                    e.id AS OrdenInsercion -- Asumiendo 'id' es autoincrementable y refleja el orden de inserción
                FROM
                    entradas e
                LEFT JOIN
                    remitentes rem ON e.remitente_id = rem.id
                WHERE
                    e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

                UNION ALL

                SELECT
                    s.fecha AS FechaOriginal,
                    s.numero_referencia AS Numero_de_referencia,
                    des.nombre AS Remitente_Destinatario,
                    NULL AS Cantidad_Entrada,
                    s.precio_unitario AS Precio_Unitario,
                    NULL AS Valor_Total,
                    s.fecha_vencimiento AS Fecha_vencimiento_original,
                    s.lote_salida AS Numero_Lote,
                    s.cantidad_salida AS Cantidad_Salida,
                    s.reajuste_negativo AS Reajuste,
                    s.cantidad_actual AS Cantidad_Total,
                    s.precio AS Precio,
                    s.id AS OrdenInsercion
                FROM
                    salidas s
                LEFT JOIN
                    destinatarios des ON s.destinatario_id = des.id
                WHERE
                    s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
            ) AS datos
            ORDER BY datos.FechaOriginal ASC, datos.OrdenInsercion ASC

        ", [
            'productoIdEntrada' => $productoId,
            'userIdEntrada' => $userId,
            'nombreProductoSalida' => $nombreProducto,
            'userIdSalida' => $userId
        ]);

        return view('app.consultas.mostrar_datos', compact('datos','nombreProducto','localidad','productoId','userId'));
    }



    public function generatePdf($productoId, $userId)
    {
        $producto = Producto::findOrFail($productoId);
        $nombreProducto = $producto->nombre;

        $user = User::find($userId);

        // Verifica si el usuario existe antes de intentar acceder a su localidad
        if ($user) {
            $localidad = $user->localidad;
        } else {
            // Manejar el caso en que el usuario no existe, por ejemplo, asignar un valor predeterminado a $localidad o lanzar un error
            $localidad = auth()->user()->localidad;
        }

        // Usa el userId enviado desde la vista si está disponible, de lo contrario, usa el userId del usuario activo

        if($userId==null){
            $userId= auth()->user()->id;
            // $localidad = auth()->user()->localidad;
        }



        // $localidad = auth()->user()->localidad;
        // $userId = auth()->user()->id;

        $datos = DB::select("
            SELECT
                DATE_FORMAT(datos.FechaOriginal, '%d/%m/%Y') AS Fecha,
                datos.Numero_de_referencia,
                datos.Remitente_Destinatario,
                datos.Cantidad_Entrada,
                datos.Precio_Unitario,
                datos.Valor_Total,
                DATE_FORMAT(datos.Fecha_vencimiento_original, '%d/%m/%Y') AS Fecha_vencimiento,
                datos.Numero_Lote,
                datos.Cantidad_Salida,
                datos.Reajuste,
                datos.Cantidad_Total,
                datos.Precio
            FROM (
                SELECT
                    e.fecha AS FechaOriginal,
                    e.numero_referencia AS Numero_de_referencia,
                    rem.nombre AS Remitente_Destinatario,
                    e.cantidad AS Cantidad_Entrada,
                    e.precio_unitario AS Precio_Unitario,
                    (e.cantidad * e.precio_unitario) AS Valor_Total,
                    e.fecha_vencimiento AS Fecha_vencimiento_original,
                    e.numero_lote AS Numero_Lote,
                    NULL AS Cantidad_Salida,
                    e.reajuste_positivo AS Reajuste,
                    e.cantidad AS Cantidad_Total,
                    e.precio AS Precio,
                    e.id AS OrdenInsercion -- Asumiendo 'id' es autoincrementable y refleja el orden de inserción
                FROM
                    entradas e
                LEFT JOIN
                    remitentes rem ON e.remitente_id = rem.id
                WHERE
                    e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

                UNION ALL

                SELECT
                    s.fecha AS FechaOriginal,
                    s.numero_referencia AS Numero_de_referencia,
                    des.nombre AS Remitente_Destinatario,
                    NULL AS Cantidad_Entrada,
                    s.precio_unitario AS Precio_Unitario,
                    NULL AS Valor_Total,
                    s.fecha_vencimiento AS Fecha_vencimiento_original,
                    s.lote_salida AS Numero_Lote,
                    s.cantidad_salida AS Cantidad_Salida,
                    s.reajuste_negativo AS Reajuste,
                    s.cantidad_actual AS Cantidad_Total,
                    s.precio AS Precio,
                    s.id AS OrdenInsercion
                FROM
                    salidas s
                LEFT JOIN
                    destinatarios des ON s.destinatario_id = des.id
                WHERE
                    s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
            ) AS datos
            ORDER BY datos.FechaOriginal ASC, datos.OrdenInsercion ASC

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




    public function index(Request $request)
    {
        $productos = Producto::all();
        $userId = $request->query('userId',null);
        return view('app.consultas.seleccionar_producto', compact('productos','userId'));
    }

    public function selectUser()
    {
        $users = User::all(); // Obtener todos los usuarios
        return view('app.consultas.select_user', compact('users')); // Mostrar la vista con los usuarios
    }

    public function processUserSelection(Request $request)
    {
        $userId = $request->input('user_id'); // Obtener el ID del usuario seleccionado
        // Redirigir a la vista de selección de producto con el ID del usuario como parámetro
        return redirect()->route('seleccionar_producto', ['userId' => $userId]);
    }




}
