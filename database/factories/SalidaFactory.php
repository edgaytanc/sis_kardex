<?php

namespace Database\Factories;

use App\Models\Salida;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

class SalidaFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Salida::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'nombre_producto' => $this->faker->text(255),
            'fecha' => $this->faker->date(),
            'numero_referencia' => $this->faker->text(255),
            'fecha_vencimiento' => $this->faker->date(),
            'lote_salida' => $this->faker->text(255),
            'cantidad_salida' => $this->faker->randomNumber(0),
            'reajuste_negativo' => $this->faker->randomNumber(0),
            'destinatario_id' => \App\Models\Destinatario::factory(),
            'entrada_id' => \App\Models\Entrada::factory(),
        ];
    }
}
