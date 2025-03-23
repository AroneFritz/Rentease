<?php

namespace App\Http\Controllers\Vendor;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PackageManagement\PackageBooking;
use App\Models\RoomManagement\RoomBooking;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Carbon\Carbon;

class UserManagementController extends Controller
{
    public function details()
    {
        $vendorId = Auth::guard('vendor')->user()->id;

        // Get users who have booked rooms or packages from this vendor
        $users = User::where(function ($query) use ($vendorId) {
                $query->whereHas('roomBookings.hotelRoom', function ($q) use ($vendorId) {
                    $q->where('vendor_id', $vendorId);
                })
                ->orWhereHas('packageBookings.tourPackage', function ($q) use ($vendorId) {
                    $q->where('vendor_id', $vendorId);
                });
            })
            ->orderBy('created_at', 'DESC')
            ->get();

        return view('vendors.user_management.details', compact('users'));
    }

    public function userDetails($id)
    {
        $vendorId = Auth::guard('vendor')->user()->id;

        $user = User::findOrFail($id);

        // Get room bookings for this vendor
        $roomBookings = RoomBooking::with(['hotelRoom' => function($query) use ($vendorId) {
            $query->where('vendor_id', $vendorId);
        }])
        ->whereHas('hotelRoom', function($query) use ($vendorId) {
            $query->where('vendor_id', $vendorId);
        })
        ->where('user_id', $id)
        ->get()
        ->map(function ($booking) {
            return [
                'id' => $booking->hotelRoom->id,
                'name' => $booking->hotelRoom->title,
                'check_in' => Carbon::parse($booking->check_in)->format('Y-m-d'),
                'check_out' => Carbon::parse($booking->check_out)->format('Y-m-d'),
                'payment_status' => $booking->payment_status ? 'Paid' : 'Unpaid',
                'image' => $booking->hotelRoom->featured_img ?? null,
                'location' => $booking->hotelRoom->location ?? '',
                'rent' => $booking->hotelRoom->rent ?? ''
            ];
        });

        // Get package bookings for this vendor
        $packageBookings = PackageBooking::with(['tourPackage' => function($query) use ($vendorId) {
            $query->where('vendor_id', $vendorId);
        }])
        ->whereHas('tourPackage', function($query) use ($vendorId) {
            $query->where('vendor_id', $vendorId);
        })
        ->where('user_id', $id)
        ->get()
        ->map(function ($booking) {
            // Debug the package data
            // dd($booking->tourPackage);

            return [
                'id' => $booking->package_id,
                'name' => $booking->tourPackage->title ?? '',
                'check_in' => Carbon::parse($booking->check_in ?? $booking->created_at)->format('Y-m-d'),
                'check_out' => Carbon::parse($booking->check_out ?? $booking->created_at)->format('Y-m-d'),
                'payment_status' => $booking->payment_status ? 'Paid' : 'Unpaid',
                'image' => asset('assets/img/tour-packages/' . ($booking->tourPackage->featured_img ?? 'default.jpg')),
                'location' => $booking->tourPackage->location ?? '',
                'price' => $booking->tourPackage->price ?? ''
            ];
        });

        // Sort both collections by check_in date
        $roomBookings = $roomBookings->sortByDesc('check_in');
        $packageBookings = $packageBookings->sortByDesc('check_in');

        return view('vendors.user_management.user_details', compact('user', 'roomBookings', 'packageBookings'));
    }
}
