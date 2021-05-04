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
        $newstypelist=NewsTypeModel::paginate(2);
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
    // public function newstypeSave(Request $request)
    // {
    //     $rules = [
    //         'new_type_name'=>'required',
    //         'description'=>'required',
    //         // 'file' => 'required',
    //     ];
    //     $validator= Validator::make($request->all(),$rules);
    //     if($validator->fails())
    //     {
    //        return response()->json($validator->errors(),401);
    //     }

    //     if ($files = $request->file('file')) {
             
    //         //store file into document folder
    //         $file = $request->file->store('public/documents');
 
    //         //store your file into database
    //         $document = new NewsTypeModel();
    //         $document->description = $file;
    //         $document->new_type_name = $request->new_type_name;
    //         $document->save();
              
    //         return response()->json([
    //             "success" => true,
    //             "message" => "File successfully uploaded",
    //             "file" => $file
    //         ]);
  
    //     }
    // }
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
        else
        {
            return response()->json(['message'=>'Cập nhật loại tin tức thành công!'], 404);
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
        else
        {
            return response()->json(['message'=>'Xóa loại tin tức thành công!'], 404);
        }
        $newstype->delete();
        return response()->json(null,204);
    }
}
