<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\RepairNotice;
use DB;

class RepairNoticeController extends Controller
{
        // all car revisions
    public function index()
    {
        $repairnotice = RepairNotice::all();

        return response()->json($repairnotice);
    }

    // add carrevision
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'car_id' => 'required|string|max:255',
            'employee_id' => 'required|string|max:255',
            'damage_info' => 'required|string|max:255',
            'damage_cost' => 'required|string|max:255',

        ]);

            $repairnotice = new RepairNotice([
                'car_id' => $request->car_id,
                'employee_id' => $request->employee_id,
                'damage_info' => $request->damage_info,
                'damage_cost' => $request->damage_cost,


            ]);

            $repairnotice->save();
        // }

        return response()->json('Repair notice successfully generated');
    }
    public function loadRepairNotice($id) {
        $repairnotice = RepairNotice::where('Id_repair_notice', $id)->first() ?? 'Not found';

        return response()->json($repairnotice);
    }
}
