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
            'name' => $request->name,
            'idcustomer' => $request->idcustomer,
            'address' => $request->address,
            'phone' => $request->phone,
            'totalmoney' => $request->totalMoney,
            'status' => $request->status,
            'reason' => $request->reason,
            'paytype' => $request->paytype,
            'payTypeOfType' => $request->payTypeOfType,
        ]);
        try {
            $tblcart->save();
            // return response()->json(["data" => $tblcart, "success" => true], 200);

            foreach ($request->carts as $key => $value) {
                $value = (object) $value;
                // dd($value);
                $tblinfocart = new OderModel([
                    'idproduct' => $value->id,
                    'idcart' => $tblcart->id,
                    'mass' => $value->quantity,
                    'price' => $value->priceSale,
                    'totalMoney' => $value->totalMoneySale,
                    'typeCategory' => $value->typequantity
                ]);
                // dd($tblinfocart);
                $product = OderModel::where('idproduct', $value->id);
                $product->update(['mass' => ($product->first()->mass) - ($value->quantity)]);
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
        $tblinfocart = new OderModel([
            'idproduct' => $request->idproduct,
            'idcart' => $request->idcart,
            'mass' => $request->mass,
            'price' => $request->price,
            'totalMoney' => $request->totalMoney,
            'typeCategory' => $request->typeCategory
        ]);

        $tblcart->save();
        return response()->json([
            'id' => $tblcart->id,
            'message' => 'Successfully!'
        ], 200);
    }
}
