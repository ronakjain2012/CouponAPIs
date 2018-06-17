<?php

	use Illuminate\Http\Request;

	/*
	|--------------------------------------------------------------------------
	| API Routes
	|--------------------------------------------------------------------------
	|
	| Here is where you can register API routes for your application. These
	| routes are loaded by the RouteServiceProvider within a group which
	| is assigned the "api" middleware group. Enjoy building your API!
	|
	*/

	Route::middleware('auth:api')->get('/user', function(Request $request) {
		return $request->user();
	});

	Route::get('new_coupon/{event}', 'CouponController@new_coupon')->name('new_coupon');
	Route::get('events', 'EventController@index')->name('events');
	Route::get('coupons', 'CouponController@index')->name('coupons');
	Route::get('coupons_active', 'CouponController@index_active')->name('coupons_active');
	Route::get('use_coupon/{coupon}', 'CouponController@consume')->name('use_coupon');
	Route::get('mark_coupon_inactive/{coupon}', 'CouponController@mark_inactive')->name('mark_coupon_inactive');
	Route::get('mark_event_inactive/{event}', 'EventController@mark_inactive')->name('mark_coupon_inactive');
	Route::get('new_event', 'EventController@store')->name('new_event');
	Route::get('update_event/{event}', 'EventController@update')->name('update_event');
	Route::get('update_coupon/{coupon}', 'CouponController@update')->name('update_coupon');
