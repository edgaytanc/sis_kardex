<?php

namespace Tests\Feature\Controllers;

use App\Models\User;
use App\Models\Remitente;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RemitenteControllerTest extends TestCase
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
    public function it_displays_index_view_with_remitentes(): void
    {
        $remitentes = Remitente::factory()
            ->count(5)
            ->create();

        $response = $this->get(route('remitentes.index'));

        $response
            ->assertOk()
            ->assertViewIs('app.remitentes.index')
            ->assertViewHas('remitentes');
    }

    /**
     * @test
     */
    public function it_displays_create_view_for_remitente(): void
    {
        $response = $this->get(route('remitentes.create'));

        $response->assertOk()->assertViewIs('app.remitentes.create');
    }

    /**
     * @test
     */
    public function it_stores_the_remitente(): void
    {
        $data = Remitente::factory()
            ->make()
            ->toArray();

        $response = $this->post(route('remitentes.store'), $data);

        $this->assertDatabaseHas('remitentes', $data);

        $remitente = Remitente::latest('id')->first();

        $response->assertRedirect(route('remitentes.edit', $remitente));
    }

    /**
     * @test
     */
    public function it_displays_show_view_for_remitente(): void
    {
        $remitente = Remitente::factory()->create();

        $response = $this->get(route('remitentes.show', $remitente));

        $response
            ->assertOk()
            ->assertViewIs('app.remitentes.show')
            ->assertViewHas('remitente');
    }

    /**
     * @test
     */
    public function it_displays_edit_view_for_remitente(): void
    {
        $remitente = Remitente::factory()->create();

        $response = $this->get(route('remitentes.edit', $remitente));

        $response
            ->assertOk()
            ->assertViewIs('app.remitentes.edit')
            ->assertViewHas('remitente');
    }

    /**
     * @test
     */
    public function it_updates_the_remitente(): void
    {
        $remitente = Remitente::factory()->create();

        $data = [
            'nombre' => $this->faker->text(255),
        ];

        $response = $this->put(route('remitentes.update', $remitente), $data);

        $data['id'] = $remitente->id;

        $this->assertDatabaseHas('remitentes', $data);

        $response->assertRedirect(route('remitentes.edit', $remitente));
    }

    /**
     * @test
     */
    public function it_deletes_the_remitente(): void
    {
        $remitente = Remitente::factory()->create();

        $response = $this->delete(route('remitentes.destroy', $remitente));

        $response->assertRedirect(route('remitentes.index'));

        $this->assertModelMissing($remitente);
    }
}
