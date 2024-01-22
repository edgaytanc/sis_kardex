<?php

namespace Tests\Feature\Controllers;

use App\Models\User;
use App\Models\Destinatario;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class DestinatarioControllerTest extends TestCase
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
    public function it_displays_index_view_with_destinatarios(): void
    {
        $destinatarios = Destinatario::factory()
            ->count(5)
            ->create();

        $response = $this->get(route('destinatarios.index'));

        $response
            ->assertOk()
            ->assertViewIs('app.destinatarios.index')
            ->assertViewHas('destinatarios');
    }

    /**
     * @test
     */
    public function it_displays_create_view_for_destinatario(): void
    {
        $response = $this->get(route('destinatarios.create'));

        $response->assertOk()->assertViewIs('app.destinatarios.create');
    }

    /**
     * @test
     */
    public function it_stores_the_destinatario(): void
    {
        $data = Destinatario::factory()
            ->make()
            ->toArray();

        $response = $this->post(route('destinatarios.store'), $data);

        $this->assertDatabaseHas('destinatarios', $data);

        $destinatario = Destinatario::latest('id')->first();

        $response->assertRedirect(route('destinatarios.edit', $destinatario));
    }

    /**
     * @test
     */
    public function it_displays_show_view_for_destinatario(): void
    {
        $destinatario = Destinatario::factory()->create();

        $response = $this->get(route('destinatarios.show', $destinatario));

        $response
            ->assertOk()
            ->assertViewIs('app.destinatarios.show')
            ->assertViewHas('destinatario');
    }

    /**
     * @test
     */
    public function it_displays_edit_view_for_destinatario(): void
    {
        $destinatario = Destinatario::factory()->create();

        $response = $this->get(route('destinatarios.edit', $destinatario));

        $response
            ->assertOk()
            ->assertViewIs('app.destinatarios.edit')
            ->assertViewHas('destinatario');
    }

    /**
     * @test
     */
    public function it_updates_the_destinatario(): void
    {
        $destinatario = Destinatario::factory()->create();

        $data = [
            'nombre' => $this->faker->text(255),
        ];

        $response = $this->put(
            route('destinatarios.update', $destinatario),
            $data
        );

        $data['id'] = $destinatario->id;

        $this->assertDatabaseHas('destinatarios', $data);

        $response->assertRedirect(route('destinatarios.edit', $destinatario));
    }

    /**
     * @test
     */
    public function it_deletes_the_destinatario(): void
    {
        $destinatario = Destinatario::factory()->create();

        $response = $this->delete(
            route('destinatarios.destroy', $destinatario)
        );

        $response->assertRedirect(route('destinatarios.index'));

        $this->assertModelMissing($destinatario);
    }
}
