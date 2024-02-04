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
    Schema::table('entradas', function (Blueprint $table) {
        $table->decimal('precio', 8, 2)->after('cantidad_actual')->nullable();
    });
}

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('entradas', function (Blueprint $table) {
            $table->dropColumn('precio');
        });
    }
};
