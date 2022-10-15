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
        Schema::create('driving_licenses', function (Blueprint $table) {
            $table->id();
            $table->integer('employee_id');
            $table->integer('license_type_id');
            $table->string('nume_angajat', 50);
            $table->string('prenume_angajat', 50);
            $table->date('data_nasterii')->format('d/m/Y');
            $table->string('locul_nasterii', 50);
            $table->date('data_emiterii')->format('d/m/Y');
            $table->date('data_expirarii')->format('d/m/Y');
            $table->string('autoritatea_emiterii', 50);
            $table->string('CNP', 13);
            $table->string('Nr_permis', 10);
            $table->boolean('permis_suspendat');

            $table->foreign('employee_id')->references('employee_id')->on('employees');
            $table->foreign('license_type_id')->references('license_type_id')->on('license_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('driving_licenses');
    }
};
