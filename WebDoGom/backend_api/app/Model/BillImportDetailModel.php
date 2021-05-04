<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class BillImportDetailModel extends Model
{
    protected $table="bill_import_detail";

    public function bill_import()
    {
        return $this->belongsTo('App/Model/bill_import','bill_import_id','id');
    }
    public function product()
    {
        return $this->belongsTo('App/Model/product','product_id','id');
    }
    protected $fillable=[
        'bill_import_id ',
        'product_id ',
        'shipment_number ',
        'acount ',
        'created_at',
        'updated_at',
    ];
}
