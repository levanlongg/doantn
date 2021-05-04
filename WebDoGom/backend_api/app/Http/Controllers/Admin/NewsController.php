<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\NewsModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class NewsController extends Controller
{
    public function news()
    {
        $newslist = DB::table('news')
        ->join('new_type', 'news.new_type_id','=','new_type.id')
        ->select('new_type.new_type_name', 'news.content', 'news.title','news.description')
        ->orderBy('news.id', 'desc')->paginate(2);
        // $newslist=NewsModel::paginate(2);
        return response()->json($newslist,200);
    }
    //get method by id
    public function newsById($id)
    {
        $introduction= DB::table('news')
        ->join('new_type', 'news.new_type_id','=','new_type.id')
        ->select('new_type.new_type_name', 'news.content', 'news.title','news.description')
        ->where('news.id',$id)->get();
        //$introduction = NewsModel::find($id);
        if(is_null($introduction)){
            return response()->json(['message'=>'Tin cần tìm không tồn tại!'], 404);
        }
        return response()->json($introduction,200);
    }
    //post method
    public function newsSave(Request $request)
    {
        $rules = [
            'new_type_id'=>'required',
            'title'=>'required',
            'description'=>'required',
            'content'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $news=NewsModel::create($request->all());
        return response()->json($news,201);
    }
    //update method
    public function newsUpdate(Request $request, $id)
    {
        $news = NewsModel::find($id);
        if(is_null($news)){
            return response()->json(['message'=>'Chưa cập nhật tin tức!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Cập nhật thông tin tức thành công!'], 404);
        }
        $news->update($request->all());
        return response()->json($news,200);
    }
    //delete method
    public function newsDelete($id)
    {
        $news = NewsModel::find($id);
        if(is_null($news)){
            return response()->json(['message'=>'Xóa tin tức không thành công!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Xóa tin tức thành công!'], 404);
        }
        $news->delete();
        return response()->json(null,204);
    }
}
