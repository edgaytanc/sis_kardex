<?php

namespace Tests\Feature\Controllers;

use App\Models\User;
use App\Models\Salida;

use App\Models\Entrada;
use App\Models\Destinatario;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class SalidaControllerTest extends TestCase
{
    use RefreshDatabase, WithFaker;

    protected function setUp(): void
    {
        parent::setUp();

        $this->actingAs(
            User::factory()->create(['email' => 'admin@admin.com'])
        );

        $this->seed(\Database\Seeders\PermissionsSeeder::class);

        $this->withoutExceptionHandling();
    }

    /**
     * @test
     */
    public function it_displays_index_view_with_salidas(): void
    {
        $salidas = Salida::factory()
            ->count(5)
            ->create();

        $response = $this->get(route('salidas.index'));

        $response
            ->assertOk()
            ->assertViewIs('app.salidas.index')
            ->assertViewHas('salidas');
    }

    /**
     * @test
     */
    public function it_displays_create_view_for_salida(): void
    {
        $response = $this->get(route('salidas.create'));

        $response->assertOk()->assertViewIs('app.salidas.create');
    }

    /**
     * @test
     */
    public function it_stores_the_salida(): void
    {
        $data = Salida::factory()
            ->make()
            ->toArray();

        $response = $this->post(route('salidas.store'), $data);

        $this->assertDatabaseHas('salidas', $data);

        $salida = Salida::latest('id')->first();

        $response->assertRedirect(route('salidas.edit', $salida));
    }

    /**
     * @test
     */
    public function it_displays_show_view_for_salida(): void
    {
        $salida = Salida::factory()->create();

        $response = $this->get(route('salidas.show', $salida));

        $response
            ->assertOk()
            ->assertViewIs('app.salidas.show')
            ->assertViewHas('salida');
    }

    /**
     * @test
     */
    public function it_displays_edit_view_for_salida(): void
    {
        $salida = Salida::factory()->create();

        $response = $this->get(route('salidas.edit', $salida));

        $response
            ->assertOk()
            ->assertViewIs('app.salidas.edit')
            ->assertViewHas('salida');
    }

    /**
     * @test
     */
    public function it_updates_the_salida(): void
    {
        $salida = Salida::factory()->create();

        $destinatario = Destinatario::factory()->create();
        $entrada = Entrada::factory()->create();

        $data = [
            'nombre_producto' => $this->faker->text(255),
            'fecha' => $this->faker->date(),
            'numero_referencia' => $this->faker->text(255),
            'fecha_vencimiento' => $this->faker->date(),
            'lote_salida' => $this->faker->text(255),
            'cantidad_salida' => $this->faker->randomNumber(0),
            'reajuste_negativo' => $this->faker->randomNumber(0),
            'destinatario_id' => $destinatario->id,
            'entrada_id' => $entrada->id,
        ];

        $response = $this->put(route('salidas.update', $salida), $data);

        $data['id'] = $salida->id;

        $this->assertDatabaseHas('salidas', $data);

        $response->assertRedirect(route('salidas.edit', $salida));
    }

    /**
     * @test
     */
    public function it_deletes_the_salida(): void
    {
        $salida = Salida::factory()->create();

        $response = $this->delete(route('salidas.destroy', $salida));

        $response->assertRedirect(route('salidas.index'));

        $this->assertModelMissing($salida);
    }
}
