<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class SlideModel extends Model
{
    protected $table="slide";

    protected $fillable=[
        'slide_name',
        'image',
        'created_at',
        'updated_at',
    ];
}
