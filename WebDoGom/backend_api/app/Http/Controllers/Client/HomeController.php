<?php

namespace App\Http\Controllers\Client;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Model\ProductModel;

class HomeController extends Controller
{
    public function Home_tranh_gom()
    {
        $tranhgom = DB::table('product')->where([
            ['product_type_id', '=', '20'],
            ['show_home', '=', '1'],
        ])->get();
        return response()->json($tranhgom, 200);
    }

    public function Home_gom_trang_tri()
    {
        $tranhgom = DB::table('product')->where([
            ['product_type_id', '=', '21'],
            ['show_home', '=', '1'],
        ])->get();
        return response()->json($tranhgom, 200);
    }

    public function Home_gom_phong_thuy()
    {
        $tranhgom = DB::table('product')->where([
            ['product_type_id', '=', '22'],
            ['show_home', '=', '1'],
        ])->get();
        return response()->json($tranhgom, 200);
    }
    
    public function Home_gom_gia_dung()
    {
        $tranhgom = DB::table('product')->where([
            ['product_type_id', '=', '23'],
            ['show_home', '=', '1'],
        ])->get();
        return response()->json($tranhgom, 200);
    }

    public function List_product()
    {
        $tranhgom = DB::table('product')->get();
        return response()->json($tranhgom, 200);
    }

    public function Product_detail($id)
    {
        $chitiet = ProductModel::find($id);
        if (is_null($chitiet)) {
            return response()->json(['message' => 'Sản phẩm cần tìm không tồn tại!'], 404);
        }
        return response()->json($chitiet, 200);
    }
    
    public function search($name)
    {
        return ProductModel::where("name","like","%".$name."%")
                            ->get();
    }
}
