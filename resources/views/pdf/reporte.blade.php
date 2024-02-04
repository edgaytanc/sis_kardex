<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reporte de Kardex</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
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
            @foreach($datos as $dato)
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
            @endforeach
        </tbody>
    </table>
</body>
</html>
