<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CityController;
use App\Http\Controllers\TownshipController;
use App\Http\Controllers\SchoolInfoController;
use App\Http\Controllers\OtpController;
use App\HTTP\Controllers\UserPasswordController;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Standard REST resource routes for City
Route::apiResource('city', CityController::class);//api/city
//Standard REST resource routes for Township
//api/township
Route::apiResource('township', TownshipController::class);
Route::get('township/city_id/{city_id}', [TownshipController::class, 'getbycity']);
Route::apiResource('schoolinfo', SchoolInfoController::class);
Route::post('verifyotp', [OtpController::class, 'store']);
Route::post('setnewuserpassword',[UserPasswordController::class, 'setNewUserPassword']);