<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class NewsModel extends Model
{
    protected $table="news";

    public function news_type()
    {
        return $this->belongsTo('App/Model/news_type','new_type_id','id');
    }

    protected $fillable=[
        'new_type_id ',
        'title',
        'description',
        'content',
        'created_at',
        'updated_at',
    ];
}
