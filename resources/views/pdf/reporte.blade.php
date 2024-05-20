<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Kardex</title>
    <style>
        body {
            font-family: 'Tw Cen MT';
            font-size: 8px;
            margin: 0;
        }
        .footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            font-size: 9px;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 4px;
            text-align: left;
            vertical-align: top;
            word-wrap: break-word;
        }
        th {
            background-color: #f2f2f2;
        }
        .ministerio {
            font-size: 14px;
        }
        .margen-35 {
            padding-top: 3.5cm;
        }
        .margen-15 {
            padding-top: 1.5cm;
        }
    </style>
</head>
<body>
@foreach($datosPorPagina as $pagina => $bloqueDatos)
    @if($pagina > 0)
        <div style="page-break-before: always;"></div>
    @endif
    @if($pagina % 2 === 0)
        <div class="encabezado margen-35">
            <h4 class="ministerio">
                MINISTERIO DE SALUD PUBLICA Y ASISTENCIA SOCIAL<br>
                DIRECCION DEPARTAMENTAL DE REDES INTEGRADAS DE SERVICIOS DE SALUD DE TOTONICAPAN<br>
                DEPENDENCIA: {{ $localidad }}<br>
                PRODUCTO: {{ $nombreProducto }}
            </h4>
        </div>
    @else
        <div class="encabezado margen-15">
            <h4 class="ministerio">
                PRODUCTO: {{ $nombreProducto }}
                </h4>
    @endif        
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
                <th>Saldo Total</th>
                <th>Precio</th>
                <th>Observaciones</th>
            </tr>
        </thead>
        <tbody>
            @if($pagina > 0)
                <!-- Filas "vienen" al inicio de cada página (excepto la primera) -->
                <tr>
                    <td></td>
                    <td></td>
                    <td>VIENEN</td>
                    <td></td>
                    <td>Q.{{ $precioUnitarioVienen }}</td>
                    <td></td>
                    <td>{{ $fechaVencimientoVienen }}</td>
                    <td>{{ $numeroLoteVienen }}</td>
                    <td></td>
                    <td></td>
                    <td>{{ $cantidadTotalVienen }}</td>
                    <td>Q.{{ $precioVienen }}</td>
                    <td></td>
                </tr>
            @endif
            @foreach($bloqueDatos as $dato)
                <tr>
                    <td>{{ $dato->Fecha }}</td>
                    <td class="numero-referencia">{{ $dato->Numero_de_referencia }}</td>
                    <td>{{ $dato->Remitente_Destinatario }}</td>
                    <td>{{ $dato->Cantidad_Entrada }}</td>
                    <td>Q.{{ $dato->Precio_Unitario }}</td>
                    <td>Q.{{ $dato->Valor_Total }}</td>
                    <td>{{ $dato->Fecha_vencimiento ? $dato->Fecha_vencimiento : 'N/A' }}</td>
                    <td>{{ $dato->Numero_Lote }}</td>
                    <td>{{ $dato->Cantidad_Salida }}</td>
                    <td>{{ $dato->Reajuste }}</td>
                    <td>{{ $dato->Cantidad_Total}}</td>
                    <td>Q.{{ $dato->Precio}}</td>
                    <td style="font-size: 8px; word-wrap: break-word;">{{ $dato->Observaciones }}</td>

                </tr>
                @php
                    $precioUnitarioVienen = $dato->Precio_Unitario;
                    $fechaVencimientoVienen = $dato->Fecha_vencimiento;
                    $numeroLoteVienen = $dato->Numero_Lote;
                    $cantidadTotalVienen = $dato->Cantidad_Total;
                    $precioVienen = $dato->Precio;
                @endphp
            @endforeach
                <!-- Filas "van" al final de cada página -->
                <tr>
                    <td></td>
                    <td></td>
                    <td>VAN</td>
                    <td></td>
                    <td>Q.{{ $precioUnitarioVienen }}</td>
                    <td></td>
                    <td>{{ $fechaVencimientoVienen }}</td>
                    <td>{{ $numeroLoteVienen }}</td>
                    <td></td>
                    <td></td>
                    <td>{{ $cantidadTotalVienen }}</td>
                    <td>Q.{{ $precioVienen }}</td>
                    <td></td>
                </tr>
        </tbody>
    </table>
@endforeach
</body>
</html>
