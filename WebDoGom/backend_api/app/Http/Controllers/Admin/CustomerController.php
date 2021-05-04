<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\CustomerModel;
use Illuminate\Support\Facades\Validator;

class CustomerController extends Controller
{
    public function customer()
    {
        $customertlist=CustomerModel::paginate(2);
        return response()->json($customertlist,200);
        // return response()->json(ProducerModel::get(),200);
    }
    //get method by id
    public function customerById($id)
    {
        $customer = CustomerModel::find($id);
        if(is_null($customer)){
            return response()->json(['message'=>'Liên hệ cần tìm không tồn tại!'], 404);
        }
        return response()->json($customer,200);
        //return response()->json(ProducerModel::find($id),200);
    }
    //post method
    public function contactSave(Request $request)
    {
        $rules = [
            'name'=>'required|min:1|max:30',
            'address'=>'required|min:3|max:255',
            'email'=>'required|email|unique',
            'phone_number'=>'required|unique|min:3|max:20',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $customer=CustomerModel::create($request->all());
        return response()->json($customer,201);
    }
    //update method
    public function contactUpdate(Request $request, $id)
    {
        $customer = CustomerModel::find($id);
        if(is_null($customer)){
            return response()->json(['message'=>'Chưa cập nhật liên hệ!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Cập nhật liên hệ thành công!'], 404);
        }
        $customer->update($request->all());
        return response()->json($customer,200);
    }
    //delete method
    public function customerDelete($id)
    {
        $customer = CustomerModel::find($id);
        if(is_null($customer)){
            return response()->json(['message'=>'Xóa liên hệ không thành công!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Xóa liên hệ thành công!'], 404);
        }
        $customer->delete();
        return response()->json(null,204);
    }
}
