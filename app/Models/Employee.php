<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
Use Illuminate\Support\Str;

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

    public function userHasRole($role_name) {
        foreach($this->roles as $role) {
            if(Str::lower($role_name) == Str::lower($role->name))
                return true;
        }
        return false;
    }
}
