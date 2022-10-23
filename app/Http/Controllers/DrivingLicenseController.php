<?php

namespace App\Http\Controllers;

use App\Models\DrivingLicense;
use Illuminate\Http\Request;

class DrivingLicenseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     public function index()
    {
        $drivinglicenses = DrivingLicense::all();

        return response()->json($drivinglicenses);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
        public function store(Request $request)
    {
        $validatedData = $request->validate([
            'employee_id' => 'required|string|max:255',
            'license_type_id' => 'required|string|max:255',
            'nume_angajat' => 'required|string|max:255',
            'prenume_angajat' => 'required|string|max:255',
            'data_nasterii' => 'required',
            'locul_nasterii' => 'required|string|max:255',
            'autoritatea_emiterii' => 'required|string|max:255',
            'CNP' => 'required|string|max:255',
            'Nr_permis' => 'required|string|max:255',
        ]);

        $drivinglicense = new DrivingLicense([
            'employee_id' => $request->employee_id,
            'license_type_id' => $request->license_type_id,
            'nume_angajat' => $request->nume_angajat,
            'prenume_angajat' => $request->prenume_angajat,
            'data_nasterii'=> $request->data_nasterii,
            'locul_nasterii' => $request->locul_nasterii,
            'data_emiterii' => $request->data_emiterii,
            'data_expirarii' => $request->data_expirarii,
            'autoritatea_emiterii' => $request->autoritatea_emiterii,
            'CNP' => $request->CNP,
            'Nr_permis' => $request->Nr_permis,
            'permis_suspendat' => 0,
        ]);

        $drivinglicense->save();

        return response()->json('Driving License successfully added');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\DrivingLicense  $drivingLicense
     * @return \Illuminate\Http\Response
     */
    public function show(DrivingLicense $drivingLicense)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\DrivingLicense  $drivingLicense
     * @return \Illuminate\Http\Response
     */
    public function edit(DrivingLicense $drivingLicense)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\DrivingLicense  $drivingLicense
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, DrivingLicense $drivingLicense)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\DrivingLicense  $drivingLicense
     * @return \Illuminate\Http\Response
     */
    public function destroy(DrivingLicense $drivingLicense)
    {
        //
    }
}
