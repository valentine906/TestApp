<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator; // Import Validator facade

class UserController extends Controller
{
    public function index()
    {


        $users =User::all();

        return response()->json($users);
    }

    public function store(Request $request)
    {

        // Validate the incoming JSON data
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:5',
        ]);

        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }


        $user = User::create([
            'name' => $request['name'],
            'email' => $request['email'],
            'password' => $request['password'],
        ]);

        return response()->json(['message' => 'User registered successfully', 'user' => $user], 201);


    }


}
