<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Car;
use Illuminate\Http\Request;
use DB;
use Image;

class CarController extends Controller
{
    // all cars
    public function index()
    {
        $cars = Car::all();

        return response()->json($cars);
    }

    // add car
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'department_id' => 'required|string|max:255',
            'car_type_id' => 'required|string|max:255',
            'marca' => 'required|string|max:255',
            'model' => 'required|string|max:255',
            'an' => 'required|string|max:255',
            'km' => 'required|string|max:255',
            'combustibil' => 'required|string|max:255',
            'putere' => 'required|string|max:255',
            'transmisie' => 'required|string|max:255',
            'nr_portiere' => 'required|string|max:255',
            'culoare' => 'required|string|max:255',
            'vin' => 'required|string|max:255',
            'oferit_de' => 'required|string|max:255',
            'pret_curent' => 'required|string|max:255',
            'daune' => 'required|string|max:255',

        ]);

        if($request->hasfile('file')) {



            $car = new Car([
                'department_id' => $request->department_id,
                'car_type_id' => $request->car_type_id,
                'marca' => $request->marca,
                'model' => $request->model,
                'an'=> $request->an,
                'km' => $request->km,
                'combustibil' => $request->combustibil,
                'putere' => $request->putere,
                'transmisie' => $request->transmisie,
                'nr_portiere' => $nr_portiere,
                'culoare' => $request->culoare,
                'vin' => $request->vin,
                'oferit_de' => $request->oferit_de,
                'pret_curent' => $request->pret_curent,
                'culoare' => $request->culoare,
                'daune' => $request->daune,



            ]);

+
            $car->save();
        }

        return response()->json('Car successfully added');
    }

    // edit Car
    public function edit($id)
    {
        $car = Car::find($id);
        return response()->json($car);
    }

    // update Car
    public function update($id, Request $request)
    {
        $car = Car::find($id);
        $car->update($request->all());

        return response()->json('Car successfully updated');
    }

    // delete a Car
    public function destroy($id)
    {
        $car = Car::find($id);
        $car->delete();

        return response()->json('Car successfully deleted');
    }

    public function getBrands() {
        $brands = DB::select('SELECT * FROM brands');

        return response()->json($brands);
    }

        public function getFuel() {
        $fuel = DB::select('SELECT * FROM fuel_type');

        return response()->json($fuel);
    }
        public function getSeats() {
        $seats = DB::select('SELECT * FROM seats');

        return response()->json($seats);
    }

        public function getTransmission() {
        $transmission = DB::select('SELECT * FROM transmission');

        return response()->json($transmission);
    }

    public function loadCar ($id) {
        $car = Car::findOrFail($id);
        return response()->json($car);
    }

}