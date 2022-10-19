<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;


class RepairNotice extends Model
{
    use HasFactory;

    protected $primaryKey = 'Id_repair_notice';
    public $timestamps = false;

    protected $fillable = [
        'car_id',
        'employee_id',
        'damage_info',
        'damage_cost',

    ];

    protected function serializeDate(DateTimeInterface $date) {
        return $date->format('Y-m-d H:i:s');
    }

}