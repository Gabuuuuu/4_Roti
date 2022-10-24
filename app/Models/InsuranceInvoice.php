<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;


class InsuranceInvoice extends Model
{
    use HasFactory;

    protected $primaryKey = 'insurance_id';
    public $timestamps = false;

    protected $fillable = [
        'car_id',
        'insurance_company_id',
        'insurance_type_id',
        'Data_emiterii',
        'Pret_asigurare',

    ];

    protected function serializeDate(DateTimeInterface $date) {
        return $date->format('Y-m-d H:i:s');
    }
}
