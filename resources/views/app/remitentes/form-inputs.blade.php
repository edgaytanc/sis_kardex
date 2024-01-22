@php $editing = isset($remitente) @endphp

<div class="row">
    <x-inputs.group class="col-sm-12">
        <x-inputs.text
            name="nombre"
            label="Nombre"
            :value="old('nombre', ($editing ? $remitente->nombre : ''))"
            maxlength="255"
            placeholder="Nombre"
            required
        ></x-inputs.text>
    </x-inputs.group>
</div>
