<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProductTypeModel extends Model
{
    protected $table="product_type";

    public function product()
    {
        return $this->hasMany('App/Model/product','product_type_id','id');
    }

    protected $fillable=[
        'name',
        'describle',
        'created_at',
        'updated_at',
    ];
}
