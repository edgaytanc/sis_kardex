<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('salidas', function (Blueprint $table) {
            $table->decimal('precio_unitario', 8, 2)->nullable()->after('cantidad_salida');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('salidas', function (Blueprint $table) {
            $table->dropColumn('precio_unitario');
        });
    }
};
