<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\RoomManagement\Room;
use App\Models\PackageManagement\Package;

class Wishlist extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'wishlistable_id',
        'wishlistable_type'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function wishlistable()
    {
        return $this->morphTo();
    }
}
