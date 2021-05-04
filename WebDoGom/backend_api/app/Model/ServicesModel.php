<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ServicesModel extends Model
{
    protected $table="services";

    protected $fillable=[
        'name',
        'description',
        'create_by',
        'created_at',
        'updated_at',
    ];
}
