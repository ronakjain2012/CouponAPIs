<?php

	namespace App;

	use Carbon\Carbon;
	use Illuminate\Database\Eloquent\Model;

	class Coupon extends Model
	{
		public $timestamps = true;

		public function event()
		{
			return $this->belongsTo('App\Event');
		}

		public function scopeActive($query)
		{
			return $query->whereStatus('1')->WhereDate('valid_upto', '>=', Carbon::now()->format('Y-m-d H:i:s'))->orWhereNull('valid_upto')->with('event')->get();
		}
	}
