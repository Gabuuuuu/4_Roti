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
        Schema::create('delivered_fridges_invoices', function (Blueprint $table) {
            $table->id();
            $table->integer('fridge_id');
            $table->string('nume_beneficiar', 50);
            $table->string('nr_telefon', 11);
            $table->string('adresa_livrare', 50);
            $table->string('cod_postal', 50);
            $table->string('cantitate', 10);
            $table->string('taxa_livrare', 10);
            $table->string('pret', 10);
            $table->string('pret_total', 10);
            $table->date('data_emiterii')->format('d/m/Y');

            $table->foreign('fridge_id')->references('fridge_id')->on('fridges');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('delivered_fridges_invoices');
    }
};
