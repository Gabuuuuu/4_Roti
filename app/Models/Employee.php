<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
Use Illuminate\Support\Str;
use App\Models\Department;
use App\Models\User;
use App\Models\Role;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = [
        'employee_id',
        'nume_angajat',
        'prenume_angajat',
        'CNP',
        'actDeIdentitate',
        'nr',
        'dataEliberarii',
        'domiciliul',
        'strada',
        'nrStrada',
        'apartament',
        'sector',
        'data_inceput_ang',
        'data_semnare_contract'
    ];

    public function department() {
        return $this->belongsTo(Department::class);
    }

    public function roles() {
        return $this->belongsTo(Role::class);
    }

    public function users() {
        return $this->belongsMany(User::class);
    }
}
