<?php

namespace Tests\Feature\Controllers;

use App\Models\User;
use App\Models\Producto;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ProductoControllerTest extends TestCase
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
    public function it_displays_index_view_with_productos(): void
    {
        $productos = Producto::factory()
            ->count(5)
            ->create();

        $response = $this->get(route('productos.index'));

        $response
            ->assertOk()
            ->assertViewIs('app.productos.index')
            ->assertViewHas('productos');
    }

    /**
     * @test
     */
    public function it_displays_create_view_for_producto(): void
    {
        $response = $this->get(route('productos.create'));

        $response->assertOk()->assertViewIs('app.productos.create');
    }

    /**
     * @test
     */
    public function it_stores_the_producto(): void
    {
        $data = Producto::factory()
            ->make()
            ->toArray();

        $response = $this->post(route('productos.store'), $data);

        $this->assertDatabaseHas('productos', $data);

        $producto = Producto::latest('id')->first();

        $response->assertRedirect(route('productos.edit', $producto));
    }

    /**
     * @test
     */
    public function it_displays_show_view_for_producto(): void
    {
        $producto = Producto::factory()->create();

        $response = $this->get(route('productos.show', $producto));

        $response
            ->assertOk()
            ->assertViewIs('app.productos.show')
            ->assertViewHas('producto');
    }

    /**
     * @test
     */
    public function it_displays_edit_view_for_producto(): void
    {
        $producto = Producto::factory()->create();

        $response = $this->get(route('productos.edit', $producto));

        $response
            ->assertOk()
            ->assertViewIs('app.productos.edit')
            ->assertViewHas('producto');
    }

    /**
     * @test
     */
    public function it_updates_the_producto(): void
    {
        $producto = Producto::factory()->create();

        $data = [
            'categoria' => 'Medicamento',
            'nombre' => $this->faker->text(255),
            'presentacion' => $this->faker->text(255),
            'concentracion' => $this->faker->text(255),
            'envase' => $this->faker->text(255),
            'unidad_medida' => $this->faker->text(255),
        ];

        $response = $this->put(route('productos.update', $producto), $data);

        $data['id'] = $producto->id;

        $this->assertDatabaseHas('productos', $data);

        $response->assertRedirect(route('productos.edit', $producto));
    }

    /**
     * @test
     */
    public function it_deletes_the_producto(): void
    {
        $producto = Producto::factory()->create();

        $response = $this->delete(route('productos.destroy', $producto));

        $response->assertRedirect(route('productos.index'));

        $this->assertModelMissing($producto);
    }
}
