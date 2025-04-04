<!DOCTYPE html>
<html @if ($currentLanguageInfo->direction == 1) dir="rtl" @endif>

<head>
    {{-- required meta tags --}}
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="@yield('meta-description')">
    <meta name="keywords" content="@yield('meta-keywords')">

    {{-- csrf-token for ajax request --}}
    <meta name="csrf-token" content="{{ csrf_token() }}">

    {{-- title --}}
    <title>@yield('pageHeading') | {{ $websiteInfo->website_title }}</title>

    {{-- fav icon --}}
    <link rel="shortcut icon" type="image/png" href="{{ asset('assets/img/' . $websiteInfo->favicon) }}">
 @php
    $primaryColor = $websiteInfo->primary_color;

    // check, whether color has '#' or not, will return 0 or 1
    if (!function_exists('checkColorCode')) {
        function checkColorCode($color)
        {
            return preg_match('/^#[a-f0-9]{6}/i', $color);
        }
    }

    // if, primary color value does not contain '#', then add '#' before color value
    if (isset($primaryColor) && checkColorCode($primaryColor) == 0) {
        $primaryColor = '#' . $primaryColor;
    }

    // change decimal point into hex value for opacity
    if (!function_exists('rgb')) {
        function rgb($color = null)
        {
            if (!$color) {
                echo '';
            }
            $hex = htmlspecialchars($color);
            [$r, $g, $b] = sscanf($hex, '#%02x%02x%02x');
            echo "$r, $g, $b";
        }
    }
  @endphp
  {{-- include styles --}}
  @includeIf('frontend.partials.styles')
    <style>
    :root {
      --color-primary: {{ $primaryColor }};
      --color-primary-rgb: {{ rgb(htmlspecialchars($primaryColor)) }};
    }
  </style>
</head>

<body
    class="
@if ($websiteInfo->theme_version == 'theme_three') theme_3
@elseif($websiteInfo->theme_version == 'theme_four')
theme_4
@elseif($websiteInfo->theme_version == 'theme_five')
theme_5 @endif">
    {{-- preloader start --}}
    @if ($websiteInfo->preloader_status == 1)
        <div class="loader" id="preLoader">
            <img class="lazy" data-src="{{ asset('assets/img/' . $websiteInfo->preloader) }}" alt="">
        </div>
    @endif
    {{-- preloader end --}}

    {{-- header start --}}
    <header
        class="
  @if ($websiteInfo->theme_version == 'theme_two') home-two
  @elseif($websiteInfo->theme_version == 'theme_three')
  header-area header-1
  @elseif($websiteInfo->theme_version == 'theme_four')
  header-area header-2
  @elseif($websiteInfo->theme_version == 'theme_five')
  header-area header-3 @endif">

        {{-- include header-nav --}}
        @if ($websiteInfo->theme_version == 'theme_one')
            {{-- include header-top --}}
            @includeIf('frontend.partials.header_top_one')
            @includeIf('frontend.partials.header_nav_one')
        @elseif ($websiteInfo->theme_version == 'theme_two')
            {{-- include header-top --}}
            @includeIf('frontend.partials.header_top_two')
            @includeIf('frontend.partials.header_nav_two')
        @elseif ($websiteInfo->theme_version == 'theme_three')
            @includeIf('frontend.partials.headers.header_v3')
        @elseif ($websiteInfo->theme_version == 'theme_four')
            @includeIf('frontend.partials.headers.header_v4')
        @elseif ($websiteInfo->theme_version == 'theme_five')
            @includeIf('frontend.partials.headers.header_v5')
        @endif
    </header>
    {{-- header end --}}

    @yield('content')

    {{-- back to top start --}}
    @if (
        $websiteInfo->theme_version == 'theme_three' ||
            $websiteInfo->theme_version == 'theme_four' ||
            $websiteInfo->theme_version == 'theme_five')
        <div class="go-top"><i class="fal fa-angle-up"></i></div>
    @else
        <div class="back-top">
            <a href="#" class="back-to-top">
                <i class="far fa-angle-up"></i>
            </a>
        </div>
    @endif
    {{-- back to top end --}}


    {{-- include footer --}}
    @if ($websiteInfo->theme_version == 'theme_one' || $websiteInfo->theme_version == 'theme_two')
        @includeIf('frontend.partials.footer')
    @else
        @includeIf('frontend.partials.footers.footer_v2')
    @endif

    {{-- Popups start --}}
    @includeIf('frontend.partials.popups')
    {{-- Popups end --}}

    {{-- WhatsApp Chat Button --}}
    <div id="WAButton"></div>

    {{-- Cookie alert dialog start --}}
    @if (!empty($cookie) && $cookie->cookie_alert_status == 1)
        <div class="cookie">
            @include('cookie-consent::index')
        </div>
    @endif
    {{-- Cookie alert dialog end --}}

    {{-- include scripts --}}
    @includeIf('frontend.partials.scripts')

    {{-- additional script --}}
    @yield('script')
    <!-- Messenger Chat Plugin Code -->

</body>

</html>
