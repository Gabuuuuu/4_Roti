<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\Employee;
use App\Models\Role;

class AuthController extends Controller
{

//FUNCTION FOR REGISTER
public function register(Request $request)
{
    $validatedData = $request->validate([
        'name' => 'required|string|min:6',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:8|same:confirm_password',
        'confirm_password' => 'required ',
    ]);

    $user = User::create([
        'name' => $validatedData['name'],
        'email' => $validatedData['email'],
        'password' => Hash::make($validatedData['password']),
    ]);

    $token = $user->createToken('auth_token')->plainTextToken;

    $user = User::where('email', $request['email'])->firstOrFail();

    return response()->json([
        'access_token' => $token,
        'token_type' => 'Bearer',
        'id' => $user->user_id,
    ]);
}

//FUNCTION FOR LOGIN
public function login(Request $request)
    {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json([
                'message' => 'Invalid login details'
            ], 401);
        }

        $user = User::where('email', $request['email'])->firstOrFail();
        $token = $user->createToken('auth_token')->plainTextToken;

        return response()->json([
            'access_token' => $token,
            'token_type' => 'Bearer',
            'id' => auth()->user()->user_id,
            'email' => auth()->user()->email,
        ]);
    }
}
