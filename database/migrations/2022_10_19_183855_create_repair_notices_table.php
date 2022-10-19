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
        Schema::create('repair_notices', function (Blueprint $table) {
            $table->id('Id_repair_notice');
            $table->integer('car_id');
            $table->integer('employee_id');
            $table->string('damage_info' , 250);
            $table->string('damage_cost');
            $table->timestamp('data_emiterii')->useCurrent();

            $table->foreign('car_id')->references('car_id')->on('cars');
            $table->foreign('employee_id')->references('employee_id')->on('employees');


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('repair_notices');
    }
};
