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
        Schema::create('employees', function (Blueprint $table) {
            $table->id('employee_id');
            $table->integer('department_id')->unsigned();
            $table->string('nume_angajat', 50);
            $table->string('prenume_angajat', 50);
            $table->string('CNP', 13);
            $table->string('actDeIdentitate', 10);
            $table->string('nr', 6);
            $table->date('dataEliberarii')->format('d/m/Y');
            $table->string('domiciliul', 25);
            $table->string('strada', 50);
            $table->string('nrStrada', 10);
            $table->string('apartament', 4);
            $table->string('sector', 35);
            $table->date('data_inceput_ang')->format('d/m/Y')->useCurrent();
            $table->date('data_semnare_contract')->format('d/m/Y')->useCurrent();

            $table->foreign('department_id')->references('department_id')->on('departments')->onDelete('cascade');;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('employees');
    }
};
