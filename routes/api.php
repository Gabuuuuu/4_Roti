<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\CarRevisionController;


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

// Users
Route::resource('/users', App\Http\Controllers\UserController::class);
Route::get('/guestUsers', [UserController::class, 'displayGuests']);

Route::resource('/roles', App\Http\Controllers\RoleController::class);

// Employees
Route::resource('/employees', App\Http\Controllers\EmployeeController::class);
Route::resource('/revisions', App\Http\Controllers\CarRevisionController::class);

    //ROUTES FOR ADDING CAR DETAILS
Route::get('/loadCarParts', [CarController::class, 'loadCarParts']);

Route::get('/loadCar/{id}', [CarController::class, 'loadCar']);
Route::get('/loadEmployee/{id}', [EmployeeController::class, 'loadEmployee']);
Route::get('/loadInvoice/{id}',[InvoiceController::class, 'loadInvoice']);
Route::get('/loadRevision/{id}',[CarRevisionController::class, 'loadRevision']);



