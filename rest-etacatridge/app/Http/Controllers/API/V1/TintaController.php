<?php

namespace App\Http\Controllers\API\V1;

use App\Models\Tinta;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTintaRequest;
use App\Http\Requests\UpdateTintaRequest;
use App\Http\Resources\V1\TintaResource;
use App\Http\Resources\V1\TintaCollection;

class TintaController extends Controller
{
    public function index()
    {
        return Tinta::orderBy('stok','asc')->get();
    }

    public function store(StoreTintaRequest $request)
    {
        Tinta::create($request->validated());
        return response()->json("Tinta Dibuat");
    }

    public function update(UpdateTintaRequest $request, Tinta $tinta)
    {
        $tinta->update($request->validated());
        return response()->json("Tinta Diubah");
    }
    
    public function show(Tinta $tinta)
    {
        return new TintaResource($tinta);
    }

    public function destroy(Tinta $tinta)
    {
        $tinta->delete();
        return response()->json("Pelanggan Dihapus");
    }
 }

