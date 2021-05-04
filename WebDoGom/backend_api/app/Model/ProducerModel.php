<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProducerModel extends Model
{
    protected $table="producer";

    protected $fillable=[
        'name',
        'address',
        'email',
        'phone',
        'status',
        'created_at',
        'updated_at',
    ];

    // public function product()
    // {
    //     return $this->hasMany('App/Model/product','producer_id','id');
    // }

}
