<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class statics extends Controller
{
    public function total_revenue()
    {
         //Tổng doanh thu
        $model_order = DB::table('order')
        ->where('payment_status', 3)
        ->get([
            DB::raw('SUM(totalMoney) as value'),
            DB::raw('COUNT(*) as value1')
            ]);
        return response()->json($model_order,200);
    }

    public function total_new_order()
    {
        $model_product = DB::table('order')
        ->where('payment_status', 0)
        ->get([
            DB::raw('COUNT(*) as value3'),
            ]);
        return response()->json($model_product,200);
    }
    public function total_order_dg()
    {
        $model_product = DB::table('order')
        ->where('payment_status', 1)
        ->get([
            DB::raw('COUNT(*) as value4'),
            ]);
        return response()->json($model_product,200);
    }
    public function total_order_vc()
    {
        $model_product = DB::table('order')
        ->where('payment_status', 2)
        ->get([
            DB::raw('COUNT(*) as value5'),
            ]);
        return response()->json($model_product,200);
    }

    public function total_product()
    {
        $model_product = DB::table('product')
        ->get([
            DB::raw('SUM(amountsp) as value2'),
            ]);
        return response()->json($model_product,200);
    }

    public function statistic_order_by_month(Request $request)
    {
        $model_order = DB::table('order')->where('payment_status', 3);
        $month = $request->month;
        $year = $request->year;
        $model = $model_order->whereMonth('created_at', $month)->whereYear('created_at', $year);
        $count = $model->count();
        $money = $model->sum('totalMoney');
        return response()->json([
            'count' => $count,
            'money' => number_format($money) . ' đ',
            'status' => true
        ]);
    }

    public function statistic_order_by_year(Request $request)
    {
        $model_order = DB::table('order')->where('payment_status', 3);
        $year = $request->year;
        $model = $model_order->whereYear('created_at', $year);
        $count = $model->count();
        $money = $model->sum('totalMoney');
        return response()->json([
            'count' => $count,
            'money' => number_format($money) . ' đ',
            'status' => true
        ]);
    }
}
