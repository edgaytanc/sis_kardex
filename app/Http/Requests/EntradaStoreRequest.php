<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class EntradaStoreRequest extends FormRequest
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
            'producto_id' => ['required', 'exists:productos,id'],
            'fecha' => ['required', 'date'],
            'numero_referencia' => ['required', 'max:255', 'string'],
            'cantidad' => ['nullable', 'numeric'],
            'precio_unitario' => ['nullable', 'numeric'],
            'fecha_vencimiento' => ['nullable', 'date'],
            'remitente_id' => ['required', 'exists:remitentes,id'],
            'numero_lote' => ['nullable', 'max:255', 'string'],
            'reajuste_positivo' => ['nullable', 'numeric'],
        ];
    }
}
