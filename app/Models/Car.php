<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;

class Car extends Model
{
    use HasFactory;

    protected $primaryKey = 'car_id';
    public $timestamps = false;

    protected $fillable = [
        'department_id',
        'car_type_id',
        'marca',
        'model',
        'an',
        'km',
        'putere',
        'combustibil',
        'nr_portiere',
        'transmisie',
        'vin',
        'culoare',
        'pret_curent',
        'pret_achizitie',
        'oferit_de',
        'daune',
    ];

    protected function serializeDate(DateTimeInterface $date) {
        return $date->format('Y-m-d H:i:s');
    }

}