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
            $table->integer('role_id')->unsigned()->nullable();
            $table->string('nume_angajat', 50)->nullable();
            $table->string('prenume_angajat', 50)->nullable();
            $table->string('CNP', 13)->nullable();
            $table->string('actDeIdentitate', 10)->nullable();
            $table->string('nr', 6)->nullable();
            $table->date('dataEliberarii')->format('d/m/Y')->nullable();
            $table->string('domiciliul', 25)->nullable();
            $table->string('strada', 50)->nullable();
            $table->string('nrStrada', 10)->nullable();
            $table->string('apartament', 4)->nullable();
            $table->string('sector', 35)->nullable();
            $table->date('data_inceput_ang')->format('d/m/Y')->useCurrent()->nullable();
            $table->date('data_semnare_contract')->format('d/m/Y')->useCurrent()->nullable();

            $table->foreign('role_id')->references('role_id')->on('roles')->onDelete('cascade');
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
