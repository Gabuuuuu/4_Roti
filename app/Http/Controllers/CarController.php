<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Car;
use App\Models\Department;
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
            'pret_achizitie' => 'required|string|max:255',
            'daune' => 'required|string|max:255',
        ]);

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
            'nr_portiere' => $request->nr_portiere,
            'culoare' => $request->culoare,
            'vin' => $request->vin,
            'oferit_de' => $request->oferit_de,
            'pret_curent' => $request->pret_achizitie,
            'pret_achizitie' => $request->pret_achizitie,
            'culoare' => $request->culoare,
            'daune' => $request->daune,
        ]);

        $car->save();

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

    public function loadCarTypes () {
        $carTypes = DB::select('SELECT * FROM car_type');
        return response()->json($carTypes);
    }

    public function loadCar($id) {
        $car = Car::where('car_id', $id)->first() ?? 'Not found';

        return response()->json($car);
    }

    public function loadCarParts () {
        $carParts = [];
        $carParts[0] = DB::select('SELECT * FROM transmission');
        $carParts[1] = DB::select('SELECT * FROM seats');
        $carParts[2] = DB::select('SELECT * FROM colors');
        $carParts[3] = DB::select('SELECT * FROM fuel_type');
        $carParts[4] = DB::select('SELECT * FROM brands');
        $carParts[5] = DB::select('SELECT * FROM car_Type');
        $carParts[6] = Department::all();

        return response()->json($carParts);
    }

    public function carsDetails() {
        $carsDetails = [];
        $carsDetails[0] = Car::where('daune', '<', 2)->get();
        $carsDetails[1] = Department::all();
        $carsDetails[2] = DB::select('SELECT * FROM car_Type');

        return response()->json($carsDetails);
    }

    public function addRide(Request $request) {

        DB::insert('insert into car_employee values (?, ?)', [$request->car_id, $request->employee_id]);

        // return response()->json('Ride added successfully');
        return response()->json($request);
    }

    public function getLicenseTypes () {
        $licenseTypes = DB::select('SELECT * FROM car_type');
        return response()->json($request);
    }
}