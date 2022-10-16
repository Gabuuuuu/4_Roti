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
        Schema::create('fridge_invoices', function (Blueprint $table) {
            $table->id();
            $table->integer('supplier_id');
            $table->string('denumire_model', 50);
            $table->string('pret', 10);
            $table->string('cantitate', 10);
            $table->date('data_emiterii')->format('d/m/Y');

            $table->foreign('supplier_id')->references('supplier_id')->on('suppliers');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fridge_invoices');
    }
};
