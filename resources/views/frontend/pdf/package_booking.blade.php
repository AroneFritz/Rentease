<!DOCTYPE html>
<html>

<head lang="en">
  {{-- required meta tags --}}
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  {{-- title --}}
  <title>{{ __('Property Rental Invoice') }}</title>

  {{-- fav icon --}}
  <link rel="shortcut icon" type="image/png" href="{{ asset('assets/img/' . $websiteInfo->favicon) }}">
  @php
    $mb_30 = '35px';
  @endphp
  {{-- styles --}}
  <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.min.css') }}">
</head>

<body>
  <div class="package-booking-invoice my-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="logo text-center" style="margin-bottom: {{ $mb_30 }}">
            <img src="{{ asset('assets/img/' . $websiteInfo->logo) }}" alt="Company Logo">
          </div>

          <div class="mb-3">
            <h2 class="text-center">
              {{ __('PROPERTY RENTAL INVOICE') }}
            </h2>
          </div>

          @php
            $position = $bookingInfo->currency_text_position;
            $currency = $bookingInfo->currency_text;
          @endphp

          <div class="row">
            <div class="col">
              <table class="table table-striped table-bordered">
                <tbody>
                  <tr>
                    <th scope="col">{{ __('Rental Number:') }}</th>
                    <td>{{ '#' . $bookingInfo->booking_number }}</td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Rental Date:') }}</th>
                    <td>
                      {{ date_format($bookingInfo->created_at, 'M d, Y') }}
                    </td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Property Name:') }}</th>
                    <td>
                      {{ $bookingInfo->tourPackage->packageContent()->where('language_id', $currentLanguageInfo->id)->first()->title }}
                    </td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Persons:') }}</th>
                    <td>
                      {{ $bookingInfo->visitors }}
                    </td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Subtotal:') }}</th>
                    <td class="text-capitalize">
                      {{ $position == 'left' ? $currency . ' ' : '' }}{{ $bookingInfo->subtotal }}{{ $position == 'right' ? ' ' . $currency : '' }}
                    </td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Discount:') }}</th>
                    <td class="text-capitalize">
                      {{ $position == 'left' ? $currency . ' ' : '' }}{{ $bookingInfo->discount }}{{ $position == 'right' ? ' ' . $currency : '' }}
                    </td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Total Cost:') }}</th>
                    <td class="text-capitalize">
                      {{ $position == 'left' ? $currency . ' ' : '' }}{{ $bookingInfo->grand_total }}{{ $position == 'right' ? ' ' . $currency : '' }}
                    </td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Tenant Name:') }}</th>
                    <td>{{ $bookingInfo->customer_name }}</td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Tenant Phone:') }}</th>
                    <td>{{ $bookingInfo->customer_phone }}</td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Paid via:') }}</th>
                    <td>{{ $bookingInfo->payment_method }}</td>
                  </tr>

                  <tr>
                    <th scope="col">{{ __('Payment Status:') }}</th>
                    <td>
                      @if ($bookingInfo->payment_status == 1)
                        {{ __('Complete') }}
                      @else
                        {{ __('Incomplete') }}
                      @endif
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>
