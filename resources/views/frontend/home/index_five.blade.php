@extends('frontend.layout')

@section('pageHeading')
    {{ __('Home') }}
@endsection

@php
    $metaKeywords = !empty($seo->meta_keyword_home) ? $seo->meta_keyword_home : '';
    $metaDescription = !empty($seo->meta_description_home) ? $seo->meta_description_home : '';
@endphp
@section('meta-keywords', "{{ $metaKeywords }}")
@section('meta-description', "$metaDescription")
@section('content')
    @php
        if (!empty($hero)) {
            $img = $hero->img;
            $title = $hero->title;
            $subtitle = $hero->subtitle;
            $btnUrl = $hero->btn_url;
            $btnName = $hero->btn_name;
        } else {
            $img = '';
            $title = '';
            $subtitle = '';
            $btnUrl = '';
            $btnName = '';
        }
    @endphp
    <!-- Home-area start-->
    @includeIf('frontend.partials.hero.them5.slider')
    <!-- Home-area end -->

    <!-- About-area start -->
    @if ($sections?->intro_section == 1)
        <section class="about-area about-3 pt-100 pb-60">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6" data-aos="fade-up">
                        <div class="content-title mb-40">
                            @if (!is_null($intro))
                                <h2 class="title mb-20">
                                    {{ $intro->intro_primary_title }}
                                </h2>

                                <div class="mw-80 w-md-100">
                                    <p>
                                        {{ $intro->intro_text }}
                                    </p>
                                </div>
                            @endif
                            @if ($sections->statistics_section == 1)
                                <div class="about-grid mt-40">
                                    @if (count($counterInfos) > 0)
                                        @foreach ($counterInfos as $counterInfo)
                                            <div class="grid-item radius-md p-20">
                                                <div class="icon mb-15">
                                                    <i class="{{ $counterInfo->icon }}"></i>
                                                </div>
                                                <h3 class="mb-2 lc-1"><span
                                                        class="counter">{{ $counterInfo->amount }}</span>+</h3>
                                                <p>{{ $counterInfo->title }}</p>
                                            </div>
                                        @endforeach
                                    @endif
                                </div>
                                <div class="d-flex align-items-center flex-wrap gap-3 mt-40" data-aos="fade-up">
                                    @if ($intro->button_text && $intro->url)
                                        <a href="{{ $intro->url }}" class="btn btn-lg btn-primary rounded-pill"
                                            title="All Package" target="_self">{{ $intro->button_text }}</a>
                                    @endif
                                    @if (!empty($intro->member_image))
                                        <div class="clients-avatar">
                                            <img src="{{ asset('assets/img/intro_section/member_image/' . $intro->member_image) }}"
                                                alt="">
                                        </div>
                                    @endif
                                </div>
                            @endif

                        </div>
                    </div>
                    <div class="col-lg-6" data-aos="fade-up">
                        <div class="image mb-40">
                            <div class="img-1">
                                @if (!is_null($intro))
                                    <img class="blur-up lazyload"
                                        data-src="{{ asset('assets/img/intro_section/' . $intro->intro_img) }}"
                                        alt="Image">
                                @endif
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    @endif
    <!-- About-area end -->

    <!-- featured room start -->
    @if ($sections?->featured_rooms_section == 1)
        <!-- Product-area start -->
        <section class="product-area pb-100">
            <div class="container">
                <div class="row">
                    @if (!empty($secHeading))
                        <div class="col-12" data-aos="fade-up">
                            <div class="section-title title-inline mb-50" data-aos="fade-up">
                                <h2 class="title">{{ convertUtf8($secHeading->room_section_title) }}</h2>
                                <a href="{{ route('rooms') }}" class="btn btn-lg btn-primary">{{ __('All Rooms') }}</a>
                            </div>
                        </div>
                    @endif

                    @if ($roomInfos->count() == 0)
                        <div class="col">
                            <h3>{{ __('No Featured Room Found!') }}</h3>
                        </div>
                    @else
                        <div class="col-12">
                            <div class="swiper product-slider" id="product-slider-1" data-slides-per-view="4">
                                <div class="swiper-wrapper">
                                    @foreach ($roomInfos as $roomInfo)
                                        @if (!empty($roomInfo->room))
                                            <div class="swiper-slide" data-aos="fade-up">
                                                <div class="product-default mb-25">
                                                    <figure class="product-img">
                                                        <a href="{{ route('room_details', [$roomInfo->room_id, $roomInfo->slug]) }}"
                                                            class="lazy-container radius-md ratio ratio-3-4" target="_self"
                                                            title="Link">
                                                            <img class="lazyload"
                                                                data-src="{{ asset('assets/img/rooms/' . $roomInfo->room->featured_img) }}"
                                                                alt="Product">
                                                        </a>
                                                    </figure>
                                                    <div class="product-details p-20 border radius-md mx-auto">
                                                        <div
                                                            class="d-flex align-items-center gap-3 justify-content-between">
                                                            @if ($websiteInfo->room_category_status == 1)
                                                                <span class="product-tag border radius-sm">
                                                                    {{ $roomInfo->roomCategory->name }}
                                                                </span>
                                                            @endif
                                                            <div class="product-price">

                                                                <span class="h6 new-price color-primary">
                                                                    {{ $currencyInfo->base_currency_symbol_position == 'left' ? $currencyInfo->base_currency_symbol : '' }}
                                                                    {{ $roomInfo->room->rent }}
                                                                    {{ $currencyInfo->base_currency_symbol_position == 'right' ? $currencyInfo->base_currency_symbol : '' }}
                                                                    / {{ __('PerDay') }}
                                                                </span>

                                                            </div>
                                                        </div>
                                                        <h6 class="product-title lc-1 mt-2">
                                                            <a href="{{ route('room_details', ['id' => $roomInfo->room_id, 'slug' => $roomInfo->slug]) }}"
                                                                target="_self"
                                                                title="Link">{{ convertUtf8($roomInfo->title) }}</a>
                                                        </h6>
                                                        <div class="author mb-15 font-sm">
                                                            <span>
                                                                @if ($roomInfo->room->vendor_id != null)
                                                                    @php
                                                                        $vendor = App\Models\Vendor::where(
                                                                            'id',
                                                                            $roomInfo->room->vendor_id,
                                                                        )->first();
                                                                    @endphp
                                                                    <a
                                                                        href="{{ route('frontend.vendor.details', $vendor->username) }}">{{ __('By') }}
                                                                        {{ $vendor->username }}</a>
                                                                @else
                                                                    @php
                                                                        $admin = App\Models\Admin::first();
                                                                    @endphp
                                                                    <a
                                                                        href="{{ route('frontend.vendor.details', [$admin->username, 'admin' => 'true']) }}">{{ __('By') }}

                                                                        {{ $admin->username }}</a>
                                                                @endif
                                                            </span>
                                                        </div>
                                                        <ul
                                                            class="product-icon-list list-unstyled d-flex align-items-center">
                                                            <li class="icon-start">
                                                                <i class="fal fa-bed"></i>
                                                                <span>
                                                                    {{ $roomInfo->room->bed }}
                                                                    {{ $roomInfo->room->bed == 1 ? __('Bed') : __('Beds') }}
                                                                </span>
                                                            </li>
                                                            <li class="icon-start">
                                                                <i class="fal fa-bath"></i>
                                                                <span>
                                                                    {{ $roomInfo->room->bath }}
                                                                    {{ $roomInfo->room->bath == 1 ? __('Bath') : __('Baths') }}
                                                                </span>
                                                            </li>
                                                            <li class="icon-start">
                                                                <i class="fal fa-users"></i>
                                                                <span>
                                                                    {{ $roomInfo->room->max_guests }}
                                                                    {{ $roomInfo->room->max_guests == 1 ? __('Guest') : __('Guests') }}
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div><!-- product-default -->
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                                <div class="swiper-pagination position-static" id="product-slider-1-pagination"></div>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </section>
    @endif
    <!-- featured room  end -->

    <!-- Product-area start -->
    @if ($sections->featured_package_section == 1)
        <!-- Package Section Start -->
        <section class="product-area pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-12" data-aos="fade-up">
                        <div class="section-title title-center mb-50" data-aos="fade-up">
                            @if (!empty($secHeading))
                                <h2 class="title mb-30">
                                    {{ convertUtf8($secHeading->package_section_title) }}
                                </h2>
                            @endif
                            <div class="tabs-navigation-area">
                                <ul class="nav nav-tabs" data-hover="fancyHover" role="tablist">
                                    <li class="nav-item active" role="presentation">
                                        <button class="nav-link hover-effect btn-md radius-sm active" data-bs-toggle="tab"
                                            data-bs-target="#tab1" type="button" aria-selected="true"
                                            role="tab">{{ $keywords['All Property'] ?? __('All Property') }}</button>
                                    </li>
                                    @foreach ($package_categories as $package_category)
                                        <li class="nav-item " role="presentation">
                                            <button class="nav-link hover-effect btn-md radius-sm" data-bs-toggle="tab"
                                                data-bs-target="#tab{{ $package_category->id }}" type="button"
                                                aria-selected="false" role="tab"
                                                tabindex="-1">{{ $package_category->name }}</button>
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="tab-content">
                            <div class="tab-pane slide active" id="tab1" role="tabpanel">
                                <div class="row">
                                    @foreach ($packageInfos as $packageInfo)
                                        @if (!empty($packageInfo->package))
                                            <div class="col-xl-3 col-lg-4 col-sm-6" data-aos="fade-up">
                                                <div class="product-default mb-25">
                                                    <figure class="product-img">
                                                        <a href="{{ route('package_details', ['id' => $packageInfo->package_id, 'slug' => $packageInfo->slug]) }}"
                                                            class="lazy-container radius-md ratio ratio-3-4"
                                                            target="_self" title="Link">
                                                            <img class="lazyload"
                                                                data-src="{{ asset('assets/img/package/' . $packageInfo->package->featured_img) }}"
                                                                alt="Product">
                                                        </a>
                                                    </figure>
                                                    <div class="product-details p-20 border radius-md mx-auto">
                                                        <div
                                                            class="d-flex align-items-center gap-3 justify-content-between">
                                                            <span
                                                                class="product-tag border radius-sm">{{ $packageInfo->packageCategory->name }}</span>
                                                            <div class="product-price">
                                                                @if ($packageInfo->package->pricing_type != 'negotiable')
                                                                    <span class="h6 new-price color-primary"></strong>
                                                                        {{ $currencyInfo->base_currency_symbol_position == 'left' ? $currencyInfo->base_currency_symbol : '' }}
                                                                        {{ $packageInfo->package->package_price }}
                                                                        {{ $currencyInfo->base_currency_symbol_position == 'right' ? $currencyInfo->base_currency_symbol : '' }}
                                                                        {{ '(' . strtoupper($packageInfo->package->pricing_type) . ')' }}</span>
                                                                @else
                                                                    <span
                                                                        class="h6 new-price color-primary"></strong>{{ __('Negotiable') }}</strong></span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                        <h6 class="product-title lc-1 mt-2">
                                                            <a href="{{ route('package_details', ['id' => $packageInfo->package_id, 'slug' => $packageInfo->slug]) }}"
                                                                target="_self"
                                                                title="Link">{{ strlen($packageInfo->title) > 50 ? mb_substr($packageInfo->title, 0, 150, 'utf-8') . '...' : $packageInfo->title }}</a>
                                                        </h6>
                                                        <div class="author mb-15 font-sm">
                                                            <span>
                                                                @if ($packageInfo->package->vendor_id != null)
                                                                    @php
                                                                        $vendor = App\Models\Vendor::where(
                                                                            'id',
                                                                            $packageInfo->package->vendor_id,
                                                                        )->first();
                                                                    @endphp
                                                                    <a
                                                                        href="{{ route('frontend.vendor.details', $vendor->username) }}">{{ __('By') }}
                                                                        {{ $vendor->username }}</a>
                                                                @else
                                                                    @php
                                                                        $admin = App\Models\Admin::first();
                                                                    @endphp
                                                                    <a
                                                                        href="{{ route('frontend.vendor.details', [$admin->username, 'admin' => 'true']) }}">{{ __('By') }}
                                                                        {{ $admin->username }}</a>
                                                                @endif
                                                            </span>
                                                        </div>
                                                        <ul
                                                            class="product-icon-list list-unstyled d-flex align-items-center">
                                                            <li class="icon-start">
                                                                <i class="fal fa-calendar-check"></i>
                                                                <span> {{ $packageInfo->package->number_of_days }}
                                                                    {{ __('Days') }}</span>
                                                            </li>
                                                            <li class="icon-start">
                                                                <i class="fal fa-user-friends"></i>
                                                                <span>
                                                                    {{ $packageInfo->package?->max_persons != null ? $packageInfo->package?->max_persons : '-' }}
                                                                    {{ $packageInfo->package?->max_persons == 1 ? __('Person') : __('Persons') }}
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div><!-- product-default -->
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                            </div>
                            @foreach ($package_categories as $package_category)
                                <div class="tab-pane slide" id="tab{{ $package_category->id }}" role="tabpanel">
                                    <div class="row">
                                        @foreach (App\Models\PackageManagement\PackageContent::with('package')->where('language_id', $currentLanguageInfo->id)->where('package_category_id', $package_category->id)->paginate(8) as $packageInfo)
                                            @if (!empty($packageInfo->package))
                                                <div class="col-xl-3 col-lg-4 col-sm-6" data-aos="fade-up">
                                                    <div class="product-default mb-25">
                                                        <figure class="product-img">
                                                            <a href="{{ route('package_details', ['id' => $packageInfo->package_id, 'slug' => $packageInfo->slug]) }}"
                                                                class="lazy-container radius-md ratio ratio-3-4"
                                                                target="_self" title="Link">
                                                                <img class="lazyload"
                                                                    data-src="{{ asset('assets/img/package/' . $packageInfo->package->featured_img) }}"
                                                                    alt="Product">
                                                            </a>
                                                        </figure>
                                                        <div class="product-details p-20 border radius-md mx-auto">
                                                            <div
                                                                class="d-flex align-items-center gap-3 justify-content-between">
                                                                <span
                                                                    class="product-tag border radius-sm">{{ $packageInfo->packageCategory->name }}</span>
                                                                <div class="product-price">
                                                                    @if ($packageInfo->package->pricing_type != 'negotiable')
                                                                        <span class="h6 new-price color-primary"></strong>
                                                                            {{ $currencyInfo->base_currency_symbol_position == 'left' ? $currencyInfo->base_currency_symbol : '' }}
                                                                            {{ $packageInfo->package->package_price }}
                                                                            {{ $currencyInfo->base_currency_symbol_position == 'right' ? $currencyInfo->base_currency_symbol : '' }}
                                                                            {{ '(' . strtoupper($packageInfo->package->pricing_type) . ')' }}</span>
                                                                    @else
                                                                        <span
                                                                            class="h6 new-price color-primary"></strong>{{ __('Negotiable') }}</strong></span>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                            <h6 class="product-title lc-1 mt-2">
                                                                <a href="{{ route('package_details', ['id' => $packageInfo->package_id, 'slug' => $packageInfo->slug]) }}"
                                                                    target="_self"
                                                                    title="Link">{{ strlen($packageInfo->title) > 50 ? mb_substr($packageInfo->title, 0, 150, 'utf-8') . '...' : $packageInfo->title }}</a>
                                                            </h6>
                                                            <div class="author mb-15 font-sm">
                                                                <span>
                                                                    @if ($packageInfo->package->vendor_id != null)
                                                                        @php
                                                                            $vendor = App\Models\Vendor::where(
                                                                                'id',
                                                                                $packageInfo->package->vendor_id,
                                                                            )->first();
                                                                        @endphp
                                                                        <a
                                                                            href="{{ route('frontend.vendor.details', $vendor->username) }}">{{ __('By') }}
                                                                            {{ $vendor->username }}</a>
                                                                    @else
                                                                        @php
                                                                            $admin = App\Models\Admin::first();
                                                                        @endphp
                                                                        <a
                                                                            href="{{ route('frontend.vendor.details', [$admin->username, 'admin' => 'true']) }}">{{ __('By') }}
                                                                            {{ $admin->username }}</a>
                                                                    @endif
                                                                </span>
                                                            </div>
                                                            <ul
                                                                class="product-icon-list list-unstyled d-flex align-items-center">
                                                                <li class="icon-start">
                                                                    <i class="fal fa-calendar-check"></i>
                                                                    <span> {{ $packageInfo->package->number_of_days }}
                                                                        {{ __('Days') }}</span>
                                                                </li>
                                                                <li class="icon-start">
                                                                    <i class="fal fa-user-friends"></i>
                                                                    <span>{{ $packageInfo->package->max_persons != null ? $packageInfo->package->max_persons : '-' }}
                                                                        {{ __('Person') }}</span>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div><!-- product-default -->
                                                </div>
                                            @endif
                                        @endforeach
                                    </div>
                                </div>
                            @endforeach

                        </div>
                        <div class="text-center mt-20" data-aos="fade-up">
                            <a href="{{ route('packages') }}"
                                class="btn btn-lg btn-primary">{{ __('View All Packages') }}</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Package Section End -->
    @endif
    <!-- Product-area end -->

    <!-- Video-banner start -->
    @if ($sections?->video_section == 1)
        <div class="video-banner video-banner-2 pt-100 bg-img lazyload position-relative z-1 bg-a-fixed"
            data-bg-image="{{ asset('assets/img/video_section/' . $secHeading->video_img) }}">
            <!-- Bg overlay -->
            <div class="overlay opacity-50"></div>
            <div class="container">
                <div class="wrapper" data-aos="fade-up">
                    <div class="text-center ptb-100">
                        <a href="{{ $secHeading->booking_section_video_url }}" class="video-btn youtube-popup mx-auto">
                            <i class="fas fa-play"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Call To Action End -->
    @endif
    <!-- Video-banner end -->

    <!-- Counter-area start -->
    @if ($sections?->intro_section == 1)
        <div class="counter-area counter-2">
            <div class="container">
                <div class="wrapper rounded-pill pt-60 pb-30 bg-img lazyload"
                    data-bg-image="{{ asset('assets/img/intro_section/background_image/' . $intro->background_image) }}">
                    <div class="overlay opacity-25"></div>
                    @if ($sections->statistics_section == 1)
                        <div class="d-flex justify-content-center">
                            @if (count($counterInfos) > 0)
                                @foreach ($counterInfos as $counterInfo)
                                    <div class="col-sm-6 col-lg-3" data-aos="fade-up">
                                        <div class="card text-center mb-30">
                                            <div class="card-icon color-white mb-10">
                                                <i class="{{ $counterInfo->icon }}"></i>
                                            </div>
                                            <div class="card-content">
                                                <span class="h2 mb-1 color-white"><span
                                                        class="counter">{{ $counterInfo->amount }}</span></span>
                                                <p class="card-text font-lg color-white lh-1">{{ $counterInfo->title }}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    @endif
                </div>
            </div>
        </div>
    @endif
    <!-- Counter-area end -->

    <!-- Choose-area start -->
    @if ($sections?->facilities_section == 1)
        <!-- Why Choose Us/Facility Section Start -->
        <section class="choose-area choose-3 pt-100 pb-60">
            <div class="container">
                <div class="row gx-xl-5 align-items-center">
                    <div class="col-lg-6" data-aos="fade-right">
                        @if (!is_null($secHeading))
                            <div class="image mb-40">
                                <div class="img-1">
                                    <img class="blur-up lazyload"
                                        data-src="{{ asset('assets/img/facility_section/' . $secHeading->facility_section_image) }}"
                                        alt="Image">
                                </div>

                            </div>
                        @endif
                    </div>
                    <div class="col-lg-6" data-aos="fade-left">
                        <div class="content mb-10">
                            @if (!is_null($secHeading))
                                <div class="content-title">
                                    <h2 class="title mb-30">{{ convertUtf8($secHeading->facility_section_title) }}</h2>
                                </div>
                                <p class="text">{{ convertUtf8($secHeading->facility_section_subtitle) }}</p>
                            @endif

                            @if (count($facilities) > 0)
                                <div class="item-list mt-40">
                                    @foreach ($facilities as $facility)
                                        <div class="item d-flex gap-3 mb-30">
                                            <div class="icon rounded-pill">
                                                <i class="{{ $facility->facility_icon }}"></i>
                                            </div>
                                            <div class="content w-75 w-sm-100">
                                                <h4 class="mb-2 lh-1">{{ convertUtf8($facility->facility_title) }}</h4>
                                                <p class="card-text">{{ $facility->facility_text }}</p>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </section>

    @endif
    <!-- Choose-area end -->

    <!-- Sponsor Start  -->
    @if ($sections?->brand_section == 1)
        <section class="sponsor pb-100">
            <div class="container">
                @if (count($brands) == 0)
                    <div class="row text-center">
                        <div class="col">
                            <h3>{{ __('No Brand Found!') }}</h3>
                        </div>
                    </div>
                @else
                    <div class="row">
                        <div class="col-12">
                            <div class="swiper sponsor-slider">
                                <div class="swiper-wrapper">
                                    @foreach ($brands as $brand)
                                        <div class="swiper-slide">
                                            <div class="sponsor-img text-center">
                                                <a href="{{ $brand->brand_url }}" target="_blank">
                                                    <img class="lazyload blur-up"
                                                        data-src="{{ asset('assets/img/brands/' . $brand->brand_img) }}"
                                                        alt="Sponsor">
                                                </a>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                                <div class="swiper-pagination position-static mt-30" id="sponsor-slider-pagination"
                                    data-aos="fade-up">
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
            </div>
        </section>
    @endif
    <!-- Sponsor End -->
@endsection
@section('script')
    <script src="{{ asset('assets/js/home.js') }}"></script>
@endsection
