<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\OderModel;
use App\Model\OderDetailModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function order()
    {
        $orderlist=OderModel::all();
        return response()->json($orderlist,200);
    }
    //get method by id
    public function orderById($id)
    {
        $order = OderModel::find($id);
        if(is_null($order)){
            return response()->json(['message'=>'Đơn đặt hàng cần tìm không tồn tại!'], 404);
        }
        return response()->json($order,200);
    }
    //update method
    public function orderUpdate(Request $request, $id)
    {
        $result = DB::table('order')->where('id', $id)->update([
            'order_name' => $request->order_name,
            'order_address' => $request->order_address,
            'order_email' => $request->order_email,
            'order_phone' => $request->order_phone,
            'order_note' => $request->order_note,
            'totalMoney' => $request->totalMoney,
            'payment_status' => $request->payment_status,
            ]);
            return response()->json($result,200);
    }
    //delete method
    public function orderDelete($id)
    {
        $order = OderModel::find($id);
        if(is_null($order)){
            return response()->json(['message'=>'Xóa đơn hàng không thành công!'], 404);
        }
        $order->delete();
        return response()->json(null,204);
    }
    public function search($name)
    {
        return OderModel::where("order_name","like","%".$name."%")
                            ->orwhere("order_email","like","%".$name."%")
                            ->orwhere("order_phone","like","%".$name."%")
                            ->orwhere("payment_status","like","%".$name."%")
                            ->get();
    }
}
