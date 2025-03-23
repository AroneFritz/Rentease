@extends('frontend.layout')

@section('pageHeading')
  {{ __('Property Details') }}
@endsection

@php
  $metaKeys = !empty($details->meta_keywords) ? $details->meta_keywords : '';
  $metaDesc = !empty($details->meta_description) ? $details->meta_description : '';
@endphp

@section('meta-keywords', "$metaKeys")
@section('meta-description', "$metaDesc")

@section('styles')
<style>
  .post-thumb-slider {
    position: relative;
  }
  .main-slider {
    position: relative;
  }
  .main-image-container {
    position: relative;
    width: 100%;
  }
  .wishlist-button {
    position: absolute;
    top: 15px;
    right: 15px;
    z-index: 10;
  }
  .btn-wishlist {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.9);
    display: flex;
    align-items: center;
    justify-content: center;
    border: none;
    transition: all 0.3s;
    color: #dc3545;
  }
  .btn-wishlist:hover, .btn-wishlist.active {
    background: #dc3545;
    color: white;
  }
  .btn-wishlist i {
    font-size: 18px;
  }
  .single-img {
    width: 100%;
    height: auto;
  }
  .main-img {
    display: block;
    position: relative;
  }
  .main-img img {
    width: 100%;
    height: auto;
  }
  .gallery-wrap {
    position: relative;
  }
  /* Success Message Styling */
  .alert-success {
    position: fixed;
    top: 20px;
    right: 20px;
    z-index: 99999;
    background: #4CAF50;
    color: white;
    padding: 15px 25px;
    border-radius: 4px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    animation: slideInRight 0.5s ease-out forwards;
  }
  @keyframes slideInRight {
    from {
      transform: translateX(100%);
      opacity: 0;
    }
    to {
      transform: translateX(0);
      opacity: 1;
    }
  }
</style>
@endsection

@section('content')
  <!-- Success Message from Controller -->
  @if(session()->has('success'))
    <div class="alert alert-success" style="background-color: #4CAF50; color: white; padding: 10px; margin: 0;">
      {{ session()->get('success') }}
    </div>
  @endif

  <main>
    <!-- Breadcrumb Section Start -->
    <section class="breadcrumb-area d-flex align-items-center position-relative bg-img-center lazy"
      data-bg="{{ asset('assets/img/' . $breadcrumbInfo->breadcrumb) }}">
      <div class="container">
        <div class="breadcrumb-content text-center">
          <h1>{{ strlen($details->title) > 30 ? mb_substr($details->title, 0, 30, 'utf-8') . '...' : $details->title }}
          </h1>

          <ul class="list-inline">
            <li><a href="{{ route('index') }}">{{ __('Home') }}</a></li>
            <li><i class="far fa-angle-double-right"></i></li>

            <li>{{ __('Property Details') }}</li>
          </ul>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <section class="packages-details-area">
      <div class="container details-wrapper">
        {{-- show error message for attachment --}}
        @error('attachment')
          <div class="row">
            <div class="col">
              <div class="alert alert-danger alert-block">
                <strong>{{ $message }}</strong>
                <button type="button" class="close" data-dismiss="alert">×</button>
              </div>
            </div>
          </div>
        @enderror

        {{-- show error message for package review --}}
        @error('rating')
          <div class="row">
            <div class="col">
              <div class="alert alert-danger alert-block">
                <strong>{{ $message }}</strong>
                <button type="button" class="close" data-dismiss="alert">×</button>
              </div>
            </div>
          </div>
        @enderror

        <div class="row gx-xl-5">
          <div class="col-lg-8">
            <div class="packages-details-wrapper">

              <div class="gallery-wrap box-wrap">
                <div class="packages-big-slider">
                  @php
                    $sliders = App\Models\PackageManagement\PackageImage::where(
                        'package_id',
                        $details->package_id,
                    )->get();
                  @endphp

                  @foreach ($sliders as $slider)
                    <div class="single-item">
                      <a href="{{ asset('assets/img/package-gallery/' . $slider->image) }}" class="gallery-single">
                        <img src="{{ asset('assets/img/package-gallery/' . $slider->image) }}" alt="image">
                      </a>
                    </div>
                  @endforeach
                </div>

                <div class="packages-thumb-slider">
                  @foreach ($sliders as $thumbImg)
                    <div class="single-item">
                      <img src="{{ asset('assets/img/package-gallery/' . $thumbImg->image) }}" alt="image">
                    </div>
                  @endforeach
                </div>

                <div class="wishlist-button">
                  @auth
                    <form action="{{ route('user.wishlist.store') }}" method="POST" class="d-inline wishlist-form">
                      @csrf
                      <input type="hidden" name="item_id" value="{{ $details->package_id }}">
                      <input type="hidden" name="type" value="package">
                      @php
                        $isWishlisted = Auth::user()->wishlists()->where('wishlistable_id', $details->package_id)
                          ->where('wishlistable_type', 'App\Models\PackageManagement\Package')
                          ->exists();
                      @endphp
                      <button type="submit" class="btn btn-wishlist {{ $isWishlisted ? 'active' : '' }}">
                        <i class="far fa-heart"></i>
                      </button>
                    </form>
                  @else
                    <a href="{{ route('user.login') }}" class="btn btn-wishlist">
                      <i class="far fa-heart"></i>
                    </a>
                  @endauth
                </div>
              </div>

              <p id="package-id" class="d-none">{{ $details->package_id }}</p>

              <div class="discription-box box-wrap">
                <h4 class="title">{{ convertUtf8($details->title) }}</h4>
                <h6>
                  @if ($details->package->vendor_id != null)
                    @php
                      $vendor = App\Models\Vendor::where('id', $details->package->vendor_id)->first();
                    @endphp
                    <a href="{{ route('frontend.vendor.details', $vendor->username) }}">{{ __('By') }}
                      {{ $vendor->username }}</a>
                  @else
                    @php
                      $admin = App\Models\Admin::first();
                    @endphp
                    <a href="javascript:void(0)">{{ __('By') }}
                      {{ $admin->username }}</a>
                  @endif
                </h6>
                <div class="summernote-content">
                  {!! $details->description !!}
                </div>
              </div>

              @if (count($plans) > 0)
                <div class="schedule-wrapp box-wrap">
                  @if ($details->package->plan_type == 'daywise')
                    <h4 class="title">{{ __('Detailed Day-wise Itinerary') }}</h4>

                    @foreach ($plans as $plan)
                      <div class="single-schedule">
                        <div class="icon">
                          <i class="far fa-calendar-alt"></i>
                        </div>
                        <div class="content">
                          <h4>{{ __('Day') . '-' . $plan->day_number . ' : ' . $plan->title }}</h4>
                          <div class="summernote-content">
                            {!! $plan->plan !!}
                          </div>
                        </div>
                      </div>
                    @endforeach
                  @elseif ($details->package->plan_type == 'timewise')
                    <h4 class="title">{{ __('Detailed Time-wise Itinerary') }}</h4>
                    @foreach ($plans as $plan)
                      <div class="single-schedule">
                        <div class="icon">
                          <i class="far fa-clock"></i>
                        </div>
                        <div class="content">
                          <h4>{{ $plan->start_time . ' - ' . $plan->end_time . ' : ' . $plan->title }}</h4>
                          <div class="summernote-content">
                            {!! $plan->plan !!}
                          </div>
                        </div>
                      </div>
                    @endforeach
                  @endif
                </div>
              @endif

              @if (count($locations) > 0)
                <div class="places-box box-wrap">
                  <h4 class="title">{{ __('Places Will Be Covered') }}</h4>
                  @foreach ($locations as $location)
                    <a href="#" data-bs-toggle="modal" title="{{ __('Click here to see in map') }}"
                      data-bs-target="#locationModal{{ $location->id }}">{{ $location->name }}</a>

                    <!-- Location Modal -->
                    @if (!empty($location->latitude) && !empty($location->longitude))
                      <div class="modal fade" id="locationModal{{ $location->id }}" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLongTitle">
                                {{ $location->name . ' ' . __('on Map') }}</h5>
                              <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body p-0">
                              <iframe width="100%" height="400" frameborder="0" scrolling="no" marginheight="0"
                                marginwidth="0"
                                src="//maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q={{ $location->latitude }},%20{{ $location->longitude }}+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>
                            </div>
                          </div>
                        </div>
                      </div>
                    @endif
                  @endforeach
                </div>
              @endif

              @if ($details->package->pricing_type != 'negotiable')
                <div class="review-area box-wrap {{ $status->package_rating_status == 0 ? 'd-none' : '' }}">
                  <h4 class="title">{{ __('Client’s Reviews') }}</h4>

                  @if (count($reviews) == 0)
                    <div class="py-4 bg-light mb-2">
                      <h5 class="text-center mb-3">{{ __('This Property Has No Review Yet.') }}</h5>
                    </div>
                  @else
                    <ul class="review-list">
                      @foreach ($reviews as $review)
                        <li>
                          @php
                            $user = $review->packageReviewedByUser()->first();
                          @endphp

                          <div class="review-user">
                            <img class="lazy"
                              data-src="{{ !empty($user->image) ? asset('assets/img/users/' . $user->image) : asset('assets/img/user-profile.jpg') }}"
                              alt="user image">
                          </div>

                          <div class="review-desc">
                            <div class="rate mb-2">
                              <div class="rating" style="width:{{ $review->rating * 20 }}%"></div>
                            </div>

                            <h6>{{ $user->first_name . ' ' . $user->last_name }} <span class="review-date">
                                {{ date_format($review->updated_at, 'd M Y') }}</span></h6>

                            <p>{{ $review->comment }}</p>
                          </div>
                        </li>
                      @endforeach
                    </ul>
                  @endif
                </div>
              @endif

              @if ($status->package_rating_status == 1)
                @guest('web')
                  <h4><a href="{{ route('user.login', ['redirectPath' => 'package_details']) }}">{{ __('Login') }}</a>
                    {{ __('To Give Your Review') }}.</h4>
                @endguest

                @auth('web')
                  @if ($details->package->pricing_type != 'negotiable')
                    <div class="review-form box-wrap">
                      <h4 class="title">{{ __('Give Your Review') }}</h4>
                      <form action="{{ route('package.store_review', ['id' => $details->package_id]) }}" method="POST">
                        @csrf
                        <div class="row">
                          <div class="col-12">
                            <div class="mb-25">
                              <div class="review-content">
                                <ul class="review-value review-1">
                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="1">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>
                                </ul>

                                <ul class="review-value review-2">
                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="2">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="2">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>
                                </ul>

                                <ul class="review-value review-3">
                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="3">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="3">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="3">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>
                                </ul>

                                <ul class="review-value review-4">
                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="4">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="4">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="4">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="4">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>
                                </ul>

                                <ul class="review-value review-5">
                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="5">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="5">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="5">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="5">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>

                                  <li>
                                    <a class="cursor-pointer" data-ratingVal="5">
                                      <i class="far fa-star"></i>
                                    </a>
                                  </li>
                                </ul>
                              </div>
                            </div>
                          </div>

                          <input type="hidden" id="ratingId" name="rating">

                          <div class="col-12">
                            <div class="input-wrap text-area">
                              <textarea placeholder="{{ __('Review') }}" name="comment">{{ old('comment') }}</textarea>
                              <i class="far fa-pencil"></i>
                            </div>
                          </div>

                          <div class="col-12">
                            <button type="submit" class="btn filled-btn">{{ __('Submit') }}</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  @endif
                @endauth
              @endif
            </div>
          </div>

          @php
            $position = $currencyInfo->base_currency_symbol_position;
            $symbol = $currencyInfo->base_currency_symbol;
          @endphp

          <div class="col-lg-4">
            <div class="packages-sidebar">
              <div class="widget information-widget">
                <h4 class="widget-title">{{ __('Information') }}</h4>
                <ul class="list">
                  @if ($details->package->pricing_type == 'negotiable')
                    <li><strong>{{ __('Price') }}</strong>: {{ __(strtoupper($details->package->pricing_type)) }}
                    </li>
                  @else
                    <li><strong>{{ __('Price') }}</strong> :
                      {{ $position == 'left' ? $symbol : '' }}{{ $details->package->package_price }}{{ $position == 'right' ? $symbol : '' }}
                      {{ '(' . __(strtoupper($details->package->pricing_type)) . ')' }}</li>
                  @endif
                  <li><strong>{{ __('Number of Days') }}</strong> : {{ $details->package->number_of_days }}</li>
                  <li><strong>{{ __('Maximum Persons') }}</strong> :
                    {{ $details->package->max_persons != null ? $details->package->max_persons : '-' }}</li>
                </ul>
                @if ($packageRating->package_rating_status == 1)
                  <div class="rate">
                    <div class="rating" style="width:{{ $avgRating * 20 }}%"></div>
                  </div>
                @endif
              </div>

              <div class="widget booking-widget {{ $details->package->pricing_type == 'negotiable' ? 'd-none' : '' }}">
                <h4 class="widget-title">{{ __('Rent Property') }}</h4>

                {{ __('Please fill up your information and address before to proceeding to rent') }} <a
                href="{{ route('user.edit_profile', ['redirectPath' => 'some_path']) }}">{{ __('Click Here') }}</a>

                <form action="{{ route('package_booking') }}" method="POST" enctype="multipart/form-data"
                  id="my-checkout-form">
                  @csrf
                  <input type="hidden" name="package_id" value="{{ $details->package_id }}">

                  <div class="form_group">
                    @guest('web')
                      <input type="text" placeholder="{{ __('Full Name') }}" name="customer_name"
                        value="{{ old('customer_name') }}">
                    @endguest

                    @auth('web')
                      @php
                        if (
                            !empty(Auth::guard('web')->user()->first_name) ||
                            !empty(Auth::guard('web')->user()->last_name)
                        ) {
                            $fname =
                                Auth::guard('web')->user()->first_name . ' ' . Auth::guard('web')->user()->last_name;
                        } else {
                            $fname = '';
                        }
                      @endphp
                      <input type="text" placeholder="{{ __('Full Name') }}" name="customer_name"
                        value="{{ $fname }}">
                    @endauth
                    @error('customer_name')
                      <p class="mt-2 ml-2 text-danger">{{ $message }}</p>
                    @enderror
                  </div>

                  <div class="form_group">
                    @guest('web')
                      <input type="text" placeholder="{{ __('Phone Number') }}" name="customer_phone"
                        value="{{ old('customer_phone') }}">
                    @endguest

                    @auth('web')
                      <input type="text" placeholder="{{ __('Phone Number') }}" name="customer_phone"
                        value="{{ Auth::guard('web')->user()->contact_number }}">
                    @endauth
                    @error('customer_phone')
                      <p class="mt-2 ml-2 text-danger">{{ $message }}</p>
                    @enderror
                  </div>

                  <div class="form_group">
                    @guest('web')
                      <input type="email" placeholder="{{ __('Email Address') }}" name="customer_email"
                        value="{{ old('customer_email') }}">
                    @endguest

                    @auth('web')
                      <input type="email" placeholder="{{ __('Email Address') }}" name="customer_email"
                        value="{{ Auth::guard('web')->user()->email }}">
                    @endauth
                    @error('customer_email')
                      <p class="mt-2 ml-2 text-danger">{{ $message }}</p>
                    @enderror
                  </div>

                  <div class="form_group">
                    <input type="text" placeholder="{{ __('Number of Visitors') }}" name="visitors"
                      value="{{ old('visitors') }}">
                    @error('visitors')
                      <p class="mt-2 ml-2 text-danger">{{ $message }}</p>
                    @enderror
                  </div>

                  <div class="form_group h-50">
                    <select name="paymentType" id="payment-gateways" class="nice-select">
                      <option selected value="none">
                        {{ __('Select Payment Gateway') }}
                      </option>
                      @foreach ($onlineGateways as $onlineGateway)
                        <option value="{{ $onlineGateway->keyword }}">
                          {{ __($onlineGateway->name) }}
                        </option>
                      @endforeach

                      @if (!empty($offlineGateways))
                        @foreach ($offlineGateways as $offlineGateway)
                          <option value="{{ $offlineGateway['id'] }}">
                            {{ __($offlineGateway['name']) }}
                          </option>
                        @endforeach
                      @endif
                    </select>
                  </div>

                  <div class="row iyzico-element {{ old('paymentType') == 'iyzico' ? '' : 'd-none' }}">
                    <div class="col-12">
                      <div class="field-input">
                        <input type="text" class="card-elements mb-2" name="city"
                          placeholder="{{ __('City') }}" autocomplete="off" value="{{ old('city') }}">
                      </div>
                      @error('city')
                        <p class="ml-2 mb-2 text-danger">{{ convertUtf8($message) }}</p>
                      @enderror
                    </div>

                    <div class="col-12">
                      <div class="field-input">
                        <input type="text" class="card-elements mb-2" placeholder="{{ __('Country') }}"
                          name="country" value="{{ old('country') }}">
                      </div>
                      @error('country')
                        <p class="ml-2 mb-2 text-danger">{{ convertUtf8($message) }}</p>
                      @enderror
                    </div>

                    <div class="col-12">
                      <div class="field-input">
                        <input type="text" class="card-elements mb-2" placeholder="{{ __('Address') }}"
                          name="address" value="{{ old('address') }}">
                      </div>
                      @error('address')
                        <p class="ml-2 text-danger">{{ convertUtf8($message) }}</p>
                      @enderror
                    </div>

                    <div class="col-12">
                      <div class="field-input">
                        <input type="text" class="card-elements  mb-2 " placeholder="{{ __('Zip Code') }}"
                          name="zip_code" value="{{ old('zip_code') }}">
                      </div>
                      @error('zip_code')
                        <p class="ml-2 mb-2 text-danger">{{ convertUtf8($message) }}</p>
                      @enderror
                    </div>

                    <div class="col-12">
                      <div class="field-input">
                        <input type="text" class="card-elements mb-2" placeholder="{{ __('Identity Number') }}"
                          name="identity_number" value="{{ old('identity_number') }}">
                      </div>
                      @error('identity_number')
                        <p class="ml-2 mb-2 text-danger">{{ convertUtf8($message) }}</p>
                      @enderror
                    </div>

                  </div>

                  <!-----------stripe------------->
                  <div id="stripe-element" class="mb-2 mt-2">
                    <!-- A Stripe Element will be inserted here. -->
                  </div>
                  <!-- Used to display form errors -->
                  <div id="stripe-errors" role="alert" class="mb-2 text-danger"></div>
                  <!-----------stripe------------->

                  {{-- START: Authorize.net Card Details Form --}}
                  <div class="row gateway-details py-3 authorize-element d-none">
                    <div class="col-lg-12">
                      <div class="form_group mb-2">
                        <input class="form-control" type="text" id="anetCardNumber" placeholder="Card Number" />
                      </div>
                    </div>
                    <div class="col-lg-12">
                      <div class="form_group mb-2">
                        <input class="form-control" type="text" id="anetExpMonth" placeholder="Expire Month" />
                      </div>
                    </div>
                    <div class="col-lg-12">
                      <div class="form_group mb-2">
                        <input class="form-control" type="text" id="anetExpYear" placeholder="Expire Year" />
                      </div>
                    </div>
                    <div class="col-lg-12">
                      <div class="form_group mb-2">
                        <input class="form-control" type="text" id="anetCardCode" placeholder="Card Code" />
                      </div>
                    </div>
                    <input type="hidden" name="opaqueDataValue" id="opaqueDataValue" />
                    <input type="hidden" name="opaqueDataDescriptor" id="opaqueDataDescriptor" />
                    <ul id="anetErrors"></ul>
                  </div>
                  {{-- END: Authorize.net Card Details Form --}}

                  <div class="d-none my-3 px-2" id="gateway-description"></div>

                  <div class="d-none mb-3 px-2" id="gateway-instruction"></div>

                  <div class="d-none mb-4 pl-2" id="gateway-attachment">
                    <input type="file" name="attachment">
                  </div>

                  <div class="mb-2">
                    <div class="d-flex">
                      <input type="text" id="coupon-code" placeholder="{{ __('Enter Your Coupon') }}">
                      <button type="button" class="btn filled-btn coupon-btn-padding" onclick="applyCoupon(event)">
                        {{ __('Apply') }}
                      </button>
                    </div>
                  </div>

                  <div class="price-option-table mt-4">
                    <ul>
                      <input type="hidden" id="base-price" value="{{ $details->package->package_price }}">
                      <li class="single-price-option">
                        <span class="title">{{ __('Subtotal') }} <span
                            class="amount">{{ $position == 'left' ? $symbol : '' }}<span
                              id="subtotal-amount">{{ $details->package->package_price }}</span>{{ $position == 'right' ? $symbol : '' }}</span></span>
                      </li>

                      <li class="single-price-option">
                        <span class="title">{{ __('Discount') }} <span class="text-success">(<i
                              class="fas fa-minus"></i>)</span>
                          <span class="amount">{{ $position == 'left' ? $symbol : '' }}<span
                              id="discount-amount">0.00</span>{{ $position == 'right' ? $symbol : '' }}</span>
                        </span>
                      </li>

                      <li class="single-price-option">
                        <span class="title">{{ __('Total') }} <span
                            class="amount">{{ $position == 'left' ? $symbol : '' }}<span
                              id="total-amount">{{ $details->package->package_price }}</span>{{ $position == 'right' ? $symbol : '' }}</span></span>
                      </li>
                    </ul>
                  </div>

                  <div class="form_group mt-4">
                    <button class="btn filled-btn d-inline-block w-100">{{ __('Rent Now') }}</button>
                  </div>
                </form>
              </div>

              @if (!is_null($details->package->email) || !is_null($details->package->phone))
                <div class="widget information-widget">
                  <h4 class="widget-title">{{ __('Help & Support') }}</h4>
                  <ul class="list">
                    @if (!is_null($details->package->phone))
                      <li><strong>{{ __('Phone') }}</strong>: {{ $details->package->phone }}</li>
                    @endif
                    @if (!is_null($details->package->email))
                      <li><strong>{{ __('Email') }}</strong>: {{ $details->package->email }}</li>
                    @endif
                  </ul>
                </div>
              @endif

              <div class="widget share-widget">
                <h4 class="widget-title">{{ __('Share This Property') }}</h4>
                <ul class="social-icons">
                  <li><a href="//www.facebook.com/sharer/sharer.php?u={{ urlencode(url()->current()) }}"
                      class="facebook"><i class="fab fa-facebook-f"></i></a></li>
                  <li><a href="//twitter.com/intent/tweet?text=my share text&amp;url={{ urlencode(url()->current()) }}"
                      class="twitter"><i class="fab fa-twitter"></i></a></li>
                  <li><a
                      href="//www.linkedin.com/shareArticle?mini=true&amp;url={{ urlencode(url()->current()) }}&amp;title={{ convertUtf8($details->title) }}"
                      class="linkedin"><i class="fab fa-linkedin-in"></i></a></li>
                  <li><a href="//plus.google.com/share?url={{ urlencode(url()->current()) }}" class="google"><i
                        class="fab fa-google"></i></a></li>
                </ul>
              </div>

              <div class="widget latest-package-widget">
                <h4 class="widget-title">{{ __('Related Property') }}</h4>

                @foreach ($latestPackages as $latestPackage)
                  <div class="packages-item">
                    <div class="post-thumbnail">
                      <img class="lazy"
                        data-src="{{ asset('assets/img/package/' . $latestPackage->package->featured_img) }}"
                        alt="image">
                    </div>

                    <div class="entry-content">
                      <h3 class="title"><a
                          href="#">{{ strlen($latestPackage->title) > 30 ? mb_substr($latestPackage->title, 0, 30, 'UTF-8') . '...' : $latestPackage->title }}</a>
                      </h3>
                      <h6>
                        @if ($latestPackage->package->vendor_id != null)
                          @php
                            $vendor = App\Models\Vendor::where('id', $latestPackage->package->vendor_id)->first();
                          @endphp
                          <a href="{{ route('frontend.vendor.details', $vendor->username) }}">{{ __('By') }}
                            {{ $vendor->username }}</a>
                        @else
                          @php
                            $admin = App\Models\Admin::first();
                          @endphp
                          <a href="javascript:void(0)">{{ __('By') }}
                            {{ $admin->username }}</a>
                        @endif
                      </h6>
                      <p>
                        {{ strlen(strip_tags($latestPackage->description)) > 50 ? substr(strip_tags($latestPackage->description), 0, 50) . '...' : strip_tags($latestPackage->description) }}
                      </p>
                      <a href="{{ route('package_details', ['id' => $latestPackage->package_id, 'slug' => $latestPackage->slug]) }}"
                        class="btn">{{ __('view property') }}</a>
                    </div>
                  </div>
                @endforeach
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <!--==== Autorize.net=========--->
  @php
    $anet = App\Models\PaymentGateway\OnlineGateway::where('keyword', 'authorizenet')->first();
    $anerInfo = json_decode($anet->information, true);
    $anetTest = $anerInfo['sandbox_status'];
    $anet_public_key = $anerInfo['public_key'];
    $anet_login_id = $anerInfo['login_id'];

    if ($anetTest == 1) {
        $anetSrc = 'https://jstest.authorize.net/v1/Accept.js';
    } else {
        $anetSrc = 'https://js.authorize.net/v1/Accept.js';
    }
  @endphp
  <!--==== Autorize.net=========--->
@endsection

@section('script')
  <script>
    "use strict";
    var offlineGateways = {!! json_encode($offlineGateways) !!};
    var pricingType = '{{ $details->package->pricing_type }}';
    var initialPrice = '{{ $details->package->package_price }}';
    let stripe_key = "{{ $stripeKey }}";
    let anet_public_key = "{{ $anet_public_key }}";
    let anet_login_id = "{{ $anet_login_id }}";
  </script>
  <script type="text/javascript" src="https://js.stripe.com/v3/"></script>
  <script type="text/javascript" src="{{ $anetSrc }}" charset="utf-8"></script>
  <script src="{{ asset('assets/js/package-details.js') }}"></script>
  <script>
    'use strict';
    $(document).ready(function() {
      $('#stripe-element').addClass('d-none');
    });
  </script>
  <script>
    $(document).ready(function() {
      $('.wishlist-form').on('submit', function(e) {
        e.preventDefault();
        let form = $(this);
        let button = form.find('.btn-wishlist');

        $.ajax({
          url: form.attr('action'),
          method: 'POST',
          data: form.serialize(),
          success: function(response) {
            // Toggle active class and update icon color
            button.toggleClass('active');
            if (button.hasClass('active')) {
              button.css({
                'background': '#dc3545',
                'color': 'white'
              });
            } else {
              button.css({
                'background': 'rgba(255, 255, 255, 0.9)',
                'color': '#dc3545'
              });
            }

            // Show success message in top right
            let alertDiv = $('<div class="alert alert-success" style="position: fixed; top: 20px; right: 20px; z-index: 99999; background: #4CAF50; color: white; padding: 15px 25px; border-radius: 4px; box-shadow: 0 2px 6px rgba(0,0,0,0.2); animation: slideInRight 0.5s ease-out forwards;">' + response.success + '</div>');
            $('body').append(alertDiv);

            // Remove alert after 3 seconds
            setTimeout(function() {
              alertDiv.fadeOut(function() {
                $(this).remove();
              });
            }, 3000);
          },
          error: function(error) {
            console.error('Error:', error);
          }
        });
      });

      // Initialize button state on page load
      $('.btn-wishlist.active').css({
        'background': '#dc3545',
        'color': 'white'
      });
    });
  </script>
@endsection
