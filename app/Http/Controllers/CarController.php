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
            'brand' => 'required|string|max:255',
            'model' => 'required|string|max:255|unique:cars',
            'fuel' => 'required|string|max:255',
            'consumption' => 'required|string|max:255',
            'body' => 'required|string|max:255',
            'seats' => 'required|string|max:255',
            'transmission' => 'required|string|max:255',
            'year' => 'required|string|max:255',
            'price' => 'required|string|max:255',
            'file' => 'required|mimes:jpg,jpeg,png,csv,txt,xlx,xls,pdf|max:2048',
            'description' => 'required|string|max:255',
        ]);

        if($request->hasfile('file')) {

            $image = $request->file('file');

            $imageName = time() . '.' . $image->getClientOriginalExtension();

            $car = new Car([
                'brand' => $request->brand,
                'model' => $request->model,
                'fuel' => $request->fuel,
                'consumption' => $request->consumption,
                'body'=> $request->body,
                'seats' => $request->seats,
                'transmission' => $request->transmission,
                'year' => $request->year,
                'price' => $request->price,
                'image' => $imageName,
                'description' => $request->description,

            ]);

            Image::make($image)->resize(500, 500)->save(public_path('/images/cars/' . $imageName));

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
        public function getBody() {
        $body = DB::select('SELECT * FROM body_type');

        return response()->json($body);
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