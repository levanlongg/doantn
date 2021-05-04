<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProductModel extends Model
{
    protected $table="product";

    public function producer()
    {
        return $this->belongsTo('App/Model/producer','producer_id','id');
    }

    public function product_type()
    {
        return $this->belongsTo('App/Model/product_type','product_type_id','id');
    }

    public function order_detail()
    {
        return $this->hasMany('App/Model/order_detail','order_id ','id');
    }

    public function prices()
    {
        return $this->hasMany('App/Model/prices','product_id','id');
    }

    public function bill_import_detail()
    {
        return $this->hasMany('App/Model/bill_import_detail','product_id ','id');
    }

    protected $fillable=[
        'name',
        'image',
        'size',
        'origin',
        'material',
        'note',
        'shipment_number',
        'introduction',
        'status',
        'amount',
        'product_type_id ',
        'producer_id ',
        'created_at',
        'updated_at',
    ];
}
