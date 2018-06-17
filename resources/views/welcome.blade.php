<!doctype html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Styles -->
    <style>
        * {
            font-family: 'Source Sans Pro', sans-serif;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Event Name</th>
                    <th scope="col">Lat</th>
                    <th scope="col">Long</th>
                    <th scope="col">Coupons</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>
                <tbody>
                @php
                    $count = 1;
                @endphp
                @foreach(\App\Event::coupons() as $event)
                    <tr>
                        <td scope="col">{{$count}}</td>
                        <td scope="col">{{$event->id}}</td>
                        <td scope="col">{{$event->name}}</td>
                        <td scope="col">{{$event->lat}}</td>
                        <td scope="col">{{$event->long}}</td>
                        <td scope="col">{{$event->status?'Active':'Inactive'}}</td>
                        <td scope="col">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">ID</th>
                                    <th scope="col">Coupon Code</th>
                                    <th scope="col">Valid Upto</th>
                                    <th scope="col">Used #</th>
                                    <th scope="col">Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                @php
                                    $count1=1;
                                @endphp
                                @foreach($event->coupon as $item)
                                    <tr>
                                        <td scope="col">{{$count1}}</td>
                                        <td scope="col">{{$item->id}}</td>
                                        <td scope="col">{{$item->coupon}}</td>
                                        <td scope="col">{{$item->valid_upto}}</td>
                                        <td scope="col">{{$item->use_count}}</td>
                                        <td scope="col">{{$item->status?'Active':'Inactive'}}</td>
                                    </tr>
                                    @php
                                        $count1++;
                                    @endphp
                                @endforeach
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    @php
                        $count++;
                    @endphp
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</html>
