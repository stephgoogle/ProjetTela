<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEbankProfilsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ebank_profils', function (Blueprint $table) {
            $table->id();
            $table->string('nom')->nullable();
            $table->string('prenoms')->nullable();
            $table->string('balance');
            $table->string('photo')->nullable();
            $table->string('email')->nullable();
            $table->string('phone')->unique();
            $table->boolean('is_staff')->nullable()->default(false);
            $table->boolean('is_demarcheur')->nullable()->nullable()->default(false);
            $table->boolean('is_suspended')->nullable()->default(false);
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->boolean('is_validated')->nullable()->default(false);
            $table->boolean('has_epargne')->nullable()->default(false);

            $table->unsignedBigInteger('information_identity_id');
            $table->timestamps();

            $table->foreign('information_identity_id')->references('id')
                ->on('information_identies')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ebank_profils');
    }
}
