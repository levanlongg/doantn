<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Model\NewsModel;


class Knowneage_Blog extends Controller
{
    public function List_news()
    {
        $blog = DB::table('news')->where([
            ['new_type_id', '=', '78'],
        ])->get();
        return response()->json($blog, 200);
    }
    public function List_Knowleage_ceramics()
    {
        $knceramics = DB::table('news')->where([
            ['new_type_id', '=', '79'],
        ])->get();
        return response()->json($knceramics, 200);
    }

    public function News_detail($id)
    {
        $chitiet = NewsModel::find($id);
        if (is_null($chitiet)) {
            return response()->json(['message' => 'Sản phẩm cần tìm không tồn tại!'], 404);
        }
        return response()->json($chitiet, 200);
    }

    public function search($name)
    {
        return NewsModel::where("name", "like", "%" . $name . "%")
            ->get();
    }
}
