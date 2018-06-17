<?php

namespace App\Http\Controllers;

use App\CouponConditions;

class CouponConditionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	    CouponConditions::all();
    }
}
