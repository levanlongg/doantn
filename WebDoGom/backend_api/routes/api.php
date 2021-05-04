<?php

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
//category
Route::get('category','Admin\CategoryController@category');
Route::get('category/{id}','Admin\CategoryController@categoryById');
Route::post('category','Admin\CategoryController@categorySave');
Route::put('category/{id}','Admin\CategoryController@categoryUpdate');
Route::delete('category/{category}','Admin\CategoryController@categoryDelete');
//contact
Route::get('contact','Admin\ContactController@contact');
Route::get('contact/{id}','Admin\ContactController@contactById');
Route::post('contact','Admin\ContactController@contactSave');
Route::put('contact/{id}','Admin\ContactControllerr@contactUpdate');
Route::delete('contact/{contact}','Admin\ContactController@contactDelete');
//Introduction
Route::get('introduction','Admin\IntroductionController@introduction');
Route::get('introduction/{id}','Admin\IntroductionController@introductionById');
Route::post('introduction','Admin\IntroductionController@introductionSave');
Route::put('introduction/{id}','Admin\IntroductionControllerr@introductionUpdate');
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
Route::put('product/{id}','Admin\ProductController@productUpdate');
Route::delete('product/{product}','Admin\ProductController@productDelete');
//producttype
Route::get('producttype','Admin\ProductTypeController@producttype');
Route::get('producttype/{id}','Admin\ProductTypeController@producttypeById');
Route::post('producttype','Admin\ProductTypeController@producttypeSave');
Route::put('producttype/{id}','Admin\ProductTypeController@producttypeUpdate');
Route::delete('producttype/{producttype}','Admin\ProductTypeController@producttypeDelete');
//bill_import
Route::get('bill_import','Admin\BillImportController@bill_import');
Route::get('bill_import/{id}','Admin\BillImportController@bill_importById');
Route::post('bill_import','Admin\BillImportController@bill_importSave');
Route::put('bill_import/{id}','Admin\BillImportController@bill_importUpdate');
Route::delete('bill_import/{bill_import}','Admin\BillImportController@bill_importDelete');
//user
Route::get('users','Admin\UserController@users');
Route::get('users/{id}','Admin\UserController@usersById');
Route::put('users/{id}','Admin\UserController@usersUpdate');
Route::delete('users/{users}','Admin\UserController@usersDelete');
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

