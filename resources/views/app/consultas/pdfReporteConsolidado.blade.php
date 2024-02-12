<!DOCTYPE html>
<html>
<head>
    <title>Reporte Consolidado Kardex</title>
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
    <h3>DIRECCIÓN DEPARTAMENTAL<BR>
        DIRECCIÓN DE ÁREA DE SALUD DE TOTONICAPÁN<BR>
        REGISTRO DE INVENTARIO FÍSICO<BR></h3>
    <br>

    <table style="width: 100%; border-collapse: collapse;">
        <tr>
            <!-- Columna 1: Mes -->
            <td style="width: 33%; text-align: left; padding: 5px; border:0;">
                Mes: {{$mes}}
            </td>

            <!-- Columna 2: Año -->
            <td style="width: 33%; text-align: center; padding: 5px; border:0;">
                Año: {{$anio}}
            </td>

            <!-- Columna 3: Categoría -->
            <td style="width: 33%; text-align: right; padding: 5px; border:0;">
                Categoría: {{$categoria}}
            </td>
        </tr>
    </table>

    <br>
    <table>
        <thead>
            <tr>
                <th>No.</th>
                <th>Medicamento / Insumos</th>
                <th>Conteo Fisico</th>
                <th>Fecha Vencimiento</th>
                <th>Lote</th>
                <th>Fecha Kardex</th>
                <th>Saldo</th>
            </tr>
        </thead>
        <tbody>
            @foreach($datos as $dato)
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $dato->Medicamento }}</td>
                    <td></td>
                    <td>{{ $dato->FechaVencimiento }}</td>
                    <td>{{ $dato->Lote }}</td>
                    <td>{{ $dato->FechaKardex }}</td>
                    <td>{{ $dato->Saldo }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
