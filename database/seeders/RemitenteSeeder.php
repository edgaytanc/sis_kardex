<?php

namespace Database\Seeders;

use App\Models\Remitente;
use Illuminate\Database\Seeder;

class RemitenteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Remitente::factory()
            ->count(5)
            ->create();
    }
}
