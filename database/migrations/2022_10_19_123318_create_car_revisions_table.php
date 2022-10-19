<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('car_revisions', function (Blueprint $table) {
            $table->id('Id_revizie');
            $table->integer('car_id');
            $table->boolean('StareMotor');
            $table->boolean('StareLumini');
            $table->boolean('StareSuspensii');
            $table->boolean('StareAmortizor');
            $table->boolean('StareFrana');
            $table->boolean('StareSistemElectric');
            $table->boolean('StareDotari');
            $table->boolean('StareCauciucuri');
             $table->timestamp('data_emiterii')->useCurrent();

            $table->foreign('car_id')->references('car_id')->on('cars');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('car_revisions');
    }
};
