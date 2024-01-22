<?php

namespace Tests\Feature\Controllers;

use App\Models\User;
use App\Models\Entrada;

use App\Models\Producto;
use App\Models\Remitente;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class EntradaControllerTest extends TestCase
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
    public function it_displays_index_view_with_entradas(): void
    {
        $entradas = Entrada::factory()
            ->count(5)
            ->create();

        $response = $this->get(route('entradas.index'));

        $response
            ->assertOk()
            ->assertViewIs('app.entradas.index')
            ->assertViewHas('entradas');
    }

    /**
     * @test
     */
    public function it_displays_create_view_for_entrada(): void
    {
        $response = $this->get(route('entradas.create'));

        $response->assertOk()->assertViewIs('app.entradas.create');
    }

    /**
     * @test
     */
    public function it_stores_the_entrada(): void
    {
        $data = Entrada::factory()
            ->make()
            ->toArray();

        $response = $this->post(route('entradas.store'), $data);

        $this->assertDatabaseHas('entradas', $data);

        $entrada = Entrada::latest('id')->first();

        $response->assertRedirect(route('entradas.edit', $entrada));
    }

    /**
     * @test
     */
    public function it_displays_show_view_for_entrada(): void
    {
        $entrada = Entrada::factory()->create();

        $response = $this->get(route('entradas.show', $entrada));

        $response
            ->assertOk()
            ->assertViewIs('app.entradas.show')
            ->assertViewHas('entrada');
    }

    /**
     * @test
     */
    public function it_displays_edit_view_for_entrada(): void
    {
        $entrada = Entrada::factory()->create();

        $response = $this->get(route('entradas.edit', $entrada));

        $response
            ->assertOk()
            ->assertViewIs('app.entradas.edit')
            ->assertViewHas('entrada');
    }

    /**
     * @test
     */
    public function it_updates_the_entrada(): void
    {
        $entrada = Entrada::factory()->create();

        $remitente = Remitente::factory()->create();
        $producto = Producto::factory()->create();

        $data = [
            'fecha' => $this->faker->date(),
            'numero_referencia' => $this->faker->text(255),
            'cantidad' => $this->faker->randomNumber(1),
            'precio_unitario' => $this->faker->randomNumber(1),
            'fecha_vencimiento' => $this->faker->date(),
            'numero_lote' => $this->faker->text(255),
            'reajuste_positivo' => $this->faker->randomNumber(0),
            'remitente_id' => $remitente->id,
            'producto_id' => $producto->id,
        ];

        $response = $this->put(route('entradas.update', $entrada), $data);

        $data['id'] = $entrada->id;

        $this->assertDatabaseHas('entradas', $data);

        $response->assertRedirect(route('entradas.edit', $entrada));
    }

    /**
     * @test
     */
    public function it_deletes_the_entrada(): void
    {
        $entrada = Entrada::factory()->create();

        $response = $this->delete(route('entradas.destroy', $entrada));

        $response->assertRedirect(route('entradas.index'));

        $this->assertModelMissing($entrada);
    }
}
