<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Model\UsersModel;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    //post method
    public function register(Request $request)
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
        $user->password = bcrypt($request->password);
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
}
