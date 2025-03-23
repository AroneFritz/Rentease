@extends('frontend.layout')

@section('pageHeading')
  {{ __('My Wishlist') }}
@endsection

@section('content')
  <main>
    <!-- Breadcrumb Section Start -->
    <section class="breadcrumb-area d-flex align-items-center position-relative bg-img-center lazy"
      style="background-image: url('{{ asset('assets/img/breadcrumb.jpg') }}');">
      <div class="container">
        <div class="breadcrumb-content text-center">
          <h1>{{ __('My Wishlist') }}</h1>

          <ul class="list-inline">
            <li><a href="{{ route('index') }}">{{ __('Home') }}</a></li>
            <li><i class="far fa-angle-double-right"></i></li>
            <li>{{ __('My Wishlist') }}</li>
          </ul>
        </div>
      </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Dashboard Area Start -->
    <section class="user-dashboard">
      <div class="container">
        <div class="row">
          @include('frontend.user.side_navbar')

          <div class="col-lg-9">
            <div class="row">
              <div class="col-lg-12">
                <div class="user-profile-details">
                  <div class="account-info">
                    <div class="title">
                      <h4>{{ __('My Wishlist') }}</h4>
                    </div>

                    <div class="row">
                      <!-- Rooms Section -->
                      @if($wishlistedRooms->count() > 0)
                        <div class="col-12 mb-4">
                          <h5>{{ __('Saved Rooms') }}</h5>
                          <div class="row">
                            @foreach($wishlistedRooms as $room)
                              <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card">
                                  <div class="room-img-wrapper">
                                    @if($room->featured_img)
                                      <img src="{{ asset('assets/img/rooms/'.$room->featured_img) }}" class="card-img-top" alt="room">
                                    @else
                                      @php
                                        $firstImage = $room->images()->first();
                                      @endphp
                                      @if($firstImage)
                                        <img src="{{ asset('assets/img/rooms/'. $firstImage->image) }}" class="card-img-top" alt="room">
                                      @else
                                        <img src="{{ asset('assets/img/default.jpg') }}" class="card-img-top" alt="default">
                                      @endif
                                    @endif
                                  </div>
                                  <div class="card-body">
                                    <h5 class="card-title">{{ $room->roomContent->where('language_id', $defaultLang->id)->first()->title }}</h5>
                                    <p class="card-text">{{ __('Price') }}: {{ $room->rent }} / {{ __('PerDay') }}</p>
                                    <div class="d-flex justify-content-between">
                                      <a href="{{ route('room_details', ['id' => $room->id, 'slug' => $room->roomContent->where('language_id', $defaultLang->id)->first()->slug]) }}" class="btn btn-primary btn-sm">{{ __('View Details') }}</a>
                                      <form action="{{ route('user.wishlist.remove') }}" method="POST" class="d-inline">
                                        @csrf
                                        <input type="hidden" name="item_id" value="{{ $room->id }}">
                                        <input type="hidden" name="type" value="room">
                                        <button type="submit" class="btn btn-danger btn-sm">{{ __('Remove') }}</button>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            @endforeach
                          </div>
                        </div>
                      @endif

                      <!-- Packages Section -->
                      @if($wishlistedPackages->count() > 0)
                        <div class="col-12">
                          <h5>{{ __('Saved Property') }}</h5>
                          <div class="row">
                            @foreach($wishlistedPackages as $package)
                              <div class="col-md-6 col-lg-4 mb-4">
                                <div class="card">
                                  <div class="package-img-wrapper">
                                    @php
                                      $sliders = \App\Models\PackageManagement\PackageImage::where('package_id', $package->id)->get();
                                    @endphp
                                    @if($package->featured_img)
                                      <img src="{{ asset('assets/img/package/'.$package->featured_img) }}" class="card-img-top" alt="package">
                                    @elseif($sliders->count() > 0)
                                      <img src="{{ asset('assets/img/package/'.$sliders->first()->image) }}" class="card-img-top" alt="package">
                                    @else
                                      <img src="{{ asset('assets/img/default.jpg') }}" class="card-img-top" alt="default">
                                    @endif
                                  </div>
                                  <div class="card-body">
                                    <h5 class="card-title">{{ $package->packageContent->where('language_id', $defaultLang->id)->first()->title }}</h5>
                                    <p class="card-text">{{ __('Price') }}: {{ $package->package_price }} / {{ __('Monthly') }}</p></p>
                                    <div class="d-flex justify-content-between">
                                      <a href="{{ route('package_details', ['id' => $package->id, 'slug' => $package->packageContent->where('language_id', $defaultLang->id)->first()->slug]) }}" class="btn btn-primary btn-sm">{{ __('View Details') }}</a>
                                      <form action="{{ route('user.wishlist.remove') }}" method="POST" class="d-inline">
                                        @csrf
                                        <input type="hidden" name="item_id" value="{{ $package->id }}">
                                        <input type="hidden" name="type" value="package">
                                        <button type="submit" class="btn btn-danger btn-sm">{{ __('Remove') }}</button>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            @endforeach
                          </div>
                        </div>
                      @endif

                      @if($wishlistedRooms->count() == 0 && $wishlistedPackages->count() == 0)
                        <div class="col-12">
                          <div class="alert alert-info">
                            {{ __('Your wishlist is empty.') }}
                          </div>
                        </div>
                      @endif
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Dashboard Area End -->
  </main>
@endsection

@section('styles')
<style>
  .room-img-wrapper, .package-img-wrapper {
    position: relative;
    padding-top: 56.25%; /* 16:9 Aspect Ratio */
    overflow: hidden;
    background-color: #f8f9fa;
  }
  .room-img-wrapper img, .package-img-wrapper img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  .card {
    height: 100%;
    display: flex;
    flex-direction: column;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: relative;
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
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  }
  .btn-wishlist:hover {
    background: rgba(255, 255, 255, 0.95);
    color: #dc3545;
    transform: scale(1.1);
  }
  .btn-wishlist.active {
    background: rgba(255, 255, 255, 0.95);
    color: #dc3545;
  }
  .btn-wishlist i {
    font-size: 20px;
  }
  .card-body {
    flex: 1;
    display: flex;
    flex-direction: column;
    padding: 1rem;
  }
  .card-title {
    font-size: 1rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
    line-height: 1.4;
  }
  .card-text {
    margin-bottom: 1rem;
    color: #666;
  }
  .btn {
    padding: 0.375rem 0.75rem;
    font-size: 0.875rem;
  }
  .btn-group {
    margin-top: auto;
  }
  .col-md-6 {
    margin-bottom: 1.5rem;
  }
  .row {
    display: flex;
    flex-wrap: wrap;
  }
  .row > [class*='col-'] {
    display: flex;
    flex-direction: column;
  }
  .card-body .d-flex {
    margin-top: auto;
  }
  .card-body .btn {
    min-width: 100px;
  }
  .remove-btn {
    position: absolute;
    top: 15px;
    right: 15px;
    z-index: 999;
    background: rgba(255, 255, 255, 1);
    border: none;
    border-radius: 50%;
    width: 45px;
    height: 45px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #dc3545;
    transition: all 0.3s;
    box-shadow: 0 3px 8px rgba(0,0,0,0.3);
    cursor: pointer;
    border: 2px solid #dc3545;
  }
  .remove-btn:hover {
    background: #ffffff;
    color: #dc3545;
    transform: scale(1.1);
    box-shadow: 0 4px 12px rgba(0,0,0,0.4);
  }
  .remove-btn i {
    font-size: 22px;
    pointer-events: none;
    text-shadow: 0 1px 3px rgba(0,0,0,0.1);
  }
</style>
@endsection
