<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use App\Model\ProductModel;
use App\Model\OderModel;
use App\Model\OderDetailModel;
use App\Model\CustomerModel;
use Illuminate\Support\Facades\Auth;

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

    public function Sanphamkhac()
    {
        $spkhac = DB::table('product')->where([
            ['show_home', '=', '2'],
        ])->get();
        return response()->json($spkhac, 200);
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
        return ProductModel::where("name", "like", "%" . $name . "%")
            ->get();
    }

    public function orderlist()
    {
        return response()->json(OderModel::get(), 200);
    }
    public function CreateOrder(OderDetailModel $item, Request $request)
    {
        try {
            $order = new OderModel();
            // $order->customer_id  = $request->customer_id;;
            $order->order_name = $request->order_name;
            $order->order_address = $request->order_address;
            $order->order_email = $request->order_email;
            $order->order_phone = $request->order_phone;
            $order->order_note = $request->order_note;
            $order->totalMoney = $request->totalMoney;
            $order->payment_status = $request->payment_status;
            $order->save();
            if ($order->save()) {
                return response()->json([
                    "data" => $order,
                    "msg" => "Create order successfully"
                ], 201);
            } else {
                return response()->json([
                    "data" => null,
                    "msg" => "Create order fails"
                ], 400);
            }

            $items = json_decode($request->getContent(), true);
            foreach ($items as $item) {
                $orderItem = new OderDetailModel();
                $orderItem->order_id = $order->id;
                $orderItem->product_id = $item['product_id'];
                $orderItem->quantity = $item['quantity'];
                $orderItem->save();
            }
           if ($orderItem->save()) {
                return response()->json([
                    "data" => $items,
                    "msg" => "Create order successfully"
                ], 201);
            } else {
                return response()->json([
                    "data" => null,
                    "msg" => "Create order fails"
                ], 400);
            }
        } catch (\Exception $e)
        {
        }
    }

    //lọc
    public function under500()
    {
        $under500 = ProductModel::select("*")
        ->whereBetween('sales_prices', [0, 499000])
        ->get();
        return response()->json($under500,200);
    }

    public function from500to1000()
    {
        $from500to1000 = ProductModel::select("*")
        ->whereBetween('sales_prices', [500000, 1000000])
        ->get();
        return response()->json($from500to1000,200);
    }

    public function from1000to1500()
    {
        $from1000to1500 = ProductModel::select("*")
        ->whereBetween('sales_prices', [1000000, 1500000])
        ->get();
        return response()->json($from1000to1500,200);
    }

    public function from1500to2000()
    {
        $from1500to2000 = ProductModel::select("*")
        ->whereBetween('sales_prices', [1500000, 2000000])
        ->get();
        return response()->json($from1500to2000,200);
    }

    public function from2000to2500()
    {
        $from2000to2500 = ProductModel::select("*")
        ->whereBetween('sales_prices', [2000000, 2500000])
        ->get();
        return response()->json($from2000to2500,200);
    }

    public function from2500to3500()
    {
        $from2500to3500 = ProductModel::select("*")
        ->whereBetween('sales_prices', [2500000, 3500000])
        ->get();
        return response()->json($from2500to3500,200);
    }

    public function from3500to4500()
    {
        $from3500to4500 = ProductModel::select("*")
        ->whereBetween('sales_prices', [3500000, 4500000])
        ->get();
        return response()->json($from3500to4500,200);
    }

    public function from4500to5500()
    {
        $from4500to5500 = ProductModel::select("*")
        ->whereBetween('sales_prices', [4500000, 5500000])
        ->get();
        return response()->json($from4500to5500,200);
    }

    public function over5500()
    {
        $over5500 = ProductModel::select("*")
        ->where('sales_prices', '>', 5500000 )
        ->get();
        return response()->json($over5500,200);
    }

    //loc loai sp

    public function Gomgiadung()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '23'],
        ])->get();
        return response()->json($gomgiadung,200);
    }

    public function Gomtrangtri()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '21'],
        ])->get();
        return response()->json($gomgiadung,200);
    }

    public function Gomphongthuy()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '22'],
        ])->get();
        return response()->json($gomgiadung,200);
    }

    public function Quatang()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '24'],
        ])->get();
        return response()->json($gomgiadung,200);
    }

    public function Tranhgom()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '20'],
        ])->get();
        return response()->json($gomgiadung,200);
    }

    public function Tuonggom()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '25'],
        ])->get();
        return response()->json($gomgiadung,200);
    }

    public function Dotho()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '26'],
        ])->get();
        return response()->json($gomgiadung,200);
    }

    public function Doluuniem()
    {
        $gomgiadung = DB::table('product')->where([
            ['product_type_id', '=', '27'],
        ])->get();
        return response()->json($gomgiadung,200);
    }
}
