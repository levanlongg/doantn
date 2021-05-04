<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UsersModel extends Model
{
    protected $table="users";

    protected $fillable=[
        'name',
        'email ',
        'email_verified_at',
        'password',
        'role_id ',
        'remember_token',
        'created_at',
        'updated_at',
    ];
}
