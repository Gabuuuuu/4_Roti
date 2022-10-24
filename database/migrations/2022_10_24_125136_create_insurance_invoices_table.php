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
        Schema::create('insurance_invoices', function (Blueprint $table) {
            $table->id('insurance_id');
            $table->integer('car_id');
            $table->integer('insurance_company_id');
            $table->integer('insurance_type_id');
            $table->date('Data_emiterii');
            $table->integer('Pret_asigurare');

            $table->foreign('car_id')->references('car_id')->on('cars');
            $table->foreign('insurance_company_id')->references('insurance_company_id')->on('insurance_companies');
            $table->foreign('insurance_type_id')->references('insurance_type_id')->on('insurance_types');


        });
    }


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('insurance_invoices');
    }
};
