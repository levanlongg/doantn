<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class RoleMasterModel extends Model
{
    protected $table="rolemaster";

    public function users()
    {
        return $this->hasMany('App/Model/users','role_id ','id');
    }


    protected $fillable=[
        'name',
        'created_at',
        'updated_at',
    ];
}
