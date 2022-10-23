<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;


class DrivingLicense extends Model
{
    use HasFactory;

    protected $primaryKey = 'driving_license_id';
    public $timestamps = false;

    protected $fillable = [
        'employee_id',
        'license_type_id',
        'nume_angajat',
        'prenume_angajat',
        'data_nasterii',
        'locul_nasterii',
        'data_emiterii',
        'data_expirarii',
        'autoritatea_emiterii',
        'CNP',
        'Nr_permis',
        'permis_suspendat',



    ];

    protected function serializeDate(DateTimeInterface $date) {
        return $date->format('Y-m-d H:i:s');
    }

}