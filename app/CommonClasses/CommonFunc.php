<?php

	namespace App\CommonClasses;


	use App\CouponLogs;

	class CommonFunc
	{
		public static function distance($lat1, $lon1, $lat2, $lon2, $unit = 'M'): float
		{
			$theta = $lon1 - $lon2;
			$dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) + cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
			$dist = acos($dist);
			$dist = rad2deg($dist);
			$miles = $dist * 60 * 1.1515;
			$unit = strtoupper($unit);
			if($unit == "K") {
				return ($miles * 1.609344);
			} else if($unit == "N") {
				return ($miles * 0.8684);
			} else {
				return $miles;
			}
		}

		public static function couponLog($user = null, $coupon, $category=null, $log, $lat = null, $long = null)
		{
			$couponLog = new CouponLogs;
			$couponLog->user_id = $user;
			$couponLog->coupon_id = $coupon;
			$couponLog->category = $category;
			$couponLog->log = $log;
			$couponLog->lat = $lat;
			$couponLog->long = $long;
			$couponLog->save();
		}

		public static function randString($length): string
		{
			$chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			$res = "";
			for ($i = 0; $i < $length; $i++) :
				$res .= $chars[mt_rand(0, strlen($chars) - 1)];
			endfor;
			return $res;
		}
	}