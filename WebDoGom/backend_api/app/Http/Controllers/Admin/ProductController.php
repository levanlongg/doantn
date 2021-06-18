<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Model\ProductModel;


class ProductController extends Controller
{
    public function product()
    {
        return response()->json(ProductModel::get(),200);
    }
    public function productById($id)
    {
        $product = ProductModel::find($id);
        if (is_null($product)) {
            return response()->json(['message' => 'Loại sản phẩm cần tìm không tồn tại!'], 404);
        }
        return response()->json($product, 200);
    }
    public function saveProduct(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'image' => 'required',
            'size' => 'required',
            'origin' => 'required',
            'material' => 'required',
            'note' => 'required',
            'shipment_number' => 'required',
            'introduction' => 'required',
            'status' => 'required',
            'amountsp' => 'required',
            'product_type_id' => 'required',
            'producer_id' => 'required',
            'import_prices' => 'required',
            'sales_prices' => 'required',
            'show_home' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->all(), 400]);
        }
        $data = new ProductModel();
        $data->name = $request->name;
        $data->size = $request->size;
        $data->origin = $request->origin;
        $data->material = $request->material;
        $data->note = $request->note;
        $data->shipment_number = $request->shipment_number;
        $data->introduction = $request->introduction;
        $data->status = $request->status;
        $data->amountsp = $request->amountsp;
        $data->product_type_id = $request->product_type_id;
        $data->producer_id = $request->producer_id;
        $data->import_prices = $request->import_prices;
        $data->sales_prices = $request->sales_prices;
        $data->show_home = $request->show_home;
        // $data->image = $request->image;
        $get_image1 = $request->file('image');
        if ($get_image1) {
            $get_new_image1 = $get_image1->getClientOriginalName();
            $name_image1 = current(explode('.', $get_new_image1));
            $new_image1 = $name_image1 . '.' . $get_image1->getClientOriginalExtension();
            $get_image1->move(base_path() . '/public/product/', $new_image1);
            $data->image = $new_image1;
            $data->save();
            return response()->json(['message'=>'Thêm thành công'], 201);
        }
        $data->image ='0';
        $data->save();
        if ($data->save()) {
            return response()->json([
                "data" => $data,
                "msg" => "Create product successfully"
            ], 201);
        } else {
            return response()->json([
                "data" => null,
                "msg" => "Create product fails"
            ], 400);
        }        
    }
    
    public function updateProduct(Request $request, $id)
    {
        $result = DB::table('product')->where('id', $id)->update([
            'name' => $request->name,
            'size' => $request->size,
            'origin' => $request->origin,
            'material' => $request->material,
            'note' => $request->note,
            'shipment_number' => $request->shipment_number,
            'introduction' => $request->introduction,
            'status' => $request->status,
            'amountsp' => $request->amountsp,
            'product_type_id' => $request->product_type_id,
            'producer_id' => $request->producer_id,
            'import_prices' => $request->import_prices,
            'sales_prices' => $request->sales_prices,
            'show_home' => $request->show_home,
            'image' => $request->image,
        ]);
        return response()->json($result, 200);
    }

    public function productDelete($id)
    {
        $product = ProductModel::find($id);
        if(is_null($product)){
            return response()->json(['message'=>'Xóa sản phẩm không thành công!'], 404);
        }
        $product->delete();
        return response()->json(null,204);
    }
    public function search($name)
    {
        return ProductModel::where("name","like","%".$name."%")
                            ->orwhere("origin","like","%".$name."%")
                            ->orwhere("material","like","%".$name."%")
                            ->get();
    }
}
