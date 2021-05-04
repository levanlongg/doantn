<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class IntroductionModel extends Model
{
    protected $table="introduction";

    protected $fillable=[
        'name',
        'image',
        'content',
        'create_by',
        'created_at',
        'updated_at',
    ];
}
