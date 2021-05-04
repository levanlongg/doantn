<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class OderDetailModel extends Model
{
    protected $table="order_detail";

    public function order()
    {
        return $this->belongsTo('App/Model/order','order_id','id');
    }
    public function product()
    {
        return $this->belongsTo('App/Model/product','product_id','id');
    }

    protected $fillable=[
        'order_id ',
        'product_id',
        'quantity',
        'price',
        'created_at',
        'updated_at',
    ];
}
