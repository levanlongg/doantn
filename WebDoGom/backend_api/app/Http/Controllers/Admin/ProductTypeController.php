<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\ProductTypeModel;
use Illuminate\Support\Facades\Validator;

class ProductTypeController extends Controller
{
    //get method
    public function producttype()
    {
        // $producttypelist=ProductTypeModel::paginate(2);
        // return response()->json($producttypelist,200);
        return response()->json(ProductTypeModel::get(),200);
    }
    //get method by id
    public function producttypeById($id)
    {
        $producttype = ProductTypeModel::find($id);
        if(is_null($producttype)){
            return response()->json(['message'=>'Loại sản phẩm cần tìm không tồn tại!'], 404);
        }
        return response()->json($producttype,200);
        //return response()->json(ProducerModel::find($id),200);
    }
    //post method
    public function producttypeSave(Request $request)
    {
        $rules = [
            'name'=>'required',
            'describle'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $producttype=ProductTypeModel::create($request->all());
        return response()->json($producttype,201);
    }
    //update method
    public function producttypeUpdate(Request $request, $id)
    {
        $producttype = ProductTypeModel::find($id);
        if(is_null($producttype)){
            return response()->json(['message'=>'Chưa cập nhật loại sản phẩm!'], 404);
        }
        $producttype->update($request->all());
        return response()->json($producttype,200);
    }
    //delete method
    public function producttypeDelete($id)
    {
        $producttype = ProductTypeModel::find($id);
        if(is_null($producttype)){
            return response()->json(['message'=>'Xóa loại sản phẩm không thành công!'], 404);
        }
        $producttype->delete();
        return response()->json(null,204);
    }
    public function search($name)
    {
        return ProductTypeModel::where("name","like","%".$name."%")
                            ->orwhere("describle","like","%".$name."%")->get();
    }
}
