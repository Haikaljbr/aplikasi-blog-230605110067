<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function index()
    {
        /* ── Admin ── */
        if (Auth::guard('admin')->check()) {
            $admin = Auth::guard('admin')->user();
            $data = [
                'nama_lengkap' => 'Administrator (' . $admin->username . ')',
                'foto'         => null,          // tabel admin tidak punya kolom foto
                'waktu_login'  => session('waktu_login', '-'),
                'role'         => 'admin',
            ];
            return view('dashboard.index', $data);
        }

        /* ── Penulis ── */
        $pengguna = Auth::guard('web')->user();
        $data = [
            'nama_lengkap' => $pengguna->nama_depan . ' ' . $pengguna->nama_belakang,
            'foto'         => $pengguna->foto ?? 'default.png',
            'waktu_login'  => session('waktu_login', '-'),
            'role'         => 'penulis',
        ];
        return view('dashboard.index', $data);
    }
}
