<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\OderModel;
use App\Model\OderDetailModel;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;


class CartController extends Controller
{

    public function saveCarts(Request $request)
    {
        // return response()->json(["data" => $request->carts, "success" => true], 200);
        $tblcart = new OderModel([
            'order_name' => $request->order_name,
            'order_address' => $request->order_address,
            'order_email' => $request->order_email,
            'order_phone' => $request->order_phone,
            'order_note' => $request->order_note,
            'totalMoney' => $request->totalMoney,
            'payment_status' => $request->payment_status,
        ]);
        try {
            $tblcart->save();
            // return response()->json(["data" => $tblcart, "success" => true], 200);

            $items = json_decode($request->getContent(), true);
            foreach ($request->carts as $key => $value) {
                $value = (object) $value;
                $tblinfocart = new OderDetailModel([
                    'product_id' => $value->id,
                    'order_id' => $tblcart->id,
                    'quantity' => $value->quantity,
                ]);
                // dd($tblinfocart);
                $product = OderModel::where('id', $value->id);
                $product->update(['quantity' => ($product->first()->quantity) - ($value->quantity)]);
                $tblinfocart->save();
            }

            return response()->json(["data" => $tblcart, "success" => true], 200);
        } catch (QueryException  $ex) { // User not found
            return   response()->json(["error" => $ex->getMessage(), "success" => false], 200);
        }

        // $tblinfocart->save();
        // dd($tblcart);
        return response()->json([
            'id' => $tblcart,
            'message' => 'Successfully!'
        ], 200);
        $tblinfocart = new OderDetailModel([
            'product_id' => $value->id,
            'order_id' => $tblcart->id,
            'quantity' => $value->quantity,
        ]);

        $tblcart->save();
        return response()->json([
            'id' => $tblcart->id,
            'message' => 'Successfully!'
        ], 200);
    }
}
