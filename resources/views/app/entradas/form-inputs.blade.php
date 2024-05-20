@php $editing = isset($entrada) @endphp

<div class="row">
    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.select name="producto_id" label="Producto" required>
            @php $selected = old('producto_id', ($editing ? $entrada->producto_id : '')) @endphp
            <option disabled {{ empty($selected) ? 'selected' : '' }}>Please select the Producto</option>
            @foreach($productos as $id => $label)
                <option value="{{ $id }}" {{ $selected == $id ? 'selected' : '' }}>{{ $label }}</option>
            @endforeach
        </x-inputs.select>
    </x-inputs.group>
    
    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.date
            name="fecha"
            label="Fecha"
            value="{{ old('fecha', ($editing ? optional($entrada->fecha)->format('Y-m-d') : '')) }}"
            max="255"
            required
        ></x-inputs.date>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="numero_referencia"
            label="Numero Referencia"
            :value="old('numero_referencia', ($editing ? $entrada->numero_referencia : ''))"
            maxlength="255"
            placeholder="Numero Referencia"
            required
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.number
            name="cantidad"
            label="Cantidad"
            :value="old('cantidad', ($editing ? $entrada->cantidad : ''))"
            max="10000000"
            step="0.01"
            placeholder="Cantidad"
        ></x-inputs.number>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.number
            name="precio_unitario"
            label="Precio Unitario"
            :value="old('precio_unitario', ($editing ? $entrada->precio_unitario : ''))"
            max="10000000"
            step="0.01"
            placeholder="Precio Unitario"
        ></x-inputs.number>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.date
            name="fecha_vencimiento"
            label="Fecha Vencimiento"
            :value="old('fecha_vencimiento', ($editing ?? false) ? optional($entrada->fecha_vencimiento)->format('Y-m-d') : '')"
            max="255"
            null-option="true"
        ></x-inputs.date>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-4">
        <x-inputs.text
            name="remitente"
            label="Remitente"
            :value="old('remitente', ($editing ? $entrada->remitente : ''))"
            maxlength="200"
            placeholder="Remitente"
            required>
        </x-inputs.select>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-4">
        <x-inputs.text
            name="numero_lote"
            label="Numero Lote"
            :value="old('numero_lote', ($editing ? $entrada->numero_lote : ''))"
            maxlength="255"
            placeholder="Numero Lote"
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-4">
        <x-inputs.number
            name="reajuste_positivo"
            label="Reajuste Positivo"
            :value="old('reajuste_positivo', ($editing ? $entrada->reajuste_positivo : ''))"
            max="10000000"
            step="0.01"
            placeholder="Reajuste Positivo"
        ></x-inputs.number>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-12">
    <x-inputs.textarea
        name="observaciones"
        label="Observaciones"
        :value="old('observaciones', ($editing ? $entrada->observaciones : ''))"
        rows="4"
        placeholder="Observaciones"
        maxlength="46"
    ></x-inputs.textarea>
</x-inputs.group>
</div>
