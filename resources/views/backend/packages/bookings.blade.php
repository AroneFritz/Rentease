@extends('backend.layout')

@section('content')
  <div class="page-header">
    @if (request()->routeIs('admin.package_bookings.all_bookings'))
      <h4 class="page-title">{{ __('All Rentals') }}</h4>
    @elseif (request()->routeIs('admin.package_bookings.paid_bookings'))
      <h4 class="page-title">{{ __('Paid Rentals') }}</h4>
    @elseif (request()->routeIs('admin.package_bookings.unpaid_bookings'))
      <h4 class="page-title">{{ __('Unpaid Rentals') }}</h4>
    @endif
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{ route('admin.dashboard') }}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Property Rentals') }}</a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        @if (request()->routeIs('admin.package_bookings.all_bookings'))
          <a href="#">{{ __('All Rentals') }}</a>
        @elseif (request()->routeIs('admin.package_bookings.paid_bookings'))
          <a href="#">{{ __('Paid Rentals') }}</a>
        @elseif (request()->routeIs('admin.package_bookings.unpaid_bookings'))
          <a href="#">{{ __('Unpaid Rentals') }}</a>
        @endif
      </li>
    </ul>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-lg-3">
              <div class="card-title">
                @if (request()->routeIs('admin.package_bookings.all_bookings'))
                  {{ __('All Property Rentals') }}
                @elseif (request()->routeIs('admin.package_bookings.paid_bookings'))
                  {{ __('Paid Room Rentals') }}
                @elseif (request()->routeIs('admin.package_bookings.unpaid_bookings'))
                  {{ __('Unpaid Room Rentals') }}
                @endif
              </div>
            </div>

            <div class="col-lg-6">
              <form
                @if (request()->routeIs('admin.package_bookings.all_bookings')) action="{{ route('admin.package_bookings.all_bookings') }}"
                @elseif (request()->routeIs('admin.package_bookings.paid_bookings'))
                  action="{{ route('admin.package_bookings.paid_bookings') }}"
                @elseif (request()->routeIs('admin.package_bookings.unpaid_bookings'))
                  action="{{ route('admin.package_bookings.unpaid_bookings') }}" @endif
                method="GET" id="BookingForm">

                <div class="row">
                  <div class="col-lg-6">
                    <input name="booking_no" type="text" class="form-control" placeholder="Search By Booking No."
                      value="{{ !empty(request()->input('booking_no')) ? request()->input('booking_no') : '' }}"
                      id="p_booking_id" />
                  </div>
                  <div class="col-lg-6">
                    <input type="text" name="title" value="{{ request()->input('title') }}" placeholder="Title"
                      id="p_booking_title" class="form-control">
                  </div>
                </div>
              </form>
            </div>
            <div class="col-lg-3">
              <button class="btn btn-danger btn-sm float-lg-right float-left d-none bulk-delete mb-2 mt-1"
                data-href="{{ route('admin.package_bookings.bulk_delete_booking') }}"><i
                  class="flaticon-interface-5"></i> {{ __('Delete') }}</button>
            </div>
          </div>
        </div>

        <div class="card-body">
          <div class="row">
            <div class="col-lg-12">
              @if (count($bookings) == 0)
                <h3 class="text-center mt-2">{{ __('NO PROPERTY RENTAL FOUND!') }}</h3>
              @else
                <div class="table-responsive">
                  <table class="table table-striped mt-3">
                    <thead>
                      <tr>
                        <th scope="col">
                          <input type="checkbox" class="bulk-check" data-val="all">
                        </th>
                        <th scope="col">{{ __('Rentals No.') }}</th>
                        <th scope="col">{{ __('Property') }}</th>
                        <th scope="col">{{ __('Landlord') }}</th>
                        <th scope="col">{{ __('Tenant') }}</th>
                        <th scope="col">{{ __('Total. Paid') }}</th>
                        <th scope="col">{{ __('Landlord Received') }}</th>
                        <th scope="col">{{ __('Paid via') }}</th>
                        <th scope="col">{{ __('Payment Status') }}</th>
                        <th scope="col">{{ __('Actions') }}</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach ($bookings as $booking)
                        <tr>
                          <td>
                            <input type="checkbox" class="bulk-check" data-val="{{ $booking->id }}">
                          </td>
                          <td>{{ '#' . $booking->booking_number }}</td>
                          <td>
                            @php
                              $packageInfo = $booking->tourPackage->packageContent
                                  ->where('language_id', $defaultLang->id)
                                  ->first();
                            @endphp
                            <a href="{{ route('package_details', ['id' => $packageInfo->package_id, 'slug' => $packageInfo->slug]) }}"
                              target="_blank">{{ $packageInfo->title }}</a>
                          </td>
                          <td>
                            @php
                              $vendor = $booking->vendor()->first();
                            @endphp
                            @if ($vendor)
                              <a
                                href="{{ route('admin.vendor_management.vendor_details', ['id' => $vendor->id, 'language' => $defaultLang->code]) }}">{{ $vendor->username }}</a>
                            @else
                              <a class="badge badge-success" href="javascript:void(0)">{{ __('Admin') }}</a>
                            @endif
                          </td>
                          <td>
                            @php
                              $user = $booking->user()->first();
                            @endphp
                            @if ($user)
                              <a href="{{ route('register.user.view', $user->id) }}"
                                class="">{{ $user->username }}</a>
                            @else
                              <span class="badge badge-info" class="">{{ __('Guest') }}</span>
                            @endif
                          </td>
                          <td>{{ $booking->currency_text_position == 'left' ? $booking->currency_text : '' }}
                            {{ $booking->grand_total }}
                            {{ $booking->currency_text_position == 'right' ? $booking->currency_text : '' }}
                          </td>

                          <td>
                            @if (!is_null($booking->received_amount))
                              {{ $booking->currency_text_position == 'left' ? $booking->currency_text : '' }}
                              {{ $booking->received_amount }}
                              {{ $booking->currency_text_position == 'right' ? $booking->currency_text : '' }}
                            @else
                              {{ '-' }}
                            @endif
                          </td>

                          <td>{{ $booking->payment_method }}</td>
                          <td>
                            @if ($booking->gateway_type == 'online')
                              @if ($booking->payment_status == 1)
                                <h2 class="d-inline-block"><span class="badge badge-success">{{ __('Paid') }}</span>
                                </h2>
                              @else
                                <h2 class="d-inline-block"><span class="badge badge-danger">{{ __('Unpaid') }}</span>
                                </h2>
                              @endif
                            @else
                              @if ($booking->payment_status == 0)
                                <form class="d-inline-block paymentStatusForm"
                                  action="{{ route('admin.package_bookings.update_payment_status') }}" method="post">
                                  @csrf
                                  <input type="hidden" name="booking_id" value="{{ $booking->id }}">

                                  <select
                                    class="form-control form-control-sm {{ $booking->payment_status == 1 ? 'bg-success' : 'bg-danger' }} paymentStatusBtn"
                                    name="payment_status">
                                    <option value="1" {{ $booking->payment_status == 1 ? 'selected' : '' }}>
                                      {{ __('Paid') }}
                                    </option>
                                    <option value="0" {{ $booking->payment_status == 0 ? 'selected' : '' }}>
                                      {{ __('Unpaid') }}
                                    </option>
                                  </select>
                                </form>
                              @else
                                @if ($booking->payment_status == 1)
                                  <h2 class="d-inline-block"><span class="badge badge-success">{{ __('Paid') }}</span>
                                  </h2>
                                @else
                                  <h2 class="d-inline-block"><span class="badge badge-danger">{{ __('Unpaid') }}</span>
                                  </h2>
                                @endif
                              @endif
                            @endif
                          </td>
                          <td>
                            <div class="dropdown">
                              <button class="btn btn-secondary btn-sm dropdown-toggle" type="button"
                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                {{ __('Select') }}
                              </button>

                              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a href="{{ route('admin.package_bookings.booking_details', ['id' => $booking->id]) }}"
                                  class="dropdown-item">{{ __('Details') }}</a>

                                @if (!empty($booking->attachment))
                                  <a href="" data-toggle="modal"
                                    data-target="#attachmentModal{{ $booking->id }}"
                                    class="dropdown-item">{{ __('Attachment') }}</a>
                                @endif

                                <a href="{{ asset('assets/invoices/packages/' . $booking->invoice) }}"
                                  class="dropdown-item" target="_blank">{{ __('Invoice') }}</a>

                                <a href="#" class="dropdown-item mailBtn" data-target="#mailModal"
                                  data-toggle="modal"
                                  data-customer_email="{{ $booking->customer_email }}">{{ __('Send Mail') }}</a>

                                <form class="deleteForm d-block"
                                  action="{{ route('admin.package_bookings.delete_booking', ['id' => $booking->id]) }}"
                                  method="post">
                                  @csrf
                                  <button type="submit" class="deleteBtn">
                                    {{ __('Delete') }}
                                  </button>
                                </form>
                              </div>
                            </div>
                          </td>
                        </tr>

                        @includeIf('backend.packages.show_attachment')
                      @endforeach
                    </tbody>
                  </table>
                </div>
              @endif
            </div>
          </div>
        </div>

        <div class="card-footer">
          <div class="row">
            <div class="d-inline-block mx-auto">
              {{ $bookings->appends(['booking_no' => request()->input('booking_no')])->links() }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  @includeIf('backend.packages.send_mail')
@endsection
