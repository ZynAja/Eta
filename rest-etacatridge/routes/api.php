<?php

use App\Http\Controllers\API\V1\AdminController;
use App\Http\Controllers\API\V1\BookingController;
use App\Http\Controllers\API\V1\PelangganController;
use App\Http\Controllers\API\V1\TintaController;
use App\Http\Controllers\API\V1\PrinterController;
use App\Http\Controllers\PrinterTabelController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'V1'], function(){
    Route::apiResource('pelanggans', PelangganController::class);
    Route::apiResource('tintas', TintaController::class);
    Route::apiResource('admins', AdminController::class);
    Route::apiResource('printers', PrinterController::class);
    Route::apiResource('bookings',BookingController::class);
    Route::post('login', [AdminController::class, 'login']);
});


