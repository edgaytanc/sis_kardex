{{-- resources/views/app/consultas/mostrar_datos.blade.php --}}

@extends('layouts.app')

@section('content')
<div class="container">
    <h4>MINISTERIO DE SALUD PUBLICA Y ASISTENCIA SOCIAL<BR>
        DIRECCION DEPARTAMENTAL DE REDES INTEGRADAS DE SERVICIOS DE SALUD DE TOTONICAPAN<BR>
        DEPENDENCIA: {{$localidad}} <BR>
        PRODUCTO: {{ $nombreProducto }} <BR>

    </h4>
    {{-- <h1>Reporte de Kardex - {{ $nombreProducto }}</h1> --}}
    <table class="table table-bordered">
        <thead>
            <tr>
                <th >FECHA dd/mm/aa</th>
                <th >NUMERO DE REFERENCIA</th>
                <th >REMITENTE/DESTINATARIO</th>
                <th >CANTIDAD ENTRADA</th>
                <th >PRECIO UNITARIO</th>
                <th >VALOR TOTAL</th>
                <th >FECHA VENCIMIENTO</th>
                <th >NUMERO LOTE</th>
                <th >CANTIDAD SALIDA</th>
                <th >REAJUSTE(+)(-)</th>
                <th >CANTIDAD TOTAL</th>
                <th >PRECIO</th>
            </tr>
        </thead>
        <tbody>
            @forelse($datos as $dato)
                <tr>
                    <td class="p-1">{{ $dato->Fecha }}</td>
                    <td class="p-1">{{ $dato->Numero_de_referencia }}</td>
                    <td class="p-1">{{ $dato->Remitente_Destinatario }}</td>
                    <td class="p-1">{{ $dato->Cantidad_Entrada }}</td>
                    <td class="p-1">{{ $dato->Precio_Unitario }}</td>
                    <td class="p-1">{{ $dato->Valor_Total }}</td>
                    <td class="p-1">{{ $dato->Fecha_vencimiento }}</td>
                    <td class="p-1">{{ $dato->Numero_Lote }}</td>
                    <td class="p-1">{{ $dato->Cantidad_Salida }}</td>
                    <td class="p-1">{{ $dato->Reajuste }}</td>
                    <td class="p-1">{{ $dato->Cantidad_Total}}</td>
                    <td class="p-1">{{ $dato->Precio}}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="10">No hay datos disponibles.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
    <a href="{{ route('reporte_pdf', ['productoId' => $productoId, 'userId' => $userId]) }}" class="btn btn-primary">Descargar PDF</a>

</div>
@endsection
