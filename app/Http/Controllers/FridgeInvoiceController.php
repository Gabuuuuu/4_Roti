<?php

namespace App\Http\Controllers;

use App\Models\FridgeInvoice;
use Illuminate\Http\Request;
use DB;
use Image;

class FridgeInvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $fridgeInvoicesDetails = [];
        $fridgeInvoicesDetails[0] = FridgeInvoice::all();
        $fridgeInvoicesDetails[1] = DB::select('SELECT * FROM suppliers');
        return response()->json($fridgeInvoicesDetails);
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
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\FridgeInvoice  $fridgeInvoice
     * @return \Illuminate\Http\Response
     */
    public function show(FridgeInvoice $fridgeInvoice)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\FridgeInvoice  $fridgeInvoice
     * @return \Illuminate\Http\Response
     */
    public function edit(FridgeInvoice $fridgeInvoice)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\FridgeInvoice  $fridgeInvoice
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FridgeInvoice $fridgeInvoice)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\FridgeInvoice  $fridgeInvoice
     * @return \Illuminate\Http\Response
     */
    public function destroy(FridgeInvoice $fridgeInvoice)
    {
        //
    }

    public function loadFridgeInvoice ($id) {
        $fridgeInvoiceDetails = FridgeInvoice::where('fridge_invoice_id', $id)->first();

        return response()->json($fridgeInvoiceDetails);
    }

    public function loadFridges () {
        $frigdeData = [];
        $fridgeData[0] = DB::select('SELECT * FROM suppliers');
        $fridgeData[1] = DB::select('SELECT * FROM fridge_models');

        return response()->json($fridgeData);
    }

    public function fridgeSuppliers () {
        $suppliers = DB::select('SELECT * FROM suppliers');

        return response()->json($suppliers);
    }

    public function addNewFridgeModel (Request $request) {
        $validatedData = $request->validate([
            'supplier_id' => 'required|integer|max:11',
            'denumire_model' => 'required|string|max:50',
            'an_fabricatie' => 'required|date',
            'greutate' => 'required|string|max:3',
            'marime' => 'required|string|max:50',
            'consum_energetic' => 'required|string|max:10',
            'calitate' => 'required|string|max:2',
            'volum' => 'required|string|max:10',
            'pret' => 'required|string|max:10',
            'file' => 'required|mimes:jpg,jpeg,png,csv,txt,xlx,xls,pdf|max:2048',
        ]);

        if($request->hasfile('file')) {
            $image = $request->file('file');
            $imageName = time() . '.' . $image->getClientOriginalExtension();

            $fridgeModel = DB::table('fridge_models')->insert([
                'supplier_id' => $request->supplier_id,
                'denumire_model' => $request->denumire_model,
                'an_fabricatie' => $request->an_fabricatie,
                'greutate' => $request->greutate,
                'marime'=> $request->marime,
                'consum_energetic' => $request->consum_energetic,
                'calitate' => $request->calitate,
                'volum' => $request->volum,
                'pret' => $request->pret,
                'image' => $imageName,
            ]);

            Image::make($image)->resize(500, 500)->save(public_path('/images/fridges/' . $imageName));

            $fridgeModel = DB::table('fridge_invoices')->insert([
                'supplier_id' => $request->supplier_id,
                'denumire_model' => $request->denumire_model,
                'pret' => $request->pret,
                'cantitate' => $request->volum,
                'data_emiterii' => date('Y-m-d H:i:s'),
            ]);

            return response()->json('Fridge successfully added');
        }

    }

}
