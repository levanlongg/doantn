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
        $producerlist=ProducerModel::all();
        return response()->json($producerlist,200);

        // $token=$request->header('token');
        // $checkTokenIsValid=SessionUser::where('token',$token)->first();
        // if(empty($token))
        // {
        //     return response()->json([
        //         'code'=> 401,
        //         'message'=>'Token không được gửi thông qua header'
        //     ],401);
        // }
        // elseif(empty($checkTokenIsValid))
        // {
        //     return response()->json([
        //         'code'=> 401,
        //         'message'=>'Token không hợp lệ'
        //     ],401);
        // }
        // else
        // {
        //     $producerlist=ProducerModel::paginate(2);
        //     return response()->json($producerlist,200);
        // }

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
        $rules = [
            'name'=>'required',
            'address'=>'required',
            'email'=>'required',
            'phone'=>'required',
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
        $producer->delete();
        return response()->json(null,204);
    }

    public function search($name)
    {
        return ProducerModel::where("name","like","%".$name."%")
                            ->orwhere("phone","like","%".$name."%")
                            ->orwhere("status","like","%".$name."%")->get();
    }
}
