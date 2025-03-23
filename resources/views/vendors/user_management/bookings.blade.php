@extends('vendors.layout')

@section('content')
<div class="page-header">
  <h4 class="page-title">{{ __('User Bookings') }}</h4>
  <ul class="breadcrumbs">
    <li class="nav-home">
      <a href="{{route('vendor.dashboard')}}">
        <i class="flaticon-home"></i>
      </a>
    </li>
    <li class="separator">
      <i class="flaticon-right-arrow"></i>
    </li>
    <li class="nav-item">
      <a href="#">{{ __('User Management') }}</a>
    </li>
    <li class="separator">
      <i class="flaticon-right-arrow"></i>
    </li>
    <li class="nav-item">
      <a href="#">{{ __('User Bookings') }}</a>
    </li>
  </ul>
</div>

<div class="row">
  <div class="col-md-12">
    <div class="card">
      <div class="card-header">
        <div class="row">
          <div class="col-lg-6">
            <div class="card-title">{{ __('Room Bookings') }}</div>
          </div>
        </div>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <div class="table-responsive">
              <table class="table table-striped mt-3">
                <thead>
                  <tr>
                    <th>{{ __('Booking ID') }}</th>
                    <th>{{ __('User') }}</th>
                    <th>{{ __('Room') }}</th>
                    <th>{{ __('Check In') }}</th>
                    <th>{{ __('Check Out') }}</th>
                    <th>{{ __('Payment Status') }}</th>
                    <th>{{ __('Booking Status') }}</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($roomBookings as $booking)
                    <tr>
                      <td>{{ $booking->booking_number }}</td>
                      <td>
                        <a href="{{ route('vendor.user_management.user_details', $booking->user_id) }}">
                          {{ $booking->roomBookedByUser->username }}
                        </a>
                      </td>
                      <td>{{ $booking->hotelRoom->title }}</td>
                      <td>{{ $booking->arrival_date }}</td>
                      <td>{{ $booking->departure_date }}</td>
                      <td>
                        @if($booking->payment_status == 1)
                          <span class="badge badge-success">{{ __('Paid') }}</span>
                        @else
                          <span class="badge badge-danger">{{ __('Unpaid') }}</span>
                        @endif
                      </td>
                      <td>
                        @if($booking->status == 'pending')
                          <span class="badge badge-warning">{{ __('Pending') }}</span>
                        @elseif($booking->status == 'approved')
                          <span class="badge badge-success">{{ __('Approved') }}</span>
                        @elseif($booking->status == 'rejected')
                          <span class="badge badge-danger">{{ __('Rejected') }}</span>
                        @endif
                      </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="card">
      <div class="card-header">
        <div class="row">
          <div class="col-lg-6">
            <div class="card-title">{{ __('Package Bookings') }}</div>
          </div>
        </div>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <div class="table-responsive">
              <table class="table table-striped mt-3">
                <thead>
                  <tr>
                    <th>{{ __('Booking ID') }}</th>
                    <th>{{ __('User') }}</th>
                    <th>{{ __('Package') }}</th>
                    <th>{{ __('Check In') }}</th>
                    <th>{{ __('Check Out') }}</th>
                    <th>{{ __('Payment Status') }}</th>
                    <th>{{ __('Booking Status') }}</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($packageBookings as $booking)
                    <tr>
                      <td>{{ $booking->booking_number }}</td>
                      <td>
                        <a href="{{ route('vendor.user_management.user_details', $booking->user_id) }}">
                          {{ $booking->packageBookedByUser->username }}
                        </a>
                      </td>
                      <td>{{ $booking->tourPackage->title }}</td>
                      <td>{{ $booking->arrival_date }}</td>
                      <td>{{ $booking->departure_date }}</td>
                      <td>
                        @if($booking->payment_status == 1)
                          <span class="badge badge-success">{{ __('Paid') }}</span>
                        @else
                          <span class="badge badge-danger">{{ __('Unpaid') }}</span>
                        @endif
                      </td>
                      <td>
                        @if($booking->status == 'pending')
                          <span class="badge badge-warning">{{ __('Pending') }}</span>
                        @elseif($booking->status == 'approved')
                          <span class="badge badge-success">{{ __('Approved') }}</span>
                        @elseif($booking->status == 'rejected')
                          <span class="badge badge-danger">{{ __('Rejected') }}</span>
                        @endif
                      </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
