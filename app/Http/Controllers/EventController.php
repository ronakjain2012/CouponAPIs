<?php

	namespace App\Http\Controllers;

	use App\CommonClasses\CommonFunc;
	use App\Coupon;
	use App\Event;
	use Illuminate\Http\Request;

	class EventController extends Controller
	{
		/**
		 * Display a listing of the resource.
		 *
		 * @return \Illuminate\Http\Response
		 */
		public function index()
		{
			return Event::coupons();
		}

		public function mark_inactive($event, Request $request)
		{
			$eventModel = Event::whereStatus('1')->whereId($event)->first();
			if($eventModel):
				$eventModel->status = '0';
				if($eventModel->save()) :
					Coupon::where('event_id', $event)->update(['status' => '0']);
					CommonFunc::couponLog(null, null, 'update', 'Coupons for event ' . $eventModel->name . ' marked inactive', $request->input('lat'), $request->input('long'));
					$response['status'] = 'success';
					$response['data']['msg'] = 'Event ' . $eventModel->name . ' is no more active.';
					$response['data']['status'] = true;
					return response()->json($response);
				else:
					$response['status'] = 'failed';
					$response['data']['msg'] = 'Event ' . $eventModel->coupon . ' is not marked inactive.';
					$response['data']['status'] = true;
					return response()->json($response);
				endif;
			else:
				$response['status'] = 'failed';
				$response['data']['msg'] = 'Invalid event ID or already inactive.';
				$response['data']['status'] = false;
				return response()->json($response);
			endif;
		}

		public  function store(Request $request){
			if($request->has('name')) :
				$eventModel = new Event;
				$eventModel->name = $request->input('name');
				$eventModel->lat = $request->input('lat');
				$eventModel->long = $request->input('long');
				if($eventModel->save()) :
					$response['status'] = 'success';
					$response['data']['msg'] = 'Event ' . $eventModel->name . ' is created.';
					$response['data']['status'] = true;
					return response()->json($response);
					endif;
			else:
				$response['status'] = 'failed';
				$response['data']['msg'] = 'Event name is required.';
				$response['data']['status'] = false;
				return response()->json($response);
				endif;
		}

		public  function update($event,Request $request){
			$eventModel = Event::find($event);
			if($event) :
				$eventModel->name = empty($request->input('name'))?$eventModel->name:$request->input('name');
				$eventModel->lat = empty($request->input('lat'))?$eventModel->lat:$request->input('lat');
				$eventModel->long = empty($request->input('long'))?$eventModel->long:$request->input('long');
				if($eventModel->save()) :
					$response['status'] = 'success';
					$response['data']['msg'] = 'Event ' . $eventModel->name . ' is updated.';
					$response['data']['status'] = true;
					return response()->json($response);
				endif;
			else:
				$response['status'] = 'failed';
				$response['data']['msg'] = 'Invalid event ID.';
				$response['data']['status'] = false;
				return response()->json($response);
			endif;
		}
	}