@extends('vendors.layout')

@section('content')
  <div class="page-header">
    <h4 class="page-title">{{ __('Rental Details') }}</h4>
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{ route('vendor.dashboard') }}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Room Rental') }}</a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Rentals') }}</a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Rental Details') }}</a>
      </li>
    </ul>
    <a href="{{ route('vendor.room_bookings.all_bookings') }}" class="btn-md btn btn-primary ml-auto" >{{ __('Back') }}</a>
  </div>

  <div class="row">
    @php
      $position = $details->currency_symbol_position;
      $currency = $details->currency_symbol;
    @endphp

    <div class="col-md-4">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-inline-block">
            {{ __('Rental No.') . ' ' . '#' . $details->booking_number }}
          </div>
        </div>

        <div class="card-body">
          <div class="payment-information">
            <div class="row mb-2">
              <div class="col-lg-6">
                <strong>{{ __('Rental Date') . ' :' }}</strong>
              </div>

              <div class="col-lg-6">{{ date_format($details->created_at, 'M d, Y') }}</div>
            </div>

            <div class="row mb-2">
              <div class="col-lg-6">
                <strong>{{ __('Subtotal') . ' :' }}</strong>
              </div>
              <div class="col-lg-6">
                {{ $position == 'left' ? $currency . ' ' : '' }}{{ number_format($details->subtotal, 2) }}{{ $position == 'right' ? ' ' . $currency : '' }}
              </div>
            </div>

            @if (!is_null($details->discount))
              <div class="row mb-2">
                <div class="col-lg-6">
                  <strong>{{ __('Discount') }} <span class="text-success">(<i class="far fa-minus"></i>)</span>
                    :</strong>
                </div>

                <div class="col-lg-6">
                  {{ $position == 'left' ? $currency . ' ' : '' }}{{ number_format($details->discount, 2) }}{{ $position == 'right' ? ' ' . $currency : '' }}
                </div>
              </div>
            @endif

            @if (!is_null($details->grand_total))
              <div class="row mb-2">
                <div class="col-lg-6">
                  <strong>{{ __('Tenant Paid') . ' :' }}</strong>
                </div>

                <div class="col-lg-6">
                  {{ $position == 'left' ? $currency . ' ' : '' }}{{ number_format($details->grand_total, 2) }}{{ $position == 'right' ? ' ' . $currency : '' }}
                </div>
              </div>
            @endif

            @if (!is_null($details->received_amount))
              <div class="row mb-2">
                <div class="col-lg-6">
                  <strong>{{ __('Received Amount') . ' :' }}</strong>
                </div>

                <div class="col-lg-6">
                  {{ $position == 'left' ? $currency . ' ' : '' }}{{ number_format($details->received_amount, 2) }}{{ $position == 'right' ? ' ' . $currency : '' }}
                </div>
              </div>
            @endif

            @if (!is_null($details->received_amount))
              <div class="row mb-2">
                <div class="col-lg-6">
                  <strong>{{ __('Commision') }}({{ $details->commission_percentage }}%) : </strong>
                </div>

                <div class="col-lg-6">
                  {{ $position == 'left' ? $currency . ' ' : '' }}{{ number_format($details->comission, 2) }}{{ $position == 'right' ? ' ' . $currency : '' }}

                  ({{ __('Received by Admin') }})
                </div>
              </div>
            @endif

            @if (!is_null($details->payment_method))
              <div class="row mb-2">
                <div class="col-lg-6">
                  <strong>{{ __('Paid via') . ' :' }}</strong>
                </div>

                <div class="col-lg-6">{{ $details->payment_method }}</div>
              </div>
            @endif

            <div class="row mb-2">
              <div class="col-lg-6">
                <strong>{{ __('Payment Status') . ' :' }}</strong>
              </div>

              <div class="col-lg-6">
                @if ($details->payment_status == 1)
                  <span class="badge badge-success">{{ __('Paid') }}</span>
                @else
                  <span class="badge badge-danger">{{ __('Unpaid') }}</span>
                @endif
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-inline-block">
            {{ __('Rental Information') }}
          </div>
        </div>

        <div class="card-body">
          <div class="payment-information">
            <div class="row mb-2">
              <div class="col-lg-4">
                <strong>{{ __('Room') . ' :' }}</strong>
              </div>
              <div class="col-lg-8">
                @if ($roomContentInfo)
                  <a target="_blank"
                    href="{{ route('room_details', ['id' => $roomContentInfo->room_id, 'slug' => $roomContentInfo->slug]) }}">{{ @$roomContentInfo->title }}</a>
                @endif
              </div>
            </div>

            @php
              $arrival_date = Carbon\Carbon::parse($details->arrival_date)->format('M d, Y');
              $departure_date = Carbon\Carbon::parse($details->departure_date)->format('M d, Y');
            @endphp

            <div class="row mb-2">
              <div class="col-lg-4">
                <strong>{{ __('Arrival Date') . ' :' }}</strong>
              </div>

              <div class="col-lg-8">{{ $arrival_date }}</div>
            </div>

            <div class="row mb-2">
              <div class="col-lg-4">
                <strong>{{ __('Departure Date') . ' :' }}</strong>
              </div>

              <div class="col-lg-8">{{ $departure_date }}</div>
            </div>

            <div class="row mb-2">
              <div class="col-lg-4">
                <strong>{{ __('Guests') . ' :' }}</strong>
              </div>

              <div class="col-lg-8">{{ $details->guests }}</div>
            </div>


          </div>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <div class="card">
        <div class="card-header">
          <div class="card-title d-inline-block">
            {{ __('Billing Details') }}
          </div>
        </div>

        <div class="card-body">
          <div class="payment-information">
            <div class="row mb-2">
              <div class="col-lg-4">
                <strong>{{ __('Name') . ' :' }}</strong>
              </div>

              <div class="col-lg-8">{{ $details->customer_name }}</div>
            </div>


            <div class="row mb-2">
              <div class="col-lg-4">
                <strong>{{ __('Email') . ' :' }}</strong>
              </div>

              <div class="col-lg-8">{{ $details->customer_email }}</div>
            </div>

            <div class="row mb-1">
              <div class="col-lg-4">
                <strong>{{ __('Phone Number') . ' :' }}</strong>
              </div>

              <div class="col-lg-8">{{ $details->customer_phone }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
