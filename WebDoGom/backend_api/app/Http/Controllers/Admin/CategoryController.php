<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\CategoryModel;
use Illuminate\Support\Facades\Validator;

class CategoryController extends Controller
{
    public function category()
    {
        $categorylist=CategoryModel::paginate(2);
        return response()->json($categorylist,200);
        // return response()->json(ProducerModel::get(),200);
    }
    //get method by id
    public function categoryById($id)
    {
        $producer = CategoryModel::find($id);
        if(is_null($producer)){
            return response()->json(['message'=>'Danh mục cần tìm không tồn tại!'], 404);
        }
        return response()->json($producer,200);
        //return response()->json(ProducerModel::find($id),200);
    }
    //post method
    public function categorySave(Request $request)
    {
        $rules = [
            'name'=>'required|min:1|max:30',
            'create_by'=>'required|min:1|max:30',
            'description'=>'required|min:1|max:1000',
            'show_on_home'=>'required',
            'show_on_admin'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $category=CategoryModel::create($request->all());
        return response()->json($category,201);
    }
    //update method
    public function categoryUpdate(Request $request, $id)
    {
        $category = CategoryModel::find($id);
        if(is_null($category)){
            return response()->json(['message'=>'Chưa cập nhật danh mục!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Cập nhật danh mục thành công!'], 404);
        }
        $category->update($request->all());
        return response()->json($category,200);
    }
    //delete method
    public function categoryDelete($id)
    {
        $category = CategoryModel::find($id);
        if(is_null($category)){
            return response()->json(['message'=>'Xóa danh mục không thành công!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Xóa danh mục thành công!'], 404);
        }
        $category->delete();
        return response()->json(null,204);
    }
}
