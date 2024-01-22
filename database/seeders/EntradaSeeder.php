<?php

namespace Database\Seeders;

use App\Models\Entrada;
use Illuminate\Database\Seeder;

class EntradaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Entrada::factory()
            ->count(5)
            ->create();
    }
}
