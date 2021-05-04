<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product', function (Blueprint $table) {
            $table->increments('id',10);
            $table->string('name');
            $table->string('image');
            $table->string('size');
            $table->string('origin');
            $table->string('material');
            $table->string('note');
            $table->string('shipment_number');
            $table->text('introduction');
            $table->integer('status');
            $table->integer('amount');
            $table->integer('product_type_id')->unsigned();
            $table->integer('producer_id')->unsigned();
            $table->timestamps();
            $table->foreign('product_type_id')->references('id')->on('product_type');
            $table->foreign('producer_id')->references('id')->on('producer');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product');
    }
}
