@extends('vendors.layout')

@section('content')
<div class="page-header">
  <h4 class="page-title">{{ __('Tenant Details') }}</h4>
  <ul class="breadcrumbs">
    <li class="nav-home">
      <a href="{{route('vendor.dashboard')}}">
        <i class="flaticon-home"></i>
      </a>
    </li>
    <li class="separator">
      <i class="flaticon-right-arrow"></i>
    </li>
    <li class="nav-item">
      <a href="#">{{ __('Tenant Information') }}</a>
    </li>
    <li class="separator">
      <i class="flaticon-right-arrow"></i>
    </li>
    <li class="nav-item">
      <a href="#">{{ __('Tenant Details') }}</a>
    </li>
  </ul>
</div>

<div class="row">
  <div class="col-md-12">
    <div class="card">
      <div class="card-header">
        <div class="row">
          <div class="col-lg-6">
            <div class="card-title">{{ __('Tenants') }}</div>
          </div>
        </div>
      </div>
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <div class="table-responsive">
              <table class="table table-striped mt-3">
                <thead>
                  <tr>
                    <th>{{ __('Full Name') }}</th>
                    <th>{{ __('Email') }}</th>
                    <th>{{ __('Phone') }}</th>
                    <th>{{ __('City') }}</th>
                    <th>{{ __('Country') }}</th>
                    <th>{{ __('Action') }}</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($users as $user)
                    <tr>
                      <td>{{ $user->username }}</td>
                      <td>{{ $user->email }}</td>
                      <td>{{ $user->contact_number }}</td>
                      <td>{{ $user->city }}</td>
                      <td>{{ $user->country }}</td>
                      <td>
                        <a href="{{ route('vendor.user_management.user_details', $user->id) }}" 
                           class="btn btn-info btn-sm">
                          <i class="fas fa-eye"></i> {{ __('View') }}
                        </a>
                      </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
