<?php

namespace App\Http\Controllers;

use App\CouponLogs;

class CouponLogsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	    return CouponLogs::all();
    }

}
