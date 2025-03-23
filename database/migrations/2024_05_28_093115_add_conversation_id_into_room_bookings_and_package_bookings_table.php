<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('room_bookings', function (Blueprint $table) {
            if (!Schema::hasColumn('room_bookings', 'conversation_id')) {
                $table->string('conversation_id')->nullable();
            }
        });
        Schema::table('package_bookings', function (Blueprint $table) {
            if (!Schema::hasColumn('package_bookings', 'conversation_id')) {
                $table->string('conversation_id')->nullable();
            }
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('room_bookings', function (Blueprint $table) {
            if (Schema::hasColumn('room_bookings', 'conversation_id')) {
                $table->dropColumn('conversation_id');
            }
        });
        Schema::table('package_bookings', function (Blueprint $table) {
            if (Schema::hasColumn('package_bookings', 'conversation_id')) {
                $table->dropColumn('conversation_id');
            }
        });
    }
};
