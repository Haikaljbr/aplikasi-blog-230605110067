<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function index()
    {
        return view('login.index');
    }

    /**
     * Proses login:
     * 1. Coba guard 'admin' (tabel admin, kolom: username)
     * 2. Jika gagal, coba guard 'web' (tabel penulis, kolom: user_name)
     * 3. Jika keduanya gagal, kembalikan error
     */
    public function proses(Request $request)
    {
        $username = $request->user_name;
        $password = $request->password;

        /* ── Coba login sebagai Admin ── */
        $kredensialAdmin = [
            'username' => $username,
            'password' => $password,
        ];

        if (Auth::guard('admin')->attempt($kredensialAdmin)) {
            $request->session()->regenerate();
            $request->session()->put('role', 'admin');
            $request->session()->put(
                'waktu_login',
                now()->timezone('Asia/Jakarta')
                    ->locale('id')
                    ->isoFormat('dddd, D MMMM Y | HH:mm')
            );
            return redirect()->route('dashboard');
        }

        /* ── Coba login sebagai Penulis ── */
        $kredensialPenulis = [
            'user_name' => $username,
            'password'  => $password,
        ];

        if (Auth::guard('web')->attempt($kredensialPenulis)) {
            $request->session()->regenerate();
            $request->session()->put('role', 'penulis');
            $request->session()->put(
                'waktu_login',
                now()->timezone('Asia/Jakarta')
                    ->locale('id')
                    ->isoFormat('dddd, D MMMM Y | HH:mm')
            );
            return redirect()->route('dashboard');
        }

        /* ── Keduanya gagal ── */
        return back()->withErrors([
            'gagal' => 'Username atau password salah.',
        ]);
    }

    public function logout(Request $request)
    {
        /* Logout dari kedua guard sekaligus */
        Auth::guard('admin')->logout();
        Auth::guard('web')->logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}
