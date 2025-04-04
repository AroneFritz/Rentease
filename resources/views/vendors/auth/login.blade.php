@extends('frontend.layout')

@section('pageHeading')
  {{ __('Login') }}
@endsection

@php
  $metaKeys = !empty($seo->meta_keyword_vendor_login) ? $seo->meta_keyword_vendor_login : '';
  $metaDesc = !empty($seo->meta_description_vendor_login) ? $seo->meta_description_vendor_login : '';
@endphp

@section('meta-keywords', "$metaKeys")
@section('meta-description', "$metaDesc")

@section('content')
  <main>
    <!-- Breadcrumb Section Start -->
    <section class="breadcrumb-area d-flex align-items-center position-relative bg-img-center lazy"
      data-bg="{{ asset('assets/img/' . $breadcrumbInfo->breadcrumb) }}">
      <div class="container">
        <div class="breadcrumb-content text-center">
          <h1>{{ __('Landlord Login') }}</h1>
          <ul class="list-inline">
            <li><a href="{{ route('index') }}">{{ __('Home') }}</a></li>
            <li><i class="far fa-angle-double-right"></i></li>
            <li>{{ __('Landlord Login') }}</li>
          </ul>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Login Area Start -->
    <div class="user-area-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            @if (Session::has('alert'))
              <div class="alert alert-danger">{{ Session::get('alert') }}</div>
            @endif
            <div class="user-content">
              <form action="{{ route('vendor.login_submit') }}" method="POST">
                @csrf

                <!-- Change Username to Email -->
                <div class="input-box">
                  <label>{{ __('Email') . '*' }}</label>
                  <input type="email" name="email" value="{{ old('email') }}" required>
                  @error('email')
                    <p class="mt-3 ml-2 text-danger">{{ $message }}</p>
                  @enderror
                </div>

                <div class="input-box">
                  <label>{{ __('Password') . '*' }}</label>
                  <input type="password" name="password" value="{{ old('password') }}" required>
                  @error('password')
                    <p class="mt-3 ml-2 text-danger">{{ $message }}</p>
                  @enderror
                </div>

                @if ($websiteInfo->google_recaptcha_status == 1)
                  <div class="d-block mb-4">
                    {!! NoCaptcha::renderJs() !!}
                    {!! NoCaptcha::display() !!}
                    @if ($errors->has('g-recaptcha-response'))
                      @php
                        $errmsg = $errors->first('g-recaptcha-response');
                      @endphp
                      <p class="text-danger mb-0 mt-2">{{ __("$errmsg") }}</p>
                    @endif
                  </div>
                @endif

                <div class="input-box">
                  <button type="submit" class="btn">{{ __('Log In') }}</button>
                  <a href="{{ route('vendor.forget.password') }}">{{ __('Lost your password?') }}</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Login Area End -->
  </main>
@endsection
