<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\InvoiceController;

//ROUTES

//Public routes
    //ROUTE FOR REGISTER
Route::post('/register', [AuthController::class, 'register']);
    //ROUTE FOR LOGIN
Route::post('/login', [AuthController::class, 'login']);

    //ROUTE FOR ADDING A NEW CAR
Route::resource('/cars', App\Http\Controllers\CarController::class);

Route::get('/users/getRole/{id}', [UserController::class, 'getRole']);
Route::get('/users/changeRole/{id}', [UserController::class, 'changeRole']);

    //ROUTE FOR ADDING INVOICES
Route::resource('/invoices', App\Http\Controllers\InvoiceController::class);

Route::resource('/users', App\Http\Controllers\UserController::class);


    //ROUTES FOR ADDING CAR DETAILS
Route::get('/brands', [CarController::class, 'getBrands']);
Route::get('/fuel_type', [CarController::class, 'getFuel']);
Route::get('/body_type', [CarController::class, 'getBody']);
Route::get('/seats', [CarController::class, 'getSeats']);
Route::get('/transmission', [CarController::class, 'getTransmission']);
Route::get('/loadCar/{id}', [CarController::class, 'loadCar']);
Route::get('/loadInvoice/{id}',[InvoiceController::class, 'loadInvoice']);


