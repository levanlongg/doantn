<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\IntroductionModel;
use Illuminate\Support\Facades\Validator;
use Intervention\Image\Facades\Image;


class IntroductionController extends Controller
{
    public function introduction()
    {
        $introductionlist=IntroductionModel::all();
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
        // $validator = Validator::make($request->all(),[
        //         'name'=>'required',
        //         'image'=>'required',
        //         'content'=>'required',
        //         'create_by'=>'required',
        // ]);
        // if($validator->fails())
        // {
        //     return response()->json(['error'=>$validator->errors()->all(),400]);
        // }
        // $data =new IntroductionModel();
        // $data->name = $request->name;
        // $data->content = $request->content;
        // $data->create_by = $request->create_by;
        // if($request->hasFile('image'))
        // {
        //     $img=($request->image);
        //     $img_name=time().'-'.$img->getClientOriginalName();
        //     Image::make($img)->save(storage_path("app/public/".$img_name));
        //     $data->image=$img_name;
        // }
        // if($data->save())
        // {
        //     return response()->json([
        //         "data"=>$data,
        //         "msg"=>"Create product successfully"
        //     ],201);
        // }
        // else{
        //     return response()->json([
        //         "data"=>null,
        //         "msg"=>"Create product fails"
        //     ],400);
        // }
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
            return response()->json(['message'=>'Chưa cập nhật loại tin tức!'], 404);
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
        $introduction->delete();
        return response()->json(null,204);
    }
    public function search($name)
    {
        return IntroductionModel::where("name","like","%".$name."%")
                            ->orwhere("describle","like","%".$name."%")->get();
    }
}
