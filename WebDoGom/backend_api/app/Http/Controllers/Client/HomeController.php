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
    public function CreateOrder(OderDetailModel $detail, Request $request)
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
                    "data" => $order,
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
}
