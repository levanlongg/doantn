<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ContactModel extends Model
{
    protected $table="contact";

    protected $fillable=[
        'subject',
        'message',
        'email',
        'message1',
        'create_by',
        'created_at',
        'updated_at',
    ];
}
