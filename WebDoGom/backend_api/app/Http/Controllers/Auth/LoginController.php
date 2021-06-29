<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\SessionUser;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        
        $datacheckLogin=[
            'email'=> $request->email,
            'password'=>$request->password,
            'role_id'=>3,
        ];
        //dd(Auth::attempt($datacheckLogin));
        //Xac thuc user co tai khoan
        if(Auth::attempt($datacheckLogin)){
            $checkTokenExit=SessionUser::where('user_id',auth()->id())->first();
            if(empty($checkTokenExit))
            {
                $userSession=SessionUser::create([
                    'token'=>Str::random(40),
                    'refresh_token'=>Str::random(40),
                    'token_expried'=>date('Y-m-d H:i:s', strtotime('+30 day')),
                    'refresh_token_expried'=>date('Y-m-d H:i:s', strtotime('+365 day')),
                    'user_id'=>auth()->id()
                ]);
            }
            else{
                $userSession=$checkTokenExit;
            }
            return response()->json([
                'code'=>200,
                'data'=>$userSession,
            ],200);
        }
    }

    public function signin(Request $request)
    {
        
        $datacheckLogin=[
            'email'=> $request->email,
            'password'=>$request->password,
        ];
        //dd(Auth::attempt($datacheckLogin));
        //Xac thuc user co tai khoan
        if(Auth::attempt($datacheckLogin)){
            $checkTokenExit=SessionUser::where('user_id',auth()->id())->first();
            if(empty($checkTokenExit))
            {
                $userSession=SessionUser::create([
                    'token'=>Str::random(40),
                    'refresh_token'=>Str::random(40),
                    'token_expried'=>date('Y-m-d H:i:s', strtotime('+30 day')),
                    'refresh_token_expried'=>date('Y-m-d H:i:s', strtotime('+365 day')),
                    'user_id'=>auth()->id()
                ]);
            }
            else{
                $userSession=$checkTokenExit;
            }
            return response()->json([
                'code'=>200,
                'data'=>$userSession,
            ],200);
        }
    }

    public function refreshToken(Request $request)
    {
        $token=$request->header('token');
        $checkTokenIsValid=SessionUser::where('token',$token)->first();
        if(!empty($checkTokenIsValid))
        {
            if($checkTokenIsValid->token_expried<time())
            {
                $checkTokenIsValid->update([
                    'token'=>Str::random(40),
                    'refresh_token'=>Str::random(40),
                    'token_expried'=>date('Y-m-d H:i:s', strtotime('+30 day')),
                    'refresh_token_expried'=>date('Y-m-d H:i:s', strtotime('+365 day')),
                ]);
                $dataSession=SessionUser::find($checkTokenIsValid->id());
                return response()->json([
                    'code'=>200,
                    'data'=>$dataSession,
                    'message'=>'Đã cập nhật lại mã token'
                ],200);
            }
        }
    }
    public function deleteToken(Request $request)
    {
        $token=$request->header('token');
        $checkTokenIsValid=SessionUser::where('token',$token)->first();
        if(!empty($checkTokenIsValid))
        {
            $checkTokenIsValid->delete();
            return response()->json([
                'code'=>200,
                'message'=>'Đã xóa mã token'
            ],200);
        }
    }
}
