<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AuthAnyMiddleware
{
    /**
     * Izinkan request jika sudah login di guard 'admin' ATAU guard 'web'.
     * Jika tidak, redirect ke halaman login.
     */
    public function handle(Request $request, Closure $next): Response
    {
        $adminCheck = Auth::guard('admin')->check();
        $webCheck = Auth::guard('web')->check();

        \Log::info('Auth check', [
            'admin' => $adminCheck,
            'web' => $webCheck,
            'session' => session()->all(),
        ]);

        if ($adminCheck || $webCheck) {
            return $next($request);
        }

        return redirect()->route('login');
    }
}
