<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Invoice;

class InvoiceController extends Controller
{
        // all Invoices
    public function index()
    {
        $invoices = Invoice::all();

        return response()->json($invoices);
    }

    // add Invoice
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'brand' => 'required|string|max:255',
            'model' => 'required|string|max:255',
            'price' => 'required|string|max:255',
            'email' => 'required|string|max:255',
            'cardname' => 'required|string|max:255',
            'cardnumbers' => 'required|string|max:16',
            'month' => 'required|string|max:5',
            'ccv' => 'required|string|max:3',
            'zip' => 'required|string|max:6',
            'days' => 'required|string|max:255',
            'total' => 'required|integer|max:255',
        ]);


            $invoice = new Invoice([
                'brand' => $request->brand,
                'model' => $request->model,
                'priceday' => $request->price,
                'email' => $request->email,
                'cardname'=> $request->cardname,
                'cardnumbers' => $request->cardnumbers,
                'month' => $request->month,
                'ccv' => $request->ccv,
                'zip' => $request->zip,
                'days' => $request->days,
                'total' => $request->total,

            ]);

             $invoice->save();

        return response()->json('Invoice successfully added');
    }


        public function loadInvoice ($id) {
        $invoice = Invoice::findOrFail($id);
        return response()->json($invoice);
    }

}