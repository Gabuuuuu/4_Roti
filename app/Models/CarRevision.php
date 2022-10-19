<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;


class CarRevision extends Model
{
    use HasFactory;

    protected $primaryKey = 'id_revizie';
    public $timestamps = false;

    protected $fillable = [
        'car_id',
        'StareMotor',
        'StareLumini',
        'StareSuspensii',
        'StareAmortizor',
        'StareFrana',
        'StareSistemElectric',
        'StareDotari',
        'StareCauciucuri',

    ];

    protected function serializeDate(DateTimeInterface $date) {
        return $date->format('Y-m-d H:i:s');
    }

}