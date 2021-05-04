<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
use App\Model\ProductModel;
use App\Model\PricesModel;
use App\Model\ProducerModel;
use App\Model\ProductTypeModel;
use Intervention\Image\Facades\Image;


class ProductController extends Controller
{
    public function product()
    {
        $productlist=ProductModel::paginate(2);
        return response()->json($productlist,200);
        // $productlist= DB::table('product')
        // ->join('product_type', 'product.product_type_id','=','product_type.id')
        // ->join('producer','product.producer_id','=','producer.id')
        // ->join('prices','prices.product_id','=','prices.id')
        // ->select('product.name')
        // ->orderBy('product.id', 'desc')->paginate(2);
        // // $newslist=NewsModel::paginate(2);
        // return response()->json($productlist,200);
    }
    public function productById($id)
    {
        $producttype = ProductModel::find($id);
        if(is_null($producttype)){
            return response()->json(['message'=>'Loại sản phẩm cần tìm không tồn tại!'], 404);
        }
        return response()->json($producttype,200);
        //return response()->json(ProducerModel::find($id),200);
        // $product= DB::table('product')
        // ->join('product_type', 'product.product_type_id','=','product_type.id')
        // ->join('producer','product.producer_id','=','producer.id')
        // ->join('prices','prices.product_id','=','prices.id')
        // ->select('product.name')
        // ->where('product.id',$id)->get();
        // if($product == null){
        //     return response()->json(['message'=>'Sản phẩm cần tìm không tồn tại!'], 404);
        // }
        // return response()->json($product,200);
    }
    public function saveProduct(Request $request)
    {
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'image'=>'required',
            'size'=>'required',
            'origin'=>'required',
            'material'=>'required',
            'note'=>'required',
            'shipment_number'=>'required',
            'introduction'=>'required',
            'status'=>'required',
            'amount'=>'required',
            'product_type_id'=>'required',
            'producer_id'=>'required',
        ]);
        if($validator->fails())
        {
            return response()->json(['error'=>$validator->errors()->all(),400]);
        }
        $data =new ProductModel();
        $data->name = $request->name;
        $data->size = $request->size;
        $data->origin = $request->origin;
        $data->material = $request->material;
        $data->note = $request->note;
        $data->shipment_number = $request->shipment_number;
        $data->introduction = $request->introduction;
        $data->status = $request->status;
        $data->amount = $request->amount;
        $data->product_type_id = $request->product_type_id;
        $data->producer_id = $request->producer_id;
        if($request->hasFile('image'))
        {
            $img=$request->image;
            $img_name=time().'-'.$img->getClientOriginalName();
            Image::make($img)->save(storage_path("app/public/".$img_name));
            $data->image=$img_name;
        }
        if($data->save())
        {
            return response()->json([
                "data"=>$data,
                "msg"=>"Create product successfully"
            ],201);
        }
        else{
            return response()->json([
                "data"=>null,
                "msg"=>"Create product fails"
            ],400);
        }
    }
    public function updateProduct(Request $request, $id)
    {
        $validator = Validator::make($request->all(),[
            'name'=>'required',
            'image'=>'required',
            'size'=>'required',
            'origin'=>'required',
            'material'=>'required',
            'note'=>'required',
            'shipment_number'=>'required',
            'introduction'=>'required',
            'status'=>'required',
            'amount'=>'required',
            'product_type_id'=>'required',
            'producer_id'=>'required',
        ]);
        if($validator->fails())
        {
            return response()->json(['error'=>$validator->errors()->all(),400]);
        }
        $data=ProductModel::find($id);
        $data->name = $request->name;
        $data->size = $request->size;
        $data->origin = $request->origin;
        $data->material = $request->material;
        $data->note = $request->note;
        $data->status = $request->status;
        $data->status = $request->status;
        $data->status = $request->status;
        $data->status = $request->status;
        $data->status = $request->status;
        $data->status = $request->status;
        if($request->hasFile('image'))
        {
            $img=$request->image;
            $img_name=time().'-'.$img->getClientOriginalName();
            Image::make($img)->save(storage_path("app/public/".$img_name));
            $data->image=$img_name;
        }
        if($data->save())
        {
            return response()->json([
                "data"=>$data,
                "msg"=>"Create product successfully"
            ],201);
        }
        else{
            return response()->json([
                "data"=>null,
                "msg"=>"Create product fails"
            ],400);
        }
    }

    public function deleteProduct($id)
    {
        $product = ProductModel::find($id);
        if(is_null($product)){
            return response()->json(['message'=>'Xóa sản phẩm không thành công!'], 404);
        }
        else
        {
            return response()->json(['message'=>'Xóa sản phẩm thành công!'], 404);
        }
        $product->delete();
        return response()->json(null,204);
    }
}
