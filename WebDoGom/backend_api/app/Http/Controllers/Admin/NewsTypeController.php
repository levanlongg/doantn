<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\NewsTypeModel;
use Illuminate\Support\Facades\Validator;

class NewsTypeController extends Controller
{
    public function newstype()
    {
        $newstypelist=NewsTypeModel::all();
        return response()->json($newstypelist,200);
    }
    //get method by id
    public function newstypeById($id)
    {
        $newstype = NewsTypeModel::find($id);
        if(is_null($newstype)){
            return response()->json(['message'=>'Loại tin cần tìm không tồn tại!'], 404);
        }
        return response()->json($newstype,200);
    }
    //post method
    public function newstypeSave(Request $request)
    {
        $rules = [
            'new_type_name'=>'required',
            'description'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $newstype=NewsTypeModel::create($request->all());
        return response()->json($newstype,201);
    }
    //update method
    public function newstypeUpdate(Request $request, $id)
    {
        $newstype = NewsTypeModel::find($id);
        if(is_null($newstype)){
            return response()->json(['message'=>'Chưa cập nhật loại tin tức!'], 404);
        }
        $newstype->update($request->all());
        return response()->json($newstype,200);
    }
    //delete method
    public function newstypeDelete($id)
    {
        $newstype = NewsTypeModel::find($id);
        if(is_null($newstype)){
            return response()->json(['message'=>'Xóa loại tin tức không thành công!'], 404);
        }
        $newstype->delete();
        return response()->json(null,204);
    }
    //search method
    public function search($name)
    {
        return NewsTypeModel::where("new_type_name","like","%".$name."%")
                            ->orwhere("description","like","%".$name."%")->get();
    }
}
