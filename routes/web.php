<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\SalidaController;
use App\Http\Controllers\EntradaController;
use App\Http\Controllers\ProductoController;
use App\Http\Controllers\RemitenteController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\DestinatarioController;
use App\Http\Controllers\ConsultaController;

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [HomeController::class, 'index'])->name('home');

Route::prefix('/')
    ->middleware('auth')
    ->group(function () {
        Route::resource('roles', RoleController::class);
        Route::resource('permissions', PermissionController::class);


        Route::resource('users', UserController::class);
        Route::resource('productos', ProductoController::class);
        Route::resource('remitentes', RemitenteController::class);
        Route::resource('entradas', EntradaController::class);
        Route::resource('destinatarios', DestinatarioController::class);
        Route::resource('salidas', SalidaController::class);
        Route::resource('reporte',ConsultaController::class);
        Route::get('seleccionar_producto', [ConsultaController::class, 'index'])->name('seleccionar_producto');
        Route::post('/mostrar-datos', [ConsultaController::class, 'mostrarDatos'])->name('mostrar_datos');
    });
