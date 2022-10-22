<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use App\Http\Requests\StoreEmployeeRequest;
use App\Http\Requests\UpdateEmployeeRequest;
use App\Models\Role;
use App\Models\Car;
use App\Models\Department;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Str;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $employees = Employee::all();

        return response()->json($employees);
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
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreEmployeeRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreEmployeeRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function show(Employee $employee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function edit(Employee $employee)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateEmployeeRequest  $request
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Employee $employee)
    {
        $role = Role::where('role_id', $request->role_id)->first();

        $employee = Employee::find($employee->employee_id);
        $employee->role_id = $request->input('role');
        $employee->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Employee  $employee
     * @return \Illuminate\Http\Response
     */
    public function destroy(Employee $employee)
    {
        //
    }

    public function loadEmployee ($id) {
        $employee = Employee::where('employee_id', $id)->first() ?? 'Not found';

        return response()->json($employee);
    }

    public function employeesByDepartment ($id) {
        $userRole = Role::select('department_id')->where('role_id', $id)->first();
        $roles = Role::select('role_id')->where('department_id', $userRole->department_id)->get();

        $rolesIDs = [];
        foreach ($roles as $key => $role) {
            $rolesIDs[$key] = $role->role_id;
        }

        $employees = Employee::where('role_id', $rolesIDs)->orWhere('role_id', $roles[1]->role_id)->orderBy('employee_id', 'ASC')->get();

        return response()->json($employees);
    }

}
