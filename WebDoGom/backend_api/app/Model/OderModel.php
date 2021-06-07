<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class OderModel extends Model
{
    protected $table="order";

    public function order_detail()
    {
        return $this->hasMany('App/Model/order_detail','order_id','id');
    }
    public function customer()
    {
        return $this->belongsTo('App/Model/customer','customer_id','id');
    }
    protected $fillable=[
        'order_name',
        'order_address',
        'order_email',
        'order_phone',
        'order_note',
        'totalMoney',
        'payment_status',
        'created_at',
        'updated_at',
    ];
}
