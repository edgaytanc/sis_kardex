<?php

namespace Database\Factories;

use App\Models\Entrada;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

class EntradaFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Entrada::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'fecha' => $this->faker->date(),
            'numero_referencia' => $this->faker->text(255),
            'cantidad' => $this->faker->randomNumber(1),
            'precio_unitario' => $this->faker->randomNumber(1),
            'fecha_vencimiento' => $this->faker->date(),
            'numero_lote' => $this->faker->text(255),
            'reajuste_positivo' => $this->faker->randomNumber(0),
            'remitente_id' => \App\Models\Remitente::factory(),
            'producto_id' => \App\Models\Producto::factory(),
        ];
    }
}
