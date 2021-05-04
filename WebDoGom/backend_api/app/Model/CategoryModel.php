<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CategoryModel extends Model
{
    protected $table="category";

    protected $fillable=[
        'name',
        'create_by',
        'description',
        'show_on_home',
        'show_on_admin',
        'created_at',
        'updated_at',
    ];
}
