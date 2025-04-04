@extends('backend.layout')

@section('content')
  <div class="page-header">
    <h4 class="page-title">{{ __('Settings') }}</h4>
    <ul class="breadcrumbs">
      <li class="nav-home">
        <a href="{{route('admin.dashboard')}}">
          <i class="flaticon-home"></i>
        </a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Property Management') }}</a>
      </li>
      <li class="separator">
        <i class="flaticon-right-arrow"></i>
      </li>
      <li class="nav-item">
        <a href="#">{{ __('Settings') }}</a>
      </li>
    </ul>
  </div>

  <div class="row">
    <div class="col-md-12">
      <div class="card">
        <div class="card-header">
          <div class="row">
            <div class="col-lg-4">
              <div class="card-title d-inline-block">{{ __('Property Settings') }}</div>
            </div>
          </div>
        </div>

        <div class="card-body pt-5 pb-5">
          <div class="row">
            <div class="col-lg-6 offset-lg-3">
              <form
                id="settingsForm"
                action="{{ route('admin.packages_management.update_settings') }}"
                method="POST"
              >
                @csrf
                <div class="form-group">
                  <label>{{ __('Category Status*') }}</label>
                  <div class="selectgroup w-100">
                    <label class="selectgroup-item">
                      <input
                        type="radio"
                        name="package_category_status"
                        value="1"
                        class="selectgroup-input"
                        {{ $data->package_category_status == 1 ? 'checked' : '' }}
                      >
                      <span class="selectgroup-button">{{ __('Active') }}</span>
                    </label>

                    <label class="selectgroup-item">
                      <input
                        type="radio"
                        name="package_category_status"
                        value="0"
                        class="selectgroup-input"
                        {{ $data->package_category_status == 0 ? 'checked' : '' }}
                      >
                      <span class="selectgroup-button">{{ __('Deactive') }}</span>
                    </label>
                  </div>
                  @if ($errors->has('package_category_status'))
                    <p class="text-danger">{{ $errors->first('package_category_status') }}</p>
                  @endif

                  <p class="mt-2 text-warning">
                    {{ __('Specify whether the property category will be active or not.') }}
                  </p>
                </div>

                <div class="form-group">
                  <label>{{ __('Rating Status*') }}</label>
                  <div class="selectgroup w-100">
                    <label class="selectgroup-item">
                      <input
                        type="radio"
                        name="package_rating_status"
                        value="1"
                        class="selectgroup-input"
                        {{ $data->package_rating_status == 1 ? 'checked' : '' }}
                      >
                      <span class="selectgroup-button">{{ __('Active') }}</span>
                    </label>

                    <label class="selectgroup-item">
                      <input
                        type="radio"
                        name="package_rating_status"
                        value="0"
                        class="selectgroup-input"
                        {{ $data->package_rating_status == 0 ? 'checked' : '' }}
                      >
                      <span class="selectgroup-button">{{ __('Deactive') }}</span>
                    </label>
                  </div>
                  @if ($errors->has('package_rating_status'))
                    <p class="text-danger">{{ $errors->first('package_rating_status') }}</p>
                  @endif

                  <p class="mt-2 text-warning">
                    {{ __('Specify whether the rating system for property will be active or not.') }}
                  </p>
                </div>

                <div class="form-group">
                  <label>{{ __('Guest Checkout Status*') }}</label>
                  <div class="selectgroup w-100">
                    <label class="selectgroup-item">
                      <input
                        type="radio"
                        name="package_guest_checkout_status"
                        value="1"
                        class="selectgroup-input"
                        {{ $data->package_guest_checkout_status == 1 ? 'checked' : '' }}
                      >
                      <span class="selectgroup-button">{{ __('Active') }}</span>
                    </label>

                    <label class="selectgroup-item">
                      <input
                        type="radio"
                        name="package_guest_checkout_status"
                        value="0"
                        class="selectgroup-input"
                        {{ $data->package_guest_checkout_status == 0 ? 'checked' : '' }}
                      >
                      <span class="selectgroup-button">{{ __('Deactive') }}</span>
                    </label>
                  </div>
                  @if ($errors->has('package_guest_checkout_status'))
                    <p class="text-danger">{{ $errors->first('package_guest_checkout_status') }}</p>
                  @endif

                  <p class="mt-2 mb-0 text-warning">
                    {{ __('If guest checkout is active, then users can checkout without login.') }}
                  </p>
                </div>
              </form>
            </div>
          </div>
        </div>

        <div class="card-footer">
          <div class="row">
            <div class="col-12 text-center">
              <button type="submit" form="settingsForm" class="btn btn-success">
                {{ __('Update') }}
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
