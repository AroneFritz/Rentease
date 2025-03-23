<!DOCTYPE html>
<html>

<head>
  {{-- required meta tags --}}
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  {{-- title --}}
  <title>{{ __('Admin Login') . ' | ' . $websiteInfo->website_title }}</title>

  {{-- fav icon --}}
  <link rel="shortcut icon" type="image/png" href="{{ asset('assets/img/' . $websiteInfo->favicon) }}">

  {{-- bootstrap css --}}
  <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">

  {{-- login css --}}
  <link rel="stylesheet" href="{{ asset('assets/css/admin-login.css') }}">
</head>

<body>
  {{-- login form start --}}
  <div class="login-page">
    <div class="text-center mb-4">
      <img class="login-logo" src="{{ asset('assets/img/' . $websiteInfo->logo) }}" alt="logo">
    </div>

    <div class="form">
      @if (session()->has('alert'))
        <div class="alert alert-danger fade show font-14" role="alert">
          <strong> {{ __('Oops, ') . session('alert') }}</strong>
        </div>
      @endif

      <form class="login-form" action="{{ route('admin.auth') }}" method="POST">
        @csrf
        <input type="text" name="username" placeholder="Enter Username" />
        @if ($errors->has('username'))
          <p class="text-danger text-left">{{ $errors->first('username') }}</p>
        @endif

        <input type="password" name="password" placeholder="Enter Password" />
        @if ($errors->has('password'))
          <p class="text-danger text-left">{{ $errors->first('password') }}</p>
        @endif

        <button type="submit">{{ __('login') }}</button>
      </form>

      <a class="forget-link" href="{{ route('admin.forget_password') }}">
        {{ __('Forget Password?') }}
      </a>
    </div>
  </div>
  {{-- login form end --}}


  {{-- jQuery --}}
  <script src="{{ asset('assets/js/jquery.min.js') }}"></script>

  {{-- popper js --}}
  <script src="{{ asset('assets/js/popper.min.js') }}"></script>

  {{-- bootstrap js --}}
  <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
</body>

</html>
