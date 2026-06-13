<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ArtikelController;
use App\Http\Controllers\PenulisController;
use App\Http\Controllers\KategoriArtikelController;
use App\Http\Controllers\GuestController;

/* ════════════════════════════════════════════════
   HALAMAN PENGUNJUNG (GUEST) — tanpa auth
════════════════════════════════════════════════ */
Route::get('/', [GuestController::class, 'beranda'])->name('guest.beranda');
Route::get('/blog/{id}', [GuestController::class, 'detail'])->name('guest.detail');

/* ════════════════════════════════════════════════
   AUTENTIKASI
════════════════════════════════════════════════ */
Route::get('/login', [LoginController::class, 'index'])
    ->name('login')
    ->middleware('guest');

Route::post('/login', [LoginController::class, 'proses'])
    ->name('login.proses')
    ->middleware('guest');

Route::post('/logout', [LoginController::class, 'logout'])
    ->name('logout');

/* ════════════════════════════════════════════════
   AREA CMS — dilindungi auth (web ATAU admin)
════════════════════════════════════════════════ */
Route::middleware(['auth.any'])->group(function () {

    /* Dashboard — semua yang sudah login */
    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->name('dashboard');

    /* ── Artikel: penulis hanya kelola miliknya, admin kelola semua ── */
    Route::resource('artikel', ArtikelController::class)
        ->except(['show']);

    /* ── Penulis & Kategori: hanya admin ── */
    Route::middleware('admin')->group(function () {
        Route::resource('penulis', PenulisController::class)
            ->except(['show']);
        Route::resource('kategori', KategoriArtikelController::class)
            ->except(['show']);
    });
});

/* Redirect /cms ke dashboard */
Route::get('/cms', function () {
    return redirect()->route('dashboard');
})->middleware('auth.any');
