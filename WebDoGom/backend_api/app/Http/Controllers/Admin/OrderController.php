<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\OderModel;
use App\Model\OderDetailModel;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function order()
    {
        $orderlist=OderModel::paginate(2);
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
        $order = OderModel::find($id);
        if(is_null($order)){
            return response()->json(['message'=>'Chưa cập nhật đơn hàng!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Cập nhật đơn hàng thành công!'], 404);
        }
        $order->update($request->all());
        return response()->json($order,200);
    }
    //delete method
    public function orderDelete($id)
    {
        $order = OderModel::find($id);
        if(is_null($order)){
            return response()->json(['message'=>'Xóa đơn hàng không thành công!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Xóa đơn hàng thành công!'], 404);
        }
        $order->delete();
        return response()->json(null,204);
    }
}
