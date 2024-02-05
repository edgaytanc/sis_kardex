<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Kardex</title>
    <style>
        body {
            font-family: 'Tw Cen MT';
            font-size: 11px;
            margin: 0;
        }
        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            font-size: 11px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
@php
    $precioUnitarioVienen = null;
    $fechaVencimientoVienen = null;
    $numeroLoteVienen = null;
    $cantidadTotalVienen = null;
    $precioVienen = null;
@endphp
@foreach(array_chunk($datos, 18) as $pagina => $bloqueDatos)
    @if($pagina > 0)
        <div style="page-break-before: always;"></div>
    @endif
    <h4>MINISTERIO DE SALUD PUBLICA Y ASISTENCIA SOCIAL<BR>
        DIRECCION DEPARTAMENTAL DE REDES INTEGRADAS DE SERVICIOS DE SALUD DE TOTONICAPAN<BR>
        DEPENDENCIA: {{$localidad}} <BR>
        PRODUCTO: {{ $nombreProducto }}
    </h4>
    <table>
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Número de Referencia</th>
                <th>Remitente/Destinatario</th>
                <th>Cantidad Entrada</th>
                <th>Precio Unitario</th>
                <th>Valor Total</th>
                <th>Fecha Vencimiento</th>
                <th>Número Lote</th>
                <th>Cantidad Salida</th>
                <th>Reajuste</th>
                <th>Cantidad Total</th>
                <th>Precio</th>
                <th>Observaciones</th>
            </tr>
        </thead>
        <tbody>
            @if($pagina > 0)
                <tr>
                    <td></td>
                    <td></td>
                    <td>VIENEN</td>
                    <td></td>
                    <td>{{ $precioUnitarioVienen }}</td>
                    <td></td>
                    <td>{{ $fechaVencimientoVienen }}</td>
                    <td>{{ $numeroLoteVienen }}</td>
                    <td></td>
                    <td></td>
                    <td>{{ $cantidadTotalVienen }}</td>
                    <td>{{ $precioVienen }}</td>
                    <td></td>
                </tr>
            @endif
            @foreach($bloqueDatos as $dato)
                <tr>
                    <td>{{ $dato->Fecha }}</td>
                    <td>{{ $dato->Numero_de_referencia }}</td>
                    <td>{{ $dato->Remitente_Destinatario }}</td>
                    <td>{{ $dato->Cantidad_Entrada }}</td>
                    <td>{{ $dato->Precio_Unitario }}</td>
                    <td>{{ $dato->Valor_Total }}</td>
                    <td>{{ $dato->Fecha_vencimiento }}</td>
                    <td>{{ $dato->Numero_Lote }}</td>
                    <td>{{ $dato->Cantidad_Salida }}</td>
                    <td>{{ $dato->Reajuste }}</td>
                    <td>{{ $dato->Cantidad_Total}}</td>
                    <td>{{ $dato->Precio}}</td>
                    <td></td>
                </tr>
                @php
                    $precioUnitarioVienen = $dato->Precio_Unitario;
                    $fechaVencimientoVienen = $dato->Fecha_vencimiento;
                    $numeroLoteVienen = $dato->Numero_Lote;
                    $cantidadTotalVienen = $dato->Cantidad_Total;
                    $precioVienen = $dato->Precio;
                @endphp
            @endforeach
                <tr>
                    <td></td>
                    <td></td>
                    <td>VAN</td>
                    <td></td>
                    <td>{{ $precioUnitarioVienen }}</td>
                    <td></td>
                    <td>{{ $fechaVencimientoVienen }}</td>
                    <td>{{ $numeroLoteVienen }}</td>
                    <td></td>
                    <td></td>
                    <td>{{ $cantidadTotalVienen }}</td>
                    <td>{{ $precioVienen }}</td>
                    <td></td>
                </tr>
        </tbody>
    </table>
@endforeach
</body>
</html>
