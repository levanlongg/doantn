<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class NewsTypeModel extends Model
{
    protected $table="new_type";

    public function news()
    {
        return $this->hasMany('App/Model/news','new_type_id','id');
    }

    protected $fillable=[
        'new_type_name',
        'description',
        'created_at',
        'updated_at',
    ];
}
