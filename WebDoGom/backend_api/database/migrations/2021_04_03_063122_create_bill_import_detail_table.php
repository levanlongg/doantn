<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBillImportDetailTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bill_import_detail', function (Blueprint $table) {
            $table->increments('id',10);
            $table->integer('bill_import_id')->unsigned();;
            $table->integer('product_id')->unsigned();;
            $table->string('shipment_number');
            $table->integer('acount');
            $table->timestamps();
            $table->foreign('bill_import_id')->references('id')->on('bill_import');
            $table->foreign('product_id')->references('id')->on('product');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bill_import_detail');
    }
}
