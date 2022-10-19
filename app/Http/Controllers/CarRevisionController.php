<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\CarRevision;
use App\Models\Car;
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

        $carDamages = $request->StareMotor + $request->StareLumini + $request->StareSuspensii + $request->StareAmortizor + $request->StareFrana + $request->StareSistemElectric + $request->StareDotari + $request->StareCauciucuri;
        $car = Car::where('car_id', $request->car_id)->first();

        if($carDamages >= 1 && $carDamages <= 3) {
            $car->daune = 1;
        } else if($carDamages >= 4) {
            $car->daune = 2;
        }

        $car->save();

        return response()->json('Revision successfully added');
    }

    public function loadRevision($id) {
        $carParts = [];
        $carParts[0] = CarRevision::where('Id_revizie', $id)->first();
        $carParts[1] = Car::where('car_id', $carParts[0]->car_id)->first();

        return response()->json($carParts);
    }
}
