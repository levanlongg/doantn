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
        'customer_id  ',
        'order_name',
        'order_address',
        'order_email',
        'order_phone',
        'order_note',
        'total_money',
        'paypal_acount',
        'pay_online',
        'pay_offline',
        'prpayment_statusice',
        'created_at',
        'updated_at',
    ];
}
