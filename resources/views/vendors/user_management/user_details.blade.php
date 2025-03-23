@extends('vendors.layout')

@section('content')
<div class="tenant-details">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h4 class="page-title">Tenant Details</h4>
        <div class="d-flex align-items-center">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="{{ route('vendor.dashboard') }}">Dashboard</a></li>
                    <li class="breadcrumb-item">Tenant Management</li>
                    <li class="breadcrumb-item active">Tenant Details</li>
                </ol>
            </nav>
            <a href="{{ url()->previous() }}" class="btn btn-primary ml-3">Back</a>
        </div>
    </div>

    <div class="row">
        <!-- Left Side - User Information -->
        <div class="col-md-5">
            <div class="profile-section p-4">
                <div class="text-center mb-4">
                    @if($user->image)
                        <img src="{{ asset('assets/img/users/'.$user->image) }}" alt="user" class="profile-image">
                    @else
                        <img src="{{ asset('assets/img/default-user.png') }}" alt="default" class="profile-image">
                    @endif
                </div>

                <div class="information">
                    <h5 class="mb-4">Information</h5>

                    <div class="info-item">
                        <label>Full Name:</label>
                        <span>{{ $user->first_name }} {{ $user->last_name }}</span>
                    </div>

                    <div class="info-item">
                        <label>First Name:</label>
                        <span>{{ $user->first_name }}</span>
                    </div>

                    <div class="info-item">
                        <label>Last Name:</label>
                        <span>{{ $user->last_name }}</span>
                    </div>

                    <div class="info-item">
                        <label>Email:</label>
                        <span>{{ $user->email }}</span>
                    </div>

                    <div class="info-item">
                        <label>Phone:</label>
                        <span>{{ $user->phone }}</span>
                    </div>

                    <div class="info-item">
                        <label>Address:</label>
                        <span>{{ $user->address }}</span>
                    </div>

                    <div class="info-item">
                        <label>City:</label>
                        <span>{{ $user->city }}</span>
                    </div>

                    <div class="info-item">
                        <label>Province:</label>
                        <span>{{ $user->state }}</span>
                    </div>

                    <div class="info-item">
                        <label>Country:</label>
                        <span>{{ $user->country }}</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Side - Bookings -->
        <div class="col-md-7">
            <div class="recent-rentals">
                <h5 class="mb-4">Recent Rentals</h5>

                @if($roomBookings->count() > 0)
                <div class="booking-section">
                    <h6 class="section-title">Room</h6>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Image</th>
                                    <th>Check In</th>
                                    <th>Check Out</th>
                                    <th>Payment Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($roomBookings as $booking)
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            @if($booking['image'])
                                                <img src="{{ asset('assets/img/rooms/'.$booking['image']) }}" alt="room" class="booking-image">
                                            @endif
                                            <span class="ml-2">{{ $booking['name'] }}</span>
                                        </div>
                                    </td>
                                    <td>{{ $booking['check_in'] }}</td>
                                    <td>{{ $booking['check_out'] }}</td>
                                    <td>
                                        <span class="badge {{ $booking['payment_status'] == 'Paid' ? 'badge-success' : 'badge-warning' }}">
                                            {{ $booking['payment_status'] }}
                                        </span>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                @endif

                @if($packageBookings->count() > 0)
                <div class="booking-section mt-4">
                    <h6 class="section-title">Property</h6>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Check In</th>
                                    <th>Check Out</th>
                                    <th>Payment Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($packageBookings as $booking)
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            @if($booking['image'])
                                                @php
                                                    $imagePath = $booking['image'];
                                                    $filename = basename($imagePath);
                                                @endphp
                                                <img src="{{ asset('assets/img/package/'.$filename) }}" alt="package" class="booking-image">
                                            @endif
                                            <span class="ml-2">{{ $booking['name'] }}</span>
                                        </div>
                                    </td>
                                    <td>{{ $booking['check_in'] }}</td>
                                    <td>{{ $booking['check_out'] }}</td>
                                    <td>
                                        <span class="badge {{ $booking['payment_status'] == 'Paid' ? 'badge-success' : 'badge-warning' }}">
                                            {{ $booking['payment_status'] }}
                                        </span>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                @endif

                @if($roomBookings->count() == 0 && $packageBookings->count() == 0)
                <div class="text-center mt-4">
                    <p>No bookings found.</p>
                </div>
                @endif
            </div>
        </div>
    </div>
</div>

<style>
.tenant-details {
    padding: 20px;
}

.page-title {
    color: #fff;
    margin: 0;
}

.breadcrumb {
    background: transparent;
    margin: 0;
}

.profile-image {
    width: 200px;
    height: 200px;
    border-radius: 50%;
    object-fit: cover;
}

.profile-section {
    background: #1f283e;
    border-radius: 5px;
}

.information {
    color: #fff;
}

.info-item {
    margin-bottom: 15px;
}

.info-item label {
    color: #8d9498;
    display: block;
    margin-bottom: 5px;
    font-size: 14px;
}

.info-item span {
    color: #fff;
    font-size: 14px;
}

.recent-rentals {
    background: #1f283e;
    padding: 20px;
    border-radius: 5px;
}

.section-title {
    color: #fff;
    margin-bottom: 20px;
}

.table {
    color: #fff;
}

.table thead th {
    border-bottom: 1px solid #2d374b;
    color: #8d9498;
    font-weight: normal;
}

.table td {
    border-top: 1px solid #2d374b;
    vertical-align: middle;
}

.booking-image {
    width: 40px;
    height: 40px;
    border-radius: 4px;
    object-fit: cover;
}

.badge {
    padding: 5px 10px;
    border-radius: 4px;
}

.badge-success {
    background: #00d0ff;
}

.badge-warning {
    background: #ffa426;
}
</style>
@endsection
