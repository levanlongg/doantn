<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\IntroductionModel;
use Illuminate\Support\Facades\Validator;

class IntroductionController extends Controller
{
    public function introduction()
    {
        $introductionlist=IntroductionModel::paginate(2);
        return response()->json($introductionlist,200);
        // return response()->json(ProducerModel::get(),200);
    }
    //get method by id
    public function introductionById($id)
    {
        $introduction = IntroductionModel::find($id);
        if(is_null($introduction)){
            return response()->json(['message'=>'Thông tin giới thiệu cần tìm không tồn tại!'], 404);
        }
        return response()->json($introduction,200);
        //return response()->json(ProducerModel::find($id),200);
    }
    //post method
    public function introductionSave(Request $request)
    {
        $rules = [
            'name'=>'required',
            'image'=>'required',
            'content'=>'required',
            'create_by'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $introduction=IntroductionModel::create($request->all());
        return response()->json($introduction,201);
    }
    //update method
    public function introductionUpdate(Request $request, $id)
    {
        $introduction = IntroductionModel::find($id);
        if(is_null($introduction)){
            return response()->json(['message'=>'Chưa cập nhật thông tin giới thiệu!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Cập nhật thông tin giới thiệu thành công!'], 404);
        }
        $introduction->update($request->all());
        return response()->json($introduction,200);
    }
    //delete method
    public function introductionDelete($id)
    {
        $introduction = IntroductionModel::find($id);
        if(is_null($introduction)){
            return response()->json(['message'=>'Xóa thông tin giới thiệu không thành công!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Xóa thông tin giới thiệu thành công!'], 404);
        }
        $introduction->delete();
        return response()->json(null,204);
    }
}
