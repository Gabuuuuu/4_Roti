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
        Schema::create('table_car_employee', function (Blueprint $table) {
            $table->integer('car_id')->unsigned();
            $table->integer('employee_id')->unsigned();

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
        Schema::dropIfExists('table_car_employee');
    }
};
