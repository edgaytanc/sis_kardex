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
            DB::statement("SET @saldo_acumulado := 0;");
            DB::statement("SET @precio_acumulado := 0;");
            DB::statement("SET @valor_total_acumulado:=0;");

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
                datos.Observaciones,

                @saldo_acumulado := @saldo_acumulado + COALESCE(datos.Cantidad_Entrada, 0) - COALESCE(datos.Cantidad_Salida, 0) + COALESCE(datos.Reajuste, 0) AS Cantidad_Total,
                @precio_acumulado := CASE
                    WHEN COALESCE(datos.Cantidad_Entrada, 0) > 0 THEN @precio_acumulado + (COALESCE(datos.Valor_Total, 0))
                    WHEN COALESCE(datos.Reajuste, 0) <> 0 THEN @precio_acumulado + (COALESCE(datos.Reajuste,0) * COALESCE(datos.Precio_Unitario, 0))
                    WHEN COALESCE(datos.Cantidad_Salida, 0) > 0 THEN
                        CASE
                            WHEN COALESCE(datos.Reajuste, 0) > 0 THEN @precio_acumulado - ((COALESCE(datos.Cantidad_Salida, 0) - COALESCE(datos.Reajuste, 0)) * COALESCE(datos.Precio_Unitario, 0))
                            WHEN COALESCE(datos.Reajuste, 0) < 0 THEN @precio_acumulado - (COALESCE(datos.Cantidad_Salida, 0) * COALESCE(datos.Precio_Unitario, 0))

                            ELSE @precio_acumulado - (COALESCE(datos.Cantidad_Salida, 0) * COALESCE(datos.Precio_Unitario, 0))
                        END
                    ELSE @saldo_acumulado * COALESCE(datos.Precio_Unitario,0)
                END AS Precio

            FROM (
                SELECT
                    e.fecha AS FechaOriginal,
                    e.created_at AS CreatedAtOriginal,
                    e.numero_referencia AS Numero_de_referencia,
                    e.remitente AS Remitente_Destinatario,
                    e.cantidad AS Cantidad_Entrada,
                    e.precio_unitario AS Precio_Unitario,
                    (e.cantidad * e.precio_unitario) AS Valor_Total,
                    e.fecha_vencimiento AS Fecha_vencimiento_original,
                    e.numero_lote AS Numero_Lote,
                    NULL AS Cantidad_Salida,
                    e.reajuste_positivo AS Reajuste,
                    e.cantidad AS Cantidad_Total,
                    e.precio AS Precio,
                    e.observaciones AS Observaciones,
                    e.id AS OrdenInsercion
                FROM
                    entradas e
                WHERE
                    e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

                UNION ALL

                SELECT
                    s.fecha AS FechaOriginal,
                    s.created_at AS CreatedAtOriginal,
                    s.numero_referencia AS Numero_de_referencia,
                    s.destinatario AS Remitente_Destinatario,
                    NULL AS Cantidad_Entrada,
                    (SELECT e.precio_unitario FROM entradas e WHERE e.numero_lote = s.lote_salida LIMIT 1) AS Precio_Unitario,
                    NULL AS Valor_Total,
                    s.fecha_vencimiento AS Fecha_vencimiento_original,
                    s.lote_salida AS Numero_Lote,
                    s.cantidad_salida AS Cantidad_Salida,
                    s.reajuste_negativo AS Reajuste,
                    s.cantidad_actual AS Cantidad_Total,
                    s.precio AS Precio,
                    s.observaciones AS Observaciones,
                    s.id AS OrdenInsercion
                FROM
                    salidas s
                WHERE
                    s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
                            ) AS datos
                            ORDER BY datos.FechaOriginal ASC, datos.CreatedAtOriginal ASC, datos.OrdenInsercion ASC

                        ", [
                            'productoIdEntrada' => $productoId,
                            'userIdEntrada' => $userId,
                            'nombreProductoSalida' => $nombreProducto,
                            'userIdSalida' => $userId
                        ]);

        return view('app.consultas.mostrar_datos', compact('datos','nombreProducto','localidad','productoId','userId'));
    }

    private function estimarLineas($texto, $anchoMaximoCaracteres = 100) {
        $longitudTexto = mb_strlen($texto);
        $lineas = ceil($longitudTexto / $anchoMaximoCaracteres);
        return $lineas;
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


        // Inicializa la variable @saldo_acumulado
        DB::statement("SET @saldo_acumulado := 0;");
        DB::statement("SET @precio_acumulado := 0;");

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
                datos.Observaciones,

                @saldo_acumulado := @saldo_acumulado + COALESCE(datos.Cantidad_Entrada, 0) - COALESCE(datos.Cantidad_Salida, 0) + COALESCE(datos.Reajuste, 0) AS Cantidad_Total,
                @precio_acumulado := CASE
                    WHEN COALESCE(datos.Cantidad_Entrada, 0) > 0 THEN @precio_acumulado + (COALESCE(datos.Valor_Total, 0))
                    WHEN COALESCE(datos.Reajuste, 0) <> 0 THEN @precio_acumulado + (COALESCE(datos.Reajuste,0) * COALESCE(datos.Precio_Unitario, 0))
                    WHEN COALESCE(datos.Cantidad_Salida, 0) > 0 THEN
                        CASE
                            WHEN COALESCE(datos.Reajuste, 0) > 0 THEN @precio_acumulado - ((COALESCE(datos.Cantidad_Salida, 0) - COALESCE(datos.Reajuste, 0)) * COALESCE(datos.Precio_Unitario, 0))
                            WHEN COALESCE(datos.Reajuste, 0) < 0 THEN @precio_acumulado - (COALESCE(datos.Cantidad_Salida, 0) * COALESCE(datos.Precio_Unitario, 0))

                            ELSE @precio_acumulado - (COALESCE(datos.Cantidad_Salida, 0) * COALESCE(datos.Precio_Unitario, 0))
                        END
                    ELSE @saldo_acumulado * COALESCE(datos.Precio_Unitario,0)
                END AS Precio

            FROM (
                SELECT
                    e.fecha AS FechaOriginal,
                    e.created_at AS CreatedAtOriginal,
                    e.numero_referencia AS Numero_de_referencia,
                    e.remitente AS Remitente_Destinatario,
                    e.cantidad AS Cantidad_Entrada,
                    e.precio_unitario AS Precio_Unitario,
                    (e.cantidad * e.precio_unitario) AS Valor_Total,
                    e.fecha_vencimiento AS Fecha_vencimiento_original,
                    e.numero_lote AS Numero_Lote,
                    NULL AS Cantidad_Salida,
                    e.reajuste_positivo AS Reajuste,
                    e.cantidad AS Cantidad_Total,
                    e.precio AS Precio,
                    e.observaciones AS Observaciones,
                    e.id AS OrdenInsercion
                FROM
                    entradas e
                WHERE
                    e.producto_id = :productoIdEntrada AND e.id_user = :userIdEntrada

                UNION ALL

                SELECT
                    s.fecha AS FechaOriginal,
                    s.created_at AS CreatedAtOriginal,
                    s.numero_referencia AS Numero_de_referencia,
                    s.destinatario AS Remitente_Destinatario,
                    NULL AS Cantidad_Entrada,
                    (SELECT e.precio_unitario FROM entradas e WHERE e.numero_lote = s.lote_salida LIMIT 1) AS Precio_Unitario,
                    NULL AS Valor_Total,
                    s.fecha_vencimiento AS Fecha_vencimiento_original,
                    s.lote_salida AS Numero_Lote,
                    s.cantidad_salida AS Cantidad_Salida,
                    s.reajuste_negativo AS Reajuste,
                    s.cantidad_actual AS Cantidad_Total,
                    s.precio AS Precio,
                    s.observaciones AS Observaciones,
                    s.id AS OrdenInsercion
                FROM
                    salidas s
                WHERE
                    s.nombre_producto = :nombreProductoSalida AND s.id_user = :userIdSalida
                            ) AS datos
                            ORDER BY datos.FechaOriginal ASC, datos.CreatedAtOriginal ASC, datos.OrdenInsercion ASC
    ", [
        'productoIdEntrada' => $productoId,
        'userIdEntrada' => $userId,
        'nombreProductoSalida' => $nombreProducto,
        'userIdSalida' => $userId
    ]);

        //Codigo prueba
        $datosBloqueados = collect();
        $pagina =0;
        $cantidadPorPagina = 18;

        foreach ($datos as $dato){
            if ($pagina % 2 == 0 && $datosBloqueados->count() % 15 == 0 && $datosBloqueados->count() !=0){
                //son 18 registros por pagina
                $cantidadPorPagina = 18;
                $pagina++;
            } elseif ($pagina % 2 != 0 && $datosBloqueados->count() % $cantidadPorPagina == 0 && $datosBloqueados->count() !=0){
                //son 15 registros por pagina
                $cantidadPorPagina = 15;
                $pagina++;
            }

            // Agregar datos al ultimo bloque o crear un nuevo bloque si es necesario
            if ($datosBloqueados->isEmpty() || $datosBloqueados->last()->count() >= $cantidadPorPagina) {
                $datosBloqueados->push(collect([$dato])); // crea un nuevo bloque con el dato actual
            }
            else {
                $datosBloqueados->last()->push($dato); //Agrega un dato al ultimo bloque existente
            }
        }

        // codigo nuevo para repote
        $lineasPorPagina = 44;
        $lineasUsadas = 0;
        $paginaActual = 0;
        $datosPorPagina = [];

        foreach ($datos as $dato) {
            $lineasEstimadas = $this->estimarLineas($dato->Numero_de_referencia, 100); //aqui se ajusta segun lo que se necesite\
            $lineasTotales = $lineasEstimadas + 1; //ajuste segun analisis

            if (($lineasUsadas + $lineasTotales) > $lineasPorPagina) {
                $paginaActual++; //Mueve a la siguiente pagina
                $lineasUsadas = 0; // resetea el conteo para la nueva pagina
            }

            if (!isset($datosPorPagina[$paginaActual])) {
                $datosPorPagina[$paginaActual] = [];
            }

            $datosPorPagina[$paginaActual][] = $dato; //Agrega el registro al grupo de la pagina actual
            $lineasUsadas += $lineasTotales;
        }

        // aqui termina codigo nuevo
        $pdf = app('dompdf.wrapper');
        $pdf->loadView('pdf.reporte',[
            'datosPorPagina' => $datosPorPagina,
            'nombreProducto' => $nombreProducto,
            'localidad' => $localidad,
        ])
            ->setPaper('legal','landscape');


        // $pdf = app('dompdf.wrapper');
        // $pdf->loadView('pdf.reporte', compact('datos', 'nombreProducto', 'localidad'))
        //     ->setPaper('legal', 'landscape');

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
