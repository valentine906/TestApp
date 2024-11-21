<?php

namespace App\Http\Controllers\Users;

use App\Http\Controllers\Controller;
use App\Models\AirtimePurchase;
use App\Models\DataPurchase;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{





    //................. REGISTERED USER
    public function register(Request $request)
    {

        // Validate the incoming JSON data
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|max:255||unique:users,username',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:5',
        ]);

        // If validation fails, return error response
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 422);
        }


        $user = User::create([
            'username' => $request['username'],
            'email' => $request['email'],
            'password' => $request['password'],
        ]);

        Auth::login($user);
        $token = $user->createToken('authToken')->plainTextToken;

        return response()->json(['message' => 'User registered successfully', 'user' => $user, 'token' => $token], 200);


    }


    //....................... LOGIN USER
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {

            $user = Auth::user();

            $token = $user->createToken('authToken')->plainTextToken;

            return response()->json([ 'message' => 'Login successful', 'user' => $user, 'token' => $token ], 200);
        }
        return response()->json(['error' => 'Unauthorized'], 401);
    }






    //...........GET ALL REGISTERED USERS
    public function index()
    {


        $users =User::all();

        return response()->json($users);
    }



//......... GET LOGGED IN/ REGISTERED USER

    public function getUser()
    {

        $user = Auth::user();

        return response()->json($user, 200);

    }


//.......GET LOGGED IN/ REGISTERED USER BALANCE

    public function getUserBalance()
    {

        $user = Auth::user();

        $balance = $user->wallet_balance;

        return response()->json($balance, 200);

    }








//..................... FUNDING WALLET
    public function fundWallet(Request $request)

    {

        $rules = [

            'amount' => 'required|numeric|min:1',

        ];


        $messages = [

            'amount.required' => 'The amount field is required.',

            'amount.numeric' => 'The amount must be a number.',

            'amount.min' => 'The amount must be at least 1.',

        ];

        $validator = Validator::make($request->all(), $rules, $messages);


        // Check if validation fails

        if ($validator->fails()) {

            return response()->json([

                'errors' => $validator->errors(),

            ], 422); // Unprocessable Entity

        }
        $user = Auth::user();


        $transaction_id =  Transaction::create([

            'user_id' => $user->id,

            'transaction_type' => 'Account Funded',

            'amount' => $request->amount,

            'transaction_date' => Carbon::now(),

            'status' => 'completed',

        ]);



        $user->wallet_balance += $request->amount;

        $user->save();


        // Return a JSON response

        return response()->json([

            'message' => 'Wallet funded successfully.',

            'new_balance' => $user->wallet_balance,

        ], 200);

    }








//.......... PURCHASING DATA SECTION

    public function purchase_data(Request $request)

    {

        // Validate the request

        $validator = Validator::make($request->all(), [


            'phone_number' => 'required|string',

            'network_provider' => 'required|in:MTN,GLO,AIRTEL,9MOBILE',

            'data_plan' => 'required|in:1GB,2GB,5GB,10GB',

            'amount' => 'required|numeric|min:1',

        ]);


        if ($request->amount > auth()->user()->wallet_balance) {

            return response()->json(['errors' => 'Insufficient balance.'], 422);

        }elseif($validator->fails()){
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $transaction_id =  Transaction::create([

            'user_id' => auth()->user()->id,

            'transaction_type' => $request->network_provider,

            'amount' => $request->amount,

           'transaction_date' => Carbon::now(),

            'status' => 'completed',

        ]);




        $dataPurchase = DataPurchase::create([

            'transaction_id' => $transaction_id->id,

            'phone_number' => $request->phone_number,

            'network_provider' => $request->network_provider,

            'data_plan' => $request->data_plan,

            'amount' => $request->amount,

        ]);

        DB::table('users')->where('id', auth()->user()->id)->decrement('wallet_balance',$request->amount);



        // Log the successful transaction

        Log::channel('data')->info('Data purchase successful', [

            'phone_number' => $dataPurchase->phone_number,

            'network_provider' => $dataPurchase->network_provider,

            'amount' => $dataPurchase->amount,


        ]);


        return response()->json([

            'message' => 'Airtime purchased successfully.',

            'data' => $dataPurchase,

        ], 201);

    }

//.......... PURCHASING AIRTIME SECTION

    public function purchase_airtime(Request $request)

    {

        // Validate the request

        $validator = Validator::make($request->all(), [


            'phone_number' => 'required|string',

            'network_provider' => 'required|in:MTN,GLO,AIRTEL,9MOBILE',


            'amount' => 'required|numeric|min:1',

        ]);


        if ($request->amount > auth()->user()->wallet_balance) {

            return response()->json(['errors' => 'Insufficient balance.'], 422);

        }elseif($validator->fails()){
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $transaction_id =  Transaction::create([

            'user_id' => auth()->user()->id,

            'transaction_type' => $request->network_provider,

            'amount' => $request->amount,

            'transaction_date' => Carbon::now(),

            'status' => 'completed',

        ]);




        $airtimePurchase = AirtimePurchase::create([

            'transaction_id' => $transaction_id->id,

            'phone_number' => $request->phone_number,

            'network_provider' => $request->network_provider,


        ]);

        DB::table('users')->where('id', auth()->user()->id)->decrement('wallet_balance',$request->amount);



        // Log the successful transaction

        Log::channel('airtime')->info('Airtime purchase successful', [

            'phone_number' => $airtimePurchase->phone_number,

            'network_provider' => $airtimePurchase->network_provider,

            'amount' => $airtimePurchase->amount,


        ]);


        return response()->json([

            'message' => 'Airtime purchased successfully.',

            'data' => $airtimePurchase,

        ], 201);

    }



//................. TRANSACTIONS
    public function transactions(Request $request)

    {

        $userId = $request->user()->id;



        $transactions = Transaction::with(['airtime_purchase', 'electricity_payment', 'data_purchase'])

            ->where('user_id', $userId)

            ->get();


        return response()->json([

            'message' => 'Transaction history retrieved successfully.',

            'data' => $transactions,

        ], 200);

    }


}
