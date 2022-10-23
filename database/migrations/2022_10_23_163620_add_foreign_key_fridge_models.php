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
        Schema::table('fridge_models', function (Blueprint $table) {
            $table->integer('supplier_id');

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
        Schema::table('fridge_models', function (Blueprint $table) {
            //
        });
    }
};
