<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreBookingRequest;
use App\Http\Requests\UpdateBookingRequest;
use App\Http\Resources\BookingResource;
use App\Models\Booking;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    public function index()
    {
       return Booking::orderBy('tinta')->get();
    }

    public function show(Booking $booking)
    {
        return new BookingResource($booking);
    }

    public function store(StoreBookingRequest $request)
    {
        Booking::create($request->validated());
        return response()->json("buat");
    }

    public function update(UpdateBookingRequest $request, Booking $booking)
    {
        $booking->update($request->validated());
        return response()->json("Diubah");
    }
}
