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
        Schema::create('fridge_models', function (Blueprint $table) {
            $table->id();
            $table->string('denumire_model', 50);
            $table->date('an_fabricatie')->format('d/m/Y');
            $table->string('greutate', 3);
            $table->string('marime', 50);
            $table->string('consum_energetic', 10);
            $table->string('calitate', 2);
            $table->string('volum', 10);
            $table->string('pret', 10);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fridge_models');
    }
};
