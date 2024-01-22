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
        Schema::create('salidas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('entrada_id');
            $table->string('nombre_producto');
            $table->date('fecha');
            $table->string('numero_referencia');
            $table->unsignedBigInteger('destinatario_id');
            $table->date('fecha_vencimiento')->nullable();
            $table->string('lote_salida')->nullable();
            $table->integer('cantidad_salida');
            $table->integer('reajuste_negativo')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('salidas');
    }
};
