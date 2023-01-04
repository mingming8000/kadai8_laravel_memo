<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// 230103_1423 sec46消してしまう
// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

// 230103_1423 この１行を追加。
Route::get('/', [HomeController::class, 'index'])->name('index');

Route::get('/home', [HomeController::class, 'index'])->name('home');
//230102 23:40 sec34 06:23辺り、postの前にgetを置いてみた　https://qiita.com/kuroudoart/items/44eca2150f102ba7fdb4
//230102 24:19 sec35開始時点で、コメントアウトしたが、問題ない模様。
//Route::get('/store', [HomeController::class, 'store'])->name('store');

Route::post('/store', [HomeController::class, 'store'])->name('store');
Route::get('/edit/{id}', [HomeController::class, 'edit'])->name('edit');
Route::post('/update', [HomeController::class, 'update'])->name('update');
Route::post('/destroy', [HomeController::class, 'destroy'])->name('destroy');
