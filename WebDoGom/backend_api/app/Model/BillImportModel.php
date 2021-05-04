<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class BillImportModel extends Model
{
    protected $table="bill_import";

    public function bill_import_detail()
    {
        return $this->hasMany('App/Model/bill_import_detail','bill_import_id','id');
    }

    protected $fillable=[
        'create_by',
        'producer_name',
        'created_at',
        'updated_at',
    ];
}
