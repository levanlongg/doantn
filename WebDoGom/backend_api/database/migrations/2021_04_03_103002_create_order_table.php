<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('customer_id')->unsigned();
            $table->string('order_name');
            $table->string('order_address');
            $table->string('order_email');
            $table->string('order_phone', 15);
            $table->text('order_note')->nullable();
            $table->decimal('total_money', 12, 2);
            $table->integer('paypal_acount');
            $table->integer('pay_online');
            $table->integer('pay_offline');
            $table->tinyInteger('payment_status')->default(0);
            $table->timestamps();
            $table->foreign('customer_id')->references('id')->on('customer');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order');
    }
}
