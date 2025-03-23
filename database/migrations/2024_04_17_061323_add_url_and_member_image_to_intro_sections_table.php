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
        Schema::table('intro_sections', function (Blueprint $table) {
            $table->string('url')->nullable()->after('intro_text');
            $table->string('member_image')->nullable()->after('url');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('intro_sections', function (Blueprint $table) {
            $table->dropColumn('url');
            $table->dropColumn('member_image');
        });
    }
};
