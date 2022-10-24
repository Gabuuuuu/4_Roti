<?php

namespace App\Http\Controllers;

use App\Models\Fine;
use Illuminate\Http\Request;

class FineController extends Controller
{
    // all cars
    public function index()
    {
        $fines = Fine::all();

        return response()->json($fines);
    }

    // add car
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'employee_id' => 'required|string|max:255',
            'data_emiterii' => 'required|string|max:255',
            'pret_daune' => 'required|string|max:255',

        ]);

        $fine = new Fine([
            'employee_id' => $request->employee_id,
            'data_emiterii' => $request->data_emiterii,
            'pret_daune' => $request->pret_daune,

        ]);

        $fine->save();

        return response()->json('Fine successfully added');
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
     * @param  \App\Models\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function show(Fine $fine)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function edit(Fine $fine)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Fine $fine)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Fine  $fine
     * @return \Illuminate\Http\Response
     */
    public function destroy(Fine $fine)
    {
        //
    }
}
