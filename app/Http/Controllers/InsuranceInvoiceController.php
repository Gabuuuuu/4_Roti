<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\InsuranceInvoice;
use DB;



class InsuranceInvoiceController extends Controller
{
    // all cars
    public function index()
    {
        $insuranceinvoice = InsuranceInvoice::all();

        return response()->json($insuranceinvoice);
    }

    // add car
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'car_id' => 'required|string|max:255',
            'insurance_company_id' => 'required|string|max:255',
            'insurance_type_id' => 'required|string|max:255',
            'Data_emiterii' => 'required|string|max:255',
            'Pret_asigurare' => 'required|string|max:255',


        ]);

        $insuranceinvoice = new InsuranceInvoice([
            'car_id' => $request->car_id,
            'insurance_company_id' => $request->insurance_company_id,
            'insurance_type_id' => $request->insurance_type_id,
            'Data_emiterii' => $request->Data_emiterii,
            'Pret_asigurare'=> $request->Pret_asigurare,
        ]);

        $insuranceinvoice->save();

        return response()->json('Invoice successfully added');
    }
    public function getCompanyId() {
        $company = DB::select('SELECT * FROM insurance_companies');

        return response()->json($company);
    }

        public function getInsuranceType() {
        $insurance = DB::select('SELECT * FROM insurance_types');

        return response()->json($insurance);
    }
}
