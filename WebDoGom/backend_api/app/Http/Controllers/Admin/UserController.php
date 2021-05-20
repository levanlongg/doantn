<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
//use App\User;
use App\Model\UsersModel;
use App\Model\RoleMasterModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    //get method
    public function userslist()
    {
        return response()->json(UsersModel::get(),200);
    }
    //get method by id
    public function usersById($id)
    {
        return response()->json(UsersModel::find($id),200);
    }
    // post method
    public function usersSave(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' =>'required',
            'address' =>'required',
            'phone' =>'required',
            'email' =>'required',
            'password' =>'required',
            'role_id' =>'required',
            'image' =>'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()->all(), 400]);
        } 
        $user = new UsersModel();
        $user->name = $request->name;
        $user->address = $request->address;
        $user->phone = $request->phone;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->role_id = $request->role_id;
        $user->image = $request->image;
        // $get_image1 = $request->file('image');
        // if ($get_image1) {
        //     $get_new_image1 = $get_image1->getClientOriginalName();
        //     $name_image1 = current(explode('.', $get_new_image1));
        //     $new_image1 = $name_image1 . '.' . $get_image1->getClientOriginalExtension();
        //     $get_image1->move(base_path() . '/public/image/', $new_image1);
        //     $user->image = $new_image1;
        //     $user->save();
        //     return response()->json(['message'=>'Thêm thành công'], 201);
        // }
        // $user->image ='0';
        
        if($user->save())
        {
            return response()->json([
                "data"=>$user,
                "msg"=>"Create user successfully"
            ],201);
        }
        else{
            return response()->json([
                "data"=>null,
                "msg"=>"Create user fails"
            ],400);
        }
    }
    //update method
    public function usersUpdate(Request $request, $id)
    {
        // $producttype = UsersModel::find($id);
        // if(is_null($producttype)){
        //     return response()->json(['message'=>'Chưa cập nhật loại sản phẩm!'], 404);
        // }
        // $producttype->update($request->all());
        // return response()->json($producttype,200);
        $result = DB::table('users')->where('id', $id)->update([
        'name' => $request->name,
        'address' => $request->address,
        'phone' => $request->phone,
        'email' => $request->email,
        'password' => $request->password,
        'role_id' => $request->role_id,
        'image' => $request->image,
        ]);
        return response()->json($result,200);
    }
    //delete method
    public function usersDelete($id)
    {
        $user = UsersModel::find($id);
        if(is_null($user)){
            return response()->json(['message'=>'Xóa người dùng không thành công!'], 404);
        }
        $user->delete();
        return response()->json(null,204);
    }

    public function search($name)
    {
        return UsersModel::where("name","like","%".$name."%")
                        ->orwhere("phone","like","%".$name."%")
                        ->orwhere("email","like","%".$name."%")->get();
    }

    //Quyền người dùng
    public function rolelist()
    {
        return response()->json(RoleMasterModel::get(),200);
    }
    //get method by id
    public function roleById($id)
    {
        $producttype = RoleMasterModel::find($id);
        if(is_null($producttype)){
            return response()->json(['message'=>'Loại sản phẩm cần tìm không tồn tại!'], 404);
        }
        return response()->json($producttype,200);
    }
    //post method
    public function roleSave(Request $request)
    {
        $rules = [
            'name'=>'required',
        ];
        $validator= Validator::make($request->all(),$rules);
        if($validator->fails())
        {
           return response()->json($validator->errors(),400);
        }
        $role=RoleMasterModel::create($request->all());
        return response()->json($role,201);
    }
    //update method
    public function roleUpdate(Request $request, $id)
    {
        $producttype = RoleMasterModel::find($id);
        if(is_null($producttype)){
            return response()->json(['message'=>'Chưa cập nhật loại sản phẩm!'], 404);
        }
        $producttype->update($request->all());
        return response()->json($producttype,200);
    }
    //delete method
    public function roleDelete($id)
    {
        $producttype = RoleMasterModel::find($id);
        if(is_null($producttype)){
            return response()->json(['message'=>'Xóa loại sản phẩm không thành công!'], 404);
        }
        $producttype->delete();
        return response()->json(null,204);
    }
    

    
}
