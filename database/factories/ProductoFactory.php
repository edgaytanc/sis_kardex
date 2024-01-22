<?php

namespace Database\Factories;

use App\Models\Producto;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductoFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Producto::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'categoria' => 'Medicamento',
            'nombre' => $this->faker->text(255),
            'presentacion' => $this->faker->text(255),
            'concentracion' => $this->faker->text(255),
            'envase' => $this->faker->text(255),
            'unidad_medida' => $this->faker->text(255),
        ];
    }
}
