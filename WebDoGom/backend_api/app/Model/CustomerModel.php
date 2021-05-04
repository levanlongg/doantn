<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CustomerModel extends Model
{
    protected $table="customer";

    public function order()
    {
        return $this->hasMany('App/Model/order','customer_id','id');
    }

    protected $fillable=[
        'name',
        'address',
        'email',
        'phone_number',
        'created_at',
        'updated_at',
    ];
}
