<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\ContactModel;
use Illuminate\Support\Facades\Validator;

class ContactController extends Controller
{
    public function contact()
    {
        $contactlist=ContactModel::all();
        return response()->json($contactlist,200);
    }
    //get method by id
    public function contactById($id)
    {
        $contact = ContactModel::find($id);
        if(is_null($contact)){
            return response()->json(['message'=>'Liên hệ cần tìm không tồn tại!'], 404);
        }
        return response()->json($contact,200);
        //return response()->json(ProducerModel::find($id),200);
    }
    //post method
    public function contactSave(Request $request)
    {
        $rules = [
            'address'=>'required',
            'phone'=>'required',
            'email'=>'required',
            'website'=>'required',
            'create_by'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $contact=ContactModel::create($request->all());
        return response()->json($contact,201);
    }
    //update method
    public function contactUpdate(Request $request, $id)
    {
        $contact = ContactModel::find($id);
        $contact->update($request->all());
        return response()->json($contact,200);
    }
    //delete method
    public function contactDelete($id)
    {
        $contact = ContactModel::find($id);
        if(is_null($contact)){
            return response()->json(['message'=>'Xóa liên hệ không thành công!'], 404);
        }
        $contact->delete();
        return response()->json(null,204);
    }
    public function search($name)
    {
        return ContactModel::where("create_by","like","%".$name."%")
                            ->get();
    }
}
