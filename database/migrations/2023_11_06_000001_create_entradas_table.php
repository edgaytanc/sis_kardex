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
        Schema::create('entradas', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('producto_id');
            $table->date('fecha');
            $table->string('numero_referencia');
            $table->decimal('cantidad')->nullable();
            $table->decimal('precio_unitario')->nullable();
            $table->date('fecha_vencimiento')->nullable();
            $table->unsignedBigInteger('remitente_id');
            $table->string('numero_lote')->nullable();
            $table->integer('reajuste_positivo')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('entradas');
    }
};
