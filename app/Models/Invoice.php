<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;


class Invoice extends Model
{

    use HasFactory;

        protected $fillable = [
        'brand',
        'model',
        'priceday',
        'email',
        'cardname',
        'cardnumbers',
        'month',
        'ccv',
        'zip',
        'days',
        'total',
    ];

    protected function serializeDate(DateTimeInterface $date)
{
    return $date->format('Y-m-d H:i:s');
}


}
