<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('productos', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->enum('categoria', [
                'Medicamento',
                'Equipo quirurgico',
                'Suministros',
            ]);
            $table->string('nombre');
            $table->string('presentacion')->nullable();
            $table->string('concentracion')->nullable();
            $table->string('envase')->nullable();
            $table->string('unidad_medida')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('productos');
    }
};
