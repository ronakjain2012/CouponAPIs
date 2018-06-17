<?php

	namespace App\Http\Controllers;

	use App\CommonClasses\CommonFunc;
	use App\Coupon;
	use App\CouponConditions;
	use App\Event;
	use Carbon\Carbon;
	use Illuminate\Http\Request;

	class CouponController extends Controller
	{
		/**
		 * Display a listing of the resource.
		 *
		 * @return \Illuminate\Http\Response
		 */
		public function index()
		{
			return Coupon::with('event')->get();
		}

		/**
		 * Display a listing of the resource.
		 *
		 * @return \Illuminate\Http\Response
		 */
		public function index_active()
		{
			return Coupon::active();
		}

		public function new_coupon($event, Request $request)
		{
			/*Create new coupon -> if provided in GET request then try with that name else 1st word of event and 4 rand characters*/
			$eventModel = Event::find($event);
			$response['status'] = 'success';
			$response['data'] = [];
			$requestData = $request->all();
			if($eventModel) :
				# create new coupon on bases of event name
				if($request->has('coupon_code')):
					# find by event_id and coupon_code
					$couponModel = Coupon::whereCoupon($requestData['coupon_code'])->whereEventId($event)->get();
					if($couponModel->all()):
						$response['status'] = 'failed';
						$response['data']['msg'] = 'Coupon already exists.';
						return response()->json($response);
					else :
						$couponModel = new Coupon;
						$couponModel->event_id = $event;
						$couponModel->coupon = $requestData['coupon_code'];
						$couponModel->amount_percentage = $request->has('amount_percentage') ? $request->input('amount_percentage') : null;

						$couponModel->valid_upto = $request->has('valid_upto') ? Carbon::parse($request->input('valid_upto'))->format("Y-m-d H:i:s") : null;
						if($couponModel->save()) :
							CommonFunc::couponLog(null, $couponModel->id, 'create', 'Created coupon ' . $couponModel->coupon, $request->input('lat'), $request->input('long'));
							$response['status'] = 'success';
							$response['data']['msg'] = 'Coupon Successfully Created.';
							$response['data']['coupon'] = $couponModel->coupon;
							$response['data']['event'] = $eventModel->name;
							$response['data']['valid_upto'] = $couponModel->valid_upto;
							return response()->json($response);
						else :
							CommonFunc::couponLog(null, null, 'error', 'Failed to create coupon ' . $request->input('coupon_code'), $request->input('lat'), $request->input('long'));
							$response['status'] = 'error';
							$response['data']['msg'] = 'Can\'t create coupons. Please contact Admin.';
							return response()->json($response);
						endif;

					endif;
				else:
					/*Rand Coupon Generation*/
					$new_coupon = '';
					$uniqueCoupon = 1;
					while ($uniqueCoupon) :
						$first_word = strpos($eventModel->name, ' ');
						$new_coupon = $first_word ? mb_strtoupper(substr($eventModel->name, 0, $first_word) . $this->getRandomCoupon(4)) : $this->getRandomCoupon(10);
						$couponModel = Coupon::whereCoupon($new_coupon)->whereEventId($event)->get();
						if($couponModel->all()):
							continue;
						else:
							$couponModel = new Coupon;
							$couponModel->event_id = $event;
							$couponModel->coupon = $new_coupon;
							$couponModel->amount_percentage = $request->has('amount_percentage') ? $request->input('amount_percentage') : null;
							$couponModel->valid_upto = $request->has('valid_upto') ? Carbon::parse($request->input('valid_upto'))->format("Y-m-d H:i:s") : null;
							if($couponModel->save()) :
								CommonFunc::couponLog(null, $couponModel->id, 'create', 'Successfully created ' . $couponModel->coupon, $request->input('lat'), $request->input('long'));
								$response['status'] = 'success';
								$response['data']['msg'] = 'Coupon Successfully Created.';
								$response['data']['coupon'] = $couponModel->coupon;
								$response['data']['event'] = $eventModel->name;
								$response['data']['valid_upto'] = $couponModel->valid_upto;
								return response()->json($response);
							else :
								CommonFunc::couponLog(null, null, 'error', 'Failed to create new coupon', $request->input('lat'), $request->input('long'));
								$response['status'] = 'error';
								$response['data']['msg'] = 'Can\'t create coupons. Please contact Admin.';
								return response()->json($response);
							endif;
						endif;
					endwhile;
				endif;
			else :
				$response['status'] = 'failed';
				$response['data']['msg'] = 'Invalid event';
				return response()->json($response);
			endif;
		}

		public function getRandomCoupon($length): string
		{
			/*Random String as Post fix for Coupon Code*/
			return CommonFunc::randString($length);
		}

		public function consume($coupon, Request $request)
		{
			try {
				// check conditions
				$couponData = Coupon::where([['coupon', $coupon], ['status', '1']])->first();

				if($couponData) :
					$conditions = CouponConditions::where('coupon_id', $couponData->id)->get();
					if($conditions->all()) :
						// apply conditions
						foreach ($conditions as $couponCondition) :
							switch ($couponCondition->conditions) :
								case 'location' :
									if($request->has('lat') && $request->has('long')) :
										$eventData = Event::find($couponData->event_id);
										$dis = CommonFunc::distance($request->input('lat'), $request->input('long'), $eventData->lat, $eventData->long);
										if($dis > $couponCondition->conditions_data) :
											$response['status'] = 'failed';
											$response['data']['msg'] = 'You are not within the event\'s location range, please reach at correct location.';
											$response['data']['status'] = false;
											CommonFunc::couponLog(null, $couponData->id, 'condition_fail', 'Failed due to distance between expected drop and user drop location', $request->input('lat'), $request->input('long'));
											return response()->json($response);
										endif;
									else:
										$response['status'] = 'failed';
										$response['data']['msg'] = 'Unable to detect your location';
										$response['data']['status'] = false;
										CommonFunc::couponLog(null, $couponData->id, 'failed', 'Failed due to location unavailability', $request->input('lat'), $request->input('long'));
										return response()->json($response);
									endif;
									break;
								case 'max_use' :
									if($couponData->use_count > $couponCondition->conditions_data) :
										$response['status'] = 'failed';
										$response['data']['msg'] = 'Opps !! The coupon has reached it\'s maximum limit.';
										$response['data']['status'] = false;
										CommonFunc::couponLog(null, $couponData->id, 'condition_fail', 'Failed due to use limit exceeded', $request->input('lat'), $request->input('long'));
										return response()->json($response);
									endif;
									break;
							endswitch;
						endforeach;
						$couponData->use_count = $couponData->use_count + 1;
						$couponData->save();
						$response['status'] = 'success';
						$response['data']['msg'] = 'Applied !!';
						$response['data']['status'] = true;
						CommonFunc::couponLog(null, $couponData->id, 'success', 'Successfully applied coupon ' . $couponData->coupon . ' with conditions', $request->input('lat'), $request->input('long'));
						return response()->json($response);
					else :
						$couponData->use_count = $couponData->use_count + 1;
						$couponData->save();
						$response['status'] = 'success';
						$response['data']['msg'] = 'Applied !!';
						$response['data']['status'] = true;
						CommonFunc::couponLog(null, $couponData->id, 'success', 'Successfully applied coupon ' . $couponData->coupon, $request->input('lat'), $request->input('long'));
						return response()->json($response);
					endif;
				else :
					$response['status'] = 'error';
					$response['data']['msg'] = 'Invalid Coupon';
					$response['data']['status'] = false;
					CommonFunc::couponLog(null, null, 'invalid', 'Invalid coupon ' . $coupon, $request->input('lat'), $request->input('long'));
					return response()->json($response);
				endif;
			} catch (\Exception $e) {
				CommonFunc::couponLog(null, null, 'error', $e->getMessage() . ' -> ' . $coupon, $request->input('lat'), $request->input('long'));
			}
		}

		public function mark_inactive($coupon, Request $request)
		{
			try {
				$couponModel = Coupon::find($coupon);
				if($couponModel):
					$couponModel->status = '0';
					if($couponModel->save()) :
						$response['status'] = 'success';
						$response['data']['msg'] = 'Coupon ' . $couponModel->coupon . ' is no more active';
						$response['data']['status'] = true;
						return response()->json($response);
					else:
						$response['status'] = 'failed';
						$response['data']['msg'] = 'Coupon ' . $couponModel->coupon . ' is not marked inactive.';
						$response['data']['status'] = true;
						return response()->json($response);
					endif;
				else:
					$response['status'] = 'failed';
					$response['data']['msg'] = 'Invalid coupon Id';
					$response['data']['status'] = false;
					return response()->json($response);
				endif;
			} catch (\Exception $e) {
				CommonFunc::couponLog(null, null, 'error', $e->getMessage() . ' -> ' . $coupon, $request->input('lat'), $request->input('long'));
			}
		}

		public  function update($coupon,Request $request){
			try {
				$couponModel = Coupon::find($coupon);
				if($couponModel) :
					$couponModel->event_id = empty($request->input('event_id')) ? $couponModel->event_id : $request->input('event_id');
					$couponModel->amount_percentage = empty($request->input('amount_percentage')) ? $couponModel->amount_percentage : $request->input('amount_percentage');
					$couponModel->status = empty($request->input('status')) ? $couponModel->status : $request->input('status');
					$couponModel->valid_upto = empty($request->input('valid_upto')) ? $couponModel->valid_upto : Carbon::parse($request->input('valid_upto'))->format("Y-m-d H:i:s");
					if($couponModel->save()) :
						$response['status'] = 'success';
						$response['data']['msg'] = $couponModel->coupon . ' is updated.';
						$response['data']['status'] = true;
						return response()->json($response);
					endif;
				else:
					$response['status'] = 'failed';
					$response['data']['msg'] = 'Invalid coupon Id.';
					$response['data']['status'] = false;
					return response()->json($response);
				endif;
			} catch (\Exception $e) {
				$response['status'] = 'failed';
				$response['data']['msg'] = $e->getMessage();
				$response['data']['status'] = false;
				return response()->json($response);
			}
		}
	}