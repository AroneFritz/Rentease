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
            $table->string('button_text')->nullable()->after('url');
            $table->string('background_image')->nullable()->after('button_text');
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
            $table->dropColumn('button_text');
            $table->dropColumn('background_image');
        });
    }
};
