<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Users\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::post('/register', [UserController::class, 'register']);

Route::post('/login', [UserController::class, 'login'])->name('login');


//LOGGED IN USERS
Route::middleware(['auth:sanctum','throttle:10,1'])->group(function() {

    Route::get('/get/users', [UserController::class, 'index']);

    Route::get('/user', [UserController::class, 'getUser']);

    Route::get('/wallet/balance', [UserController::class, 'getUserBalance']);

    Route::post('/wallet/fund', [UserController::class, 'fundWallet']);

    Route::post('/purchase/data', [UserController::class, 'purchase_data']);

    Route::post('/purchase/airtime', [UserController::class, 'purchase_airtime']);

    Route::get('/transactions', [UserController::class, 'transactions']);

});
