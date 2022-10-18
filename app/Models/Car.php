<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Car extends Model
{
    use HasFactory;

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
        'oferit_de',
        'daune',
    ];
}