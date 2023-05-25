<?php

namespace App\Http\Controllers\API\V1;

use App\Models\Pelanggan;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\StorePelangganRequest;
use App\Http\Resources\V1\PelangganResource;
use App\Http\Resources\V1\PelangganCollection;

class PelangganController extends Controller
{
    public function index()
    {
        return Pelanggan::all();
    }

    public function show(Pelanggan $pelanggan)
    {
        return new PelangganResource($pelanggan);
    }

    public function store(StorePelangganRequest $request)
    {
        Pelanggan::create($request->validated());
        return response()->json("Pelanggan Dibuat");
    }

    public function update(StorePelangganRequest $request, Pelanggan $pelanggan)
    {
        $pelanggan->update($request->validated());
        return response()->json("Pelanggan Diubah");
    }

    public function destroy(Pelanggan $pelanggan)
    {
        $pelanggan->delete();
        return response()->json("Pelanggan Dihapus");
    }

}
