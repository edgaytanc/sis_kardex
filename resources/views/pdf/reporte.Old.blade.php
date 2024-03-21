<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Kardex</title>
    <style>
        body {
            font-family: 'Tw Cen MT';
            font-size: 9px;
            margin: 0;
            padding-top: 3.5cm;
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
            vertical-align: top; /* Asegura que el texto empiece desde la parte superior de la celda */
            word-wrap: break-word; /* Permite que el texto se ajuste dentro de la celda */
        }
        th {
            background-color: #f2f2f2;
        }
        .ministerio {
            font-size: 14px; /* Tamaño de letra aumentado */
        }

        /* Especifica un ancho máximo para la columna problemática para asegurar que el texto se ajuste */
        .numero-referencia {
            max-width: 200px; /* Ajusta este valor según sea necesario */
            word-wrap: break-word;
            vertical-align: top;
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
@foreach(array_chunk($datos, 22) as $pagina => $bloqueDatos)
    @if($pagina > 0)
        <div style="page-break-before: always;"></div>
    @endif
    <div style="display: table; width: 100%;">
        <div style="display: table-cell; width: 80%;">
            <h4 class="ministerio" style="margin: 0;"> <!-- Agregando la clase "ministerio" -->
                MINISTERIO DE SALUD PUBLICA Y ASISTENCIA SOCIAL<br>
                DIRECCION DEPARTAMENTAL DE REDES INTEGRADAS DE SERVICIOS DE SALUD DE TOTONICAPAN<br>
                DEPENDENCIA: {{ $localidad }}<br>
                PRODUCTO: {{ $nombreProducto }}
            </h4>
        </div>
        <div style="display: table-cell; vertical-align: top; text-align: right;">
            <img src="{{ public_path('images/nivel_seguridad.png') }}" style="height: 100px;" alt="Niveles de Seguridad">
        </div>
    </div>

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
