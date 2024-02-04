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
        $table->integer('cantidad_actual')->after('cantidad_salida')->nullable();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down()
{
    Schema::table('salidas', function (Blueprint $table) {
        $table->dropColumn('cantidad_actual');
    });
}
};
