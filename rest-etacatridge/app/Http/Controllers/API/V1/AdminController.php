<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Http\Requests\LoginAdminRequest;
use App\Http\Requests\StoreAdminRequest;
use App\Models\admin;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    public function store(StoreAdminRequest $request)
    {
        admin::create($request->validated());
        return response()->json("dibuat");
    }

    public function destroy(admin $admin)
    {
        $admin->delete();
        return response()->json("Dihapus");
    }

    public function login(LoginAdminRequest $request)
    {
        $username = $request->input('username');
        $password = $request->input('password');
        $admin = admin::where('username', '=', $username)->first();
        if ($admin && $admin->username === $username && $admin->password === $password) {
            return response()->json('bener');
        } else{
            return response()->json('salah');
        }

    }
}
