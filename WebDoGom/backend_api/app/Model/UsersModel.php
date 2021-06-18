<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class UsersModel extends Model
{
    protected $table="users";

    public function rolemaster()
    {
        return $this->belongsTo('App/Model/rolemaster','role_id','id');
    }

    protected $fillable=[
        'name',
        'address ',
        'phone',
        'email',
        'password',
        'role_id ',
        'created_at',
        'updated_at',
    ];
}
