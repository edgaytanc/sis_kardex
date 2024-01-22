@php $editing = isset($producto) @endphp

<div class="row">
    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.select name="categoria" label="Categoria">
            @php $selected = old('categoria', ($editing ? $producto->categoria : '')) @endphp
            <option value="Medicamento" {{ $selected == 'Medicamento' ? 'selected' : '' }} >Medicamento</option>
            <option value="Equipo quirurgico" {{ $selected == 'Equipo quirurgico' ? 'selected' : '' }} >Equipo quirurgico</option>
            <option value="Suministros" {{ $selected == 'Suministros' ? 'selected' : '' }} >Suministros</option>
        </x-inputs.select>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="nombre"
            label="Nombre"
            :value="old('nombre', ($editing ? $producto->nombre : ''))"
            maxlength="255"
            placeholder="Nombre"
            required
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="presentacion"
            label="Presentacion"
            :value="old('presentacion', ($editing ? $producto->presentacion : ''))"
            maxlength="255"
            placeholder="Presentacion"
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="concentracion"
            label="Concentracion"
            :value="old('concentracion', ($editing ? $producto->concentracion : ''))"
            maxlength="255"
            placeholder="Concentracion"
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="envase"
            label="Envase"
            :value="old('envase', ($editing ? $producto->envase : ''))"
            maxlength="255"
            placeholder="Envase"
        ></x-inputs.text>
    </x-inputs.group>

    <x-inputs.group class="col-sm-12 col-lg-6">
        <x-inputs.text
            name="unidad_medida"
            label="Unidad Medida"
            :value="old('unidad_medida', ($editing ? $producto->unidad_medida : ''))"
            maxlength="255"
            placeholder="Unidad Medida"
        ></x-inputs.text>
    </x-inputs.group>
</div>
