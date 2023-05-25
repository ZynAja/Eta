<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePrinterRequest;
use App\Models\Printer;
use Illuminate\Http\Request;

class PrinterController extends Controller
{
    public function index()
    {
        return Printer::all();          
    }

    public function store(StorePrinterRequest $request)
    {
        Printer::create($request->validated());
        return response()->json('dibuat');
    }

    public function update(StorePrinterRequest $request,Printer $printer)
    {
        $printer->update($request->validated());
        return response()->json("Diubah");
    }

    public function destroy(Printer $printer)
    {
        $printer->delete();
        return response()->json("dihapus");
    }
}
