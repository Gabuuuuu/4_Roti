<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;


class Fine extends Model
{
    use HasFactory;
        use HasFactory;

    protected $primaryKey = 'fine_id';
    public $timestamps = false;

    protected $fillable = [
        'employee_id',
        'data_emiterii',
        'pret_daune',

    ];

    protected function serializeDate(DateTimeInterface $date) {
        return $date->format('Y-m-d H:i:s');
    }

}
