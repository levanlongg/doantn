<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\ProducerModel;
use App\SessionUser;
use Illuminate\Support\Facades\Validator;

class ProducerController extends Controller
{
    public function producer(Request $request)
    {
        $token=$request->header('token');
        $checkTokenIsValid=SessionUser::where('token',$token)->first();
        if(empty($token))
        {
            return response()->json([
                'code'=> 401,
                'message'=>'Token không được gửi thông qua header'
            ],401);
        }
        elseif(empty($checkTokenIsValid))
        {
            return response()->json([
                'code'=> 401,
                'message'=>'Token không hợp lệ'
            ],401);
        }
        else
        {
            $producerlist=ProducerModel::paginate(2);
            return response()->json($producerlist,200);
        }

        // $headers = apache_request_headers();
        // $token = $headers['token'];
        // dd($token);
        // $producerlist=ProducerModel::paginate(2);
        // return response()->json($producerlist,200);
        // return response()->json(ProducerModel::get(),200);
    }
    //get method by id
    public function producerById($id)
    {
        $producer = ProducerModel::find($id);
        if(is_null($producer)){
            return response()->json(['message'=>'Nhà sản xuất cần tìm không tồn tại!'], 404);
        }
        return response()->json($producer,200);
        //return response()->json(ProducerModel::find($id),200);
    }
    //post method
    public function producerSave(Request $request)
    {
        // $validator = Validator::make($request->all(),[
        //     'name'=>'required',
        //     'address'=>'required',
        //     'email'=>'required',
        //     'phone'=>'required',
        //     'status'=>'required',
        // ]);
        // if($validator->fails())
        // {
        //     return response()->json(['error'=>$validator->errors()->all(),400]);
        // }
        // $producer =new ProducerModel();
        // $producer->name = $request->name;
        // $producer->address = $request->address;
        // $producer->email = $request->email;
        // $producer->phone = $request->phone;
        // $producer->status = $request->status;
        // $producer->save();
        $rules = [
            'name'=>'required',
            'address'=>'required',
            'email'=>'required|email|unique:producer',
            'phone'=>'required|unique:producer',
            'status'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $producer=ProducerModel::create($request->all());
        return response()->json($producer,201);
    }
    //update method
    public function producerUpdate(Request $request, $id)
    {
        $producer = ProducerModel::find($id);
        if(is_null($producer)){
            return response()->json(['message'=>'Chưa cập nhật nhà sản xuất!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Cập nhật nhà sản xuất thành công!'], 404);
        }
        $producer->update($request->all());
        return response()->json($producer,200);
    }
    //delete method
    public function producerDelete($id)
    {
        $producer = ProducerModel::find($id);
        if(is_null($producer)){
            return response()->json(['message'=>'Xóa nhà sản xuất không thành công!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Xóa nhà sản xuất thành công!'], 404);
        }
        $producer->delete();
        return response()->json(null,204);
    }
}
