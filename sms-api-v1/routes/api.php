<?php

use App\Http\Controllers\MailController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CityController;
use App\Http\Controllers\TownshipController;
use App\Http\Controllers\SchoolInfoController;
use App\Http\Controllers\OtpController;
use App\Http\Controllers\UserPasswordController;
use App\Http\Controllers\SignInController;
use App\Http\Controllers\UserProfileController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Protected user profile routes
Route::middleware('auth:sanctum')->group(function () {
    Route::get('profile', [UserProfileController::class, 'show']);
    Route::put('profile', [UserProfileController::class, 'update']);
});

// Standard REST resource routes for City
Route::apiResource('city', CityController::class);//api/city
//Standard REST resource routes for Township
//api/township
Route::apiResource('township', TownshipController::class);
Route::get('township/city_id/{city_id}', [TownshipController::class, 'getbycity']);
Route::apiResource('schoolinfo', SchoolInfoController::class);
Route::post('verifyotp', [OtpController::class, 'store']);
Route::post('setnewuserpassword',[UserPasswordController::class, 'setNewUserPassword']);
Route::post('login', [SignInController::class, 'login']);
Route::post('logout', [SignInController::class, 'logout'])->middleware('auth:sanctum');
Route::post('resendotp', [MailController::class, 'resendOTP']);
