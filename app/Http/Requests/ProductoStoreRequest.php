<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductoStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return [
            'categoria' => [
                'required',
                'in:Medicamento,Equipo quirurgico,Suministros,DONACIONES y traslados,BIOLOGICOS,Repuestos',
            ],
            'nombre' => ['required', 'max:255', 'string'],
            'presentacion' => ['nullable', 'max:255', 'string'],
            'concentracion' => ['nullable', 'max:255', 'string'],
            'envase' => ['nullable', 'max:255', 'string'],
            'unidad_medida' => ['nullable', 'max:255', 'string'],
        ];
    }
}
