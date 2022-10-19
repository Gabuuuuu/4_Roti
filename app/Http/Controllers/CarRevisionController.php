<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\CarRevision;
use DB;

class CarRevisionController extends Controller
{
        // all car revisions
    public function index()
    {
        $carrevision = CarRevision::all();

        return response()->json($carrevision);
    }

    // add carrevision
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'car_id' => 'required|string|max:255',
            'StareMotor' => 'required|string|max:255',
            'StareLumini' => 'required|string|max:255',
            'StareSuspensii' => 'required|string|max:255',
            'StareAmortizor' => 'required|string|max:255',
            'StareFrana' => 'required|string|max:255',
            'StareSistemElectric' => 'required|string|max:255',
            'StareDotari' => 'required|string|max:255',
            'StareCauciucuri' => 'required|string|max:255',
        ]);

            $carrevision = new CarRevision([
                'car_id' => $request->car_id,
                'StareMotor' => $request->StareMotor,
                'StareLumini' => $request->StareLumini,
                'StareSuspensii' => $request->StareSuspensii,
                'StareAmortizor'=> $request->StareAmortizor,
                'StareFrana' => $request->StareFrana,
                'StareSistemElectric' => $request->StareSistemElectric,
                'StareDotari' => $request->StareDotari,
                'StareCauciucuri' => $request->StareCauciucuri,

            ]);

            $carrevision->save();
        // }

        return response()->json('Revision successfully added');
    }
    public function loadRevision($id) {
        $carrevision = CarRevision::where('Id_revizie', $id)->first() ?? 'Not found';

        return response()->json($carrevision);
    }
}
