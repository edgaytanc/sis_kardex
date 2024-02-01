<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddUserIdToDestinatariosTable extends Migration
{
     /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('destinatarios', function (Blueprint $table) {
            $table->unsignedBigInteger('id_user')->nullable();

            // Si ya tienes relaciones y quieres asegurar la integridad referencial:
            $table->foreign('id_user')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('destinatarios', function (Blueprint $table) {
            $table->dropForeign(['id_user']);
            $table->dropColumn('id_user');
        });
    }
};