<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
| ->middleware('auth');
|
*/

Route::get('/', function () {
    return view('Home');
})->name('Home');

Route::get('/Contatti', function () {
    return view('Contatti');
})->name('Contatti');


Route::get('/Su-di-noi', function () {
    return view('Su-di-noi');
})->name('Su-di-noi');


Route::get('/Campo-estivo/Esplora', function () {
    return view('Campo-estivo/Esplora');
})->name('Esplora');

Route::get('/Campo-estivo/Iscrizione-campo', function () {
    return view('Campo-estivo/Iscrizione-campo');
})->name('Iscrizione-campo')->middleware('auth');

Route::get('/Campo-estivo/Iscrizione-campo-Vol', function () {
    return view('Campo-estivo/Iscrizione-campo-Vol');
})->name('Iscrizione-campo-Vol')->middleware('auth');

Route::get('/Campo-estivo/ScegliRuolo', function () {
    return view('Campo-estivo/ScegliRuolo');
})->name('ScegliRuolo')->middleware('auth');

Route::get('/Campo-estivo/UserPage', function () {
    $leads = DB::table('person')->get();
	return View::make('/Campo-estivo/UserPage')->with('data', $leads);
	
})->name('UserPage')->middleware('auth');

Route::get('/Campo-estivo/HomeCampo', function () {
    return view('Campo-estivo/HomeCampo');
})->name('HomeCampo');

Route::post("/Campo-estivo/Iscrizione-campo", [\App\Http\Controllers\IscrizioneOspController::class, 'QueryAllData'])->name('QueryAllData');


