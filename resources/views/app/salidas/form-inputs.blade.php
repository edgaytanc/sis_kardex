@php $editing = isset($salida) @endphp

<div class="row">


    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="entrada_id"
            label="Id Entrada"
            :value="old('id', ($editing ? $salida->entrada_id : ''))"
            maxlength="255"
            placeholder="Id Entrada"
            required
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="nombre_producto"
            label="Nombre Producto"
            :value="old('nombre_producto', ($editing ? $salida->nombre_producto : ''))"
            maxlength="255"
            placeholder="Nombre Producto"
            required
        ></x-inputs.text>
    </x-inputs.group>


    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.date
            name="fecha"
            label="Fecha"
            value="{{ old('fecha', ($editing ? optional($salida->fecha)->format('Y-m-d') : '')) }}"
            max="255"
            required
        ></x-inputs.date>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="numero_referencia"
            label="Numero Referencia"
            :value="old('numero_referencia', ($editing ? $salida->numero_referencia : ''))"
            maxlength="255"
            placeholder="Numero Referencia"
            required
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="destinatario"
            label="Destinatario"
            :value="old('destinatario', ($editing ? $salida->destinatario : ''))"
            maxlength="200"
            placeholder="destinatario"
            required>
        </x-inputs.select>
</x-inputs.group>


<x-inputs.group class="col-sm-12 col-lg-6">
    <x-inputs.date
        name="fecha_vencimiento"
        label="Fecha Vencimiento"
        :value="old('fecha_vencimiento', ($editing && $salida->fecha_vencimiento ? optional($salida->fecha_vencimiento)->format('Y-m-d') : null))"
        max="255"
        null-option="true"
    ></x-inputs.date>
</x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-4">
        <x-inputs.text
            name="lote_salida"
            label="Lote Salida"
            :value="old('lote_salida', ($editing ? $salida->lote_salida : ''))"
            maxlength="255"
            placeholder="Lote Salida"
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-4">
        <x-inputs.number
            name="cantidad_salida"
            label="Cantidad Salida"
            :value="old('cantidad_salida', ($editing ? $salida->cantidad_salida : ''))"
            max="10000000"
            step="0.01"
            placeholder="Cantidad Salida"
            :max="isset($cantidadDisponible) ? $cantidadDisponible : 0"
        ></x-inputs.number>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-4">
        <x-inputs.number
            name="reajuste_negativo"
            label="Reajuste Negativo"
            :value="old('reajuste_negativo', ($editing ? $salida->reajuste_negativo : ''))"
            max="10000000"
            step="0.01"
            placeholder="Reajuste Negativo"
        ></x-inputs.number>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.textarea
            name="observaciones"
            label="Observaciones"
            :value="old('observaciones', ($editing ? $salida->observaciones : ''))"
            rows="4"
            placeholder="Observaciones"
        ></x-inputs.textarea>
    </x-inputs.group>
</div>

