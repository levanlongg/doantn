<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PricesModel extends Model
{
    protected $table="prices";

    public function product()
    {
        return $this->belongsTo('App/Model/product','product_id','id');
    }

    protected $fillable=[
        'import_prices',
        'sales_prices',
        'create_by',
        'status',
        'start_day',
        'end_day',
        'product_id ',
        'created_at',
        'updated_at',
    ];
}
