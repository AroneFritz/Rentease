<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Wishlist;
use App\Models\RoomManagement\Room;
use App\Models\PackageManagement\Package;
use App\Models\Language;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class WishlistController extends Controller
{
    public function index()
    {
        $defaultLang = Language::where('is_default', 1)->first();
        $wishlistedRooms = Auth::user()->wishlistedRooms;
        $wishlistedPackages = Auth::user()->wishlistedPackages;

        return view('frontend.user.wishlists', compact('wishlistedRooms', 'wishlistedPackages', 'defaultLang'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'item_id' => 'required|integer',
            'type' => 'required|in:room,package'
        ]);

        $type = $request->type == 'room' ? Room::class : Package::class;

        // Check if item exists
        $item = $type::find($request->item_id);
        if (!$item) {
            if ($request->ajax()) {
                return response()->json(['error' => __('Item not found.')], 404);
            }
            return back()->with('error', __('Item not found.'));
        }

        // Check if already in wishlist
        $exists = Wishlist::where([
            'user_id' => Auth::id(),
            'wishlistable_id' => $request->item_id,
            'wishlistable_type' => $type
        ])->exists();

        if ($exists) {
            // Remove from wishlist if already exists
            Wishlist::where([
                'user_id' => Auth::id(),
                'wishlistable_id' => $request->item_id,
                'wishlistable_type' => $type
            ])->delete();

            if ($request->ajax()) {
                return response()->json(['success' => __('Removed from wishlist successfully.')]);
            }
            return back()->with('success', __('Removed from wishlist successfully.'));
        }

        // Add to wishlist
        Wishlist::create([
            'user_id' => Auth::id(),
            'wishlistable_id' => $request->item_id,
            'wishlistable_type' => $type
        ]);

        if ($request->ajax()) {
            return response()->json(['success' => __('Added to wishlist successfully.')]);
        }
        return back()->with('success', __('Added to wishlist successfully.'));
    }

    public function remove(Request $request)
    {
        $request->validate([
            'item_id' => 'required|integer',
            'type' => 'required|in:room,package'
        ]);

        $type = $request->type == 'room' ? Room::class : Package::class;

        Wishlist::where([
            'user_id' => Auth::id(),
            'wishlistable_id' => $request->item_id,
            'wishlistable_type' => $type
        ])->delete();

        return back()->with('success', __('Removed from wishlist successfully.'));
    }
}
