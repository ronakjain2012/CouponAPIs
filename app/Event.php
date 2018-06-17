<?php

	namespace App;

	use Illuminate\Database\Eloquent\Model;

	class Event extends Model
	{
		public function coupon()
		{
			return $this->hasMany('App\Coupon');
		}

		public function scopeCoupons($query)
		{
			return $query->with('coupon')->get();
		}
	}
