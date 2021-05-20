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
        $newslist=NewsModel::all();
        return response()->json($newslist,200);
    }
    //get method by id
    public function newsById($id)
    {
        $introduction = NewsModel::find($id);
        if(is_null($introduction)){
            return response()->json(['message'=>'Tin cần tìm không tồn tại!'], 404);
        }
        return response()->json($introduction,200);
    }
    //post method
    public function newsSave(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'new_type_id' =>'required',
            'title' =>'required',
            'description' =>'required',
            'content' =>'required',
            'image' =>'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->all(), 400]);
        } 
        $news = new NewsModel();
        $news->new_type_id = $request->new_type_id;
        $news->title = $request->title;
        $news->description = $request->description;
        $news->content = $request->content;
        $news->image = $request->image;
        $news->save();
        // $get_image1 = $request->file('image');
        // if ($get_image1) {
        //     $get_new_image1 = $get_image1->getClientOriginalName();
        //     $name_image1 = current(explode('.', $get_new_image1));
        //     $new_image1 = $name_image1 . '.' . $get_image1->getClientOriginalExtension();
        //     $get_image1->move(base_path() . '/public/image/', $new_image1);
        //     $news->image = $new_image1;
        //     $news->save();
        //     return response()->json(['message'=>'Thêm thành công'], 201);
        // }
        // $news->image ='0';
        
        if($news->save())
        {
            return response()->json([
                "data"=>$news,
                "msg"=>"Create news successfully"
            ],201);
        }
        else{
            return response()->json([
                "data"=>null,
                "msg"=>"Create news fails"
            ],400);
        }
    }
    //update method
    public function newsUpdate(Request $request, $id)
    {
        $result = DB::table('news')->where('id', $id)->update([
            'new_type_id' => $request->new_type_id,
            'title' => $request->title,
            'description' => $request->description,
            'content' => $request->content,
            'image' => $request->image,
            ]);
            return response()->json($result,200);
    }
    //delete method
    public function newsDelete($id)
    {
        $news = NewsModel::find($id);
        if(is_null($news)){
            return response()->json(['message'=>'Xóa tin tức không thành công!'], 404);
        }
        $news->delete();
        return response()->json(null,204);
    }
    public function search($name)
    {
        return NewsModel::where("title","like","%".$name."%")
                            ->orwhere("description","like","%".$name."%")
                            ->get();
    }
}
