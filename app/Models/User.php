<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use App\Models\RoomManagement\RoomBooking;
use App\Models\PackageManagement\PackageBooking;
use App\Models\Wishlist;

class User extends Authenticatable
{
  use HasFactory, Notifiable;

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
    'first_name',
    'last_name',
    'image',
    'username',
    'email',
    'email_verified_at',
    'password',
    'password_code',
    'contact_number',
    'address',
    'city',
    'state',
    'country',
    'status',
    'verification_token',
    'email_verified'
  ];

  /**
   * The attributes that should be hidden for arrays.
   *
   * @var array
   */
  protected $hidden = [
    'password',
    'remember_token',
  ];

  /**
   * The attributes that should be cast to native types.
   *
   * @var array
   */
  protected $casts = [
    'email_verified_at' => 'datetime',
  ];

  public function bookHotelRoom()
  {
    return $this->hasMany('App\Models\RoomManagement\RoomBooking');
  }

  public function giveReviewForRoom()
  {
    return $this->hasMany('App\Models\RoomManagement\RoomReview');
  }

  public function bookTourPackage()
  {
    return $this->hasMany('App\Models\PackageManagement\PackageBooking');
  }

  public function giveReviewForPackage()
  {
    return $this->hasMany('App\Models\PackageManagement\PackageReview');
  }

  public function roomBookings()
  {
    return $this->hasMany(RoomBooking::class, 'user_id');
  }

  public function packageBookings()
  {
    return $this->hasMany(PackageBooking::class, 'user_id');
  }

  public function wishlists()
  {
    return $this->hasMany(Wishlist::class);
  }

  public function wishlistedRooms()
  {
    return $this->hasManyThrough(
      'App\Models\RoomManagement\Room',
      'App\Models\Wishlist',
      'user_id',
      'id',
      'id',
      'wishlistable_id'
    )->where('wishlistable_type', 'App\Models\RoomManagement\Room');
  }

  public function wishlistedPackages()
  {
    return $this->hasManyThrough(
      'App\Models\PackageManagement\Package',
      'App\Models\Wishlist',
      'user_id',
      'id',
      'id',
      'wishlistable_id'
    )->where('wishlistable_type', 'App\Models\PackageManagement\Package');
  }
}
