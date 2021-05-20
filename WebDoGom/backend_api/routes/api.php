<?php

use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\NewsTypeController;
use App\Http\Controllers\Admin\ProducerController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProductTypeController;
use App\Http\Controllers\Admin\Rolemaster;
use App\Http\Controllers\Admin\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

//register
Route::post('register','Auth\RegisterController@register');
//login
Route::post('login','Auth\LoginController@login');
//refres_token
Route::post('refresh_token','Auth\LoginController@refreshToken');
//delete_token
Route::delete('delete_token','Auth\LoginController@deleteToken');
//producer
Route::get('producer','Admin\ProducerController@producer');
Route::get('producer/{id}','Admin\ProducerController@producerById');
Route::post('producer','Admin\ProducerController@producerSave');
Route::put('producer/{id}','Admin\ProducerController@producerUpdate');
Route::delete('producer/{producer}','Admin\ProducerController@producerDelete');
Route::get('searchproducer/{name}',[ProducerController::class,'search']);

//category
Route::get('category','Admin\CategoryController@category');
Route::get('category/{id}','Admin\CategoryController@categoryById');
Route::post('category','Admin\CategoryController@categorySave');
Route::put('category/{id}','Admin\CategoryController@categoryUpdate');
Route::delete('category/{category}','Admin\CategoryController@categoryDelete');
Route::get('searchca/{name}',[CategoryController::class,'search']);
//contact
Route::get('contact','Admin\ContactController@contact');
Route::get('contact/{id}','Admin\ContactController@contactById');
Route::post('contact','Admin\ContactController@contactSave');
Route::put('contact/{id}','Admin\ContactController@contactUpdate');
Route::delete('contact/{contact}','Admin\ContactController@contactDelete');
Route::get('searchcontact/{name}',[ContactController::class,'search']);
//Introduction
Route::get('introduction','Admin\IntroductionController@introduction');
Route::get('introduction/{id}','Admin\IntroductionController@introductionById');
Route::post('introduction','Admin\IntroductionController@introductionSave');
Route::put('introduction/{id}','Admin\IntroductionController@introductionUpdate');
Route::delete('introduction/{introduction}','Admin\IntroductionController@introductionDelete');
//news
Route::get('news','Admin\NewsController@news');
Route::get('news/{id}','Admin\NewsController@newsById');
Route::post('news','Admin\NewsController@newsSave');
Route::put('news/{id}','Admin\NewsController@newsUpdate');
Route::delete('news/{news}','Admin\NewsController@newsDelete');
//newtype
Route::get('newstype','Admin\NewsTypeController@newstype');
Route::get('newstype/{id}','Admin\NewsTypeController@newstypeById');
Route::post('newstype','Admin\NewsTypeController@newstypeSave');
Route::put('newstype/{id}','Admin\NewsTypeController@newstypeUpdate');
Route::delete('newstype/{newstype}','Admin\NewsTypeController@newstypeDelete');
Route::get('search/{name}',[NewsTypeController::class,'search']);
//customer
Route::get('customer','Admin\CustomerController@customer');
Route::get('customer/{id}','Admin\CustomerController@customerById');
Route::post('customer','Admin\CustomerController@customerSave');
Route::put('customer/{id}','Admin\CustomerController@customerUpdate');
Route::delete('customer/{producer}','Admin\CustomerController@customerDelete');
//product
Route::get('product','Admin\ProductController@product');
Route::get('product/{id}','Admin\ProductController@productById');
Route::post('product','Admin\ProductController@saveProduct');
Route::put('product/{id}','Admin\ProductController@updateProduct');
Route::delete('product/{product}','Admin\ProductController@productDelete');
Route::get('searchproduct/{name}',[ProductController::class,'search']);

//producttype
Route::get('producttype','Admin\ProductTypeController@producttype');
Route::get('producttype/{id}','Admin\ProductTypeController@producttypeById');
Route::post('producttype','Admin\ProductTypeController@producttypeSave');
Route::put('producttype/{id}','Admin\ProductTypeController@producttypeUpdate');
Route::delete('producttype/{producttype}','Admin\ProductTypeController@producttypeDelete');
Route::get('searchproducttype/{name}',[ProductTypeController::class,'search']);
//rolemaster
Route::get('role','Admin\UserController@rolelist');
Route::get('role/{id}','Admin\UserController@roleById');
Route::post('role','Admin\UserController@roleSave');
Route::put('role/{id}','Admin\UserController@roleUpdate');
Route::delete('role/{role}','Admin\UserController@roleDelete');
//bill_import
Route::get('bill_import','Admin\BillImportController@bill_import');
Route::get('bill_import/{id}','Admin\BillImportController@bill_importById');
Route::post('bill_import','Admin\BillImportController@bill_importSave');
Route::put('bill_import/{id}','Admin\BillImportController@bill_importUpdate');
Route::delete('bill_import/{bill_import}','Admin\BillImportController@bill_importDelete');
//user
Route::get('users','Admin\UserController@userslist');
Route::get('users/{id}','Admin\UserController@usersById');
Route::post('users','Admin\UserController@usersSave');
Route::put('users/{id}','Admin\UserController@usersUpdate');
Route::delete('users/{users}','Admin\UserController@usersDelete');
Route::get('searchuser/{name}',[UserController::class,'search']);
//oder
Route::get('order','Admin\OrderController@order');
Route::get('order/{id}','Admin\OrderController@orderById');
Route::put('order/{id}','Admin\OrderController@orderUpdate');
Route::delete('order/{order}','Admin\OrderController@orderDelete');



// Route::group(['middleware'=>'auth:api'],function(){
//     Route::apiResource('producer','producer');
// });
// Route::apiResource('producer','ProducerController@producer');
// Route::get('file/producer_list','FileController@producerList');
// Route::post('file/producer_list','FileController@producerSave');

