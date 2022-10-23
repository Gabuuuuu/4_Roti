<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CarController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\CarRevisionController;
use App\Http\Controllers\RepairNoticeController;

//ROUTES

// Auth
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Invoices
Route::resource('/invoices', App\Http\Controllers\InvoiceController::class);
Route::get('/loadInvoice/{id}', [InvoiceController::class, 'loadInvoice']);

// Users
Route::resource('/users', App\Http\Controllers\UserController::class);
Route::get('/guestUsers', [UserController::class, 'displayGuests']);
Route::get('/users/getRole/{id}', [UserController::class, 'getRole']);
Route::get('/users/changeRole/{id}', [UserController::class, 'changeRole']);

// Roles
Route::resource('/roles', App\Http\Controllers\RoleController::class);

// Employees
Route::resource('/employees', App\Http\Controllers\EmployeeController::class);
Route::get('/loadEmployee/{id}', [EmployeeController::class, 'loadEmployee']);
Route::get('/employeesByDepartment/{id}', [EmployeeController::class, 'employeesByDepartment']);

// Car revisions
Route::resource('/revisions', App\Http\Controllers\CarRevisionController::class);
Route::get('/loadRevision/{id}',[CarRevisionController::class, 'loadRevision']);

// Repair notice
Route::resource('/repairnotices', App\Http\Controllers\RepairNoticeController::class);
Route::get('/LoadRepairNoticeData', [RepairNoticeController::class, 'repairNotice']);
Route::get('/loadRepairNotice/{id}',[RepairNoticeController::class, 'loadRepairNotice']);

// Car
Route::resource('/cars', App\Http\Controllers\CarController::class);
Route::get('/loadCarParts', [CarController::class, 'loadCarParts']);
Route::get('/loadCar/{id}', [CarController::class, 'loadCar']);
Route::get('/loadCarTypes', [CarController::class, 'loadCarTypes']);
Route::get('/carsDetails',[CarController::class, 'carsDetails']);







