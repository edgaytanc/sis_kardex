<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class SalidaStoreRequest extends FormRequest
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
            
            'nombre_producto' => ['required', 'max:255', 'string'],
            'fecha' => ['required', 'date'],
            'numero_referencia' => ['required', 'max:255', 'string'],
            'destinatario_id' => ['required', 'exists:destinatarios,id'],
            'fecha_vencimiento' => ['nullable', 'date'],
            'lote_salida' => ['nullable', 'max:255', 'string'],
            'cantidad_salida' => ['nullable', 'numeric'],
            'reajuste_negativo' => ['nullable', 'numeric'],
        ];
    }
}
