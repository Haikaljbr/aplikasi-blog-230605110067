<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Blog Kami')</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --header-bg : #2C3E50;
            --accent     : #27ae60;
            --accent-h   : #219150;
            --text-muted : #6c757d;
            --border     : #e9ecef;
            --card-radius: 10px;
        }

        body {
            background-color: #f0f2f5;
            font-size: 14px;
            color: #212529;
        }

        /* ── Navbar ── */
        .guest-navbar {
            background-color: var(--header-bg);
            padding: 14px 0;
        }

        .guest-navbar .brand-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: #ffffff;
            text-decoration: none;
            line-height: 1.1;
        }

        .guest-navbar .brand-sub {
            font-size: 11px;
            color: #aaaaaa;
            display: block;
            margin-top: 2px;
        }

        .guest-navbar .nav-link {
            color: #cccccc;
            font-size: 13px;
            padding: 4px 10px;
            transition: color .15s;
        }

        .guest-navbar .nav-link:hover,
        .guest-navbar .nav-link.active {
            color: #ffffff;
        }

        .guest-navbar .btn-login {
            background-color: var(--accent);
            color: #fff;
            font-size: 12px;
            padding: 5px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            transition: background .15s;
        }

        .guest-navbar .btn-login:hover {
            background-color: var(--accent-h);
            color: #fff;
        }

        /* ── Artikel card ── */
        .artikel-card {
            background: #fff;
            border-radius: var(--card-radius);
            box-shadow: 0 2px 10px rgba(0,0,0,.06);
            overflow: hidden;
            margin-bottom: 28px;
            border: none;
        }

        .artikel-card img.cover {
            width: 100%;
            height: 260px;
            object-fit: cover;
        }

        .artikel-card .card-body {
            padding: 20px 22px 24px;
        }

        .badge-kategori {
            background-color: #e8f5e9;
            color: #2e7d32;
            font-size: 11px;
            font-weight: 600;
            padding: 3px 10px;
            border-radius: 20px;
            display: inline-block;
            margin-bottom: 10px;
            text-decoration: none;
        }

        .badge-kategori:hover {
            background-color: #c8e6c9;
            color: #1b5e20;
        }

        .artikel-card h2 {
            font-size: 1.25rem;
            font-weight: 700;
            color: #1a1a2e;
            margin-bottom: 8px;
            line-height: 1.35;
        }

        .artikel-card h2 a {
            text-decoration: none;
            color: inherit;
        }

        .artikel-card h2 a:hover {
            color: var(--accent);
        }

        .meta-penulis {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 12px;
        }

        .avatar-circle {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: var(--accent);
            color: #fff;
            font-size: 13px;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .meta-penulis .nama {
            font-size: 13px;
            font-weight: 600;
            color: #333;
        }

        .meta-penulis .tanggal {
            font-size: 12px;
            color: var(--text-muted);
        }

        .artikel-excerpt {
            font-size: 13.5px;
            line-height: 1.7;
            color: #444;
            text-align: justify;
            margin-bottom: 18px;
        }

        .btn-baca {
            background-color: var(--accent);
            color: #fff;
            font-size: 13px;
            font-weight: 600;
            padding: 8px 20px;
            border-radius: 20px;
            text-decoration: none;
            display: inline-block;
            transition: background .15s;
        }

        .btn-baca:hover {
            background-color: var(--accent-h);
            color: #fff;
        }

        /* ── Sidebar widget ── */
        .widget-card {
            background: #fff;
            border-radius: var(--card-radius);
            box-shadow: 0 2px 10px rgba(0,0,0,.06);
            padding: 20px;
            margin-bottom: 20px;
        }

        .widget-card h5 {
            font-size: 1rem;
            font-weight: 700;
            color: #1a1a2e;
            margin-bottom: 16px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--border);
        }

        .kategori-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 9px 12px;
            border-radius: 7px;
            margin-bottom: 4px;
            text-decoration: none;
            color: #555;
            font-size: 13px;
            font-weight: 500;
            transition: background .15s, color .15s;
        }

        .kategori-item:hover {
            background-color: #f0f7f2;
            color: var(--accent);
        }

        .kategori-item.active {
            background-color: var(--accent);
            color: #fff;
            font-weight: 600;
        }

        .kategori-item .badge-count {
            background-color: rgba(0,0,0,.08);
            color: inherit;
            font-size: 11px;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 20px;
            min-width: 28px;
            text-align: center;
        }

        .kategori-item.active .badge-count {
            background-color: rgba(255,255,255,.25);
        }

        /* ── Artikel terkait widget ── */
        .terkait-item {
            display: flex;
            gap: 12px;
            margin-bottom: 14px;
            text-decoration: none;
            color: inherit;
        }

        .terkait-item:last-child { margin-bottom: 0; }

        .terkait-item img {
            width: 64px;
            height: 50px;
            object-fit: cover;
            border-radius: 6px;
            flex-shrink: 0;
            border: 1px solid var(--border);
        }

        .terkait-item .terkait-judul {
            font-size: 12.5px;
            font-weight: 600;
            color: #333;
            line-height: 1.4;
            margin-bottom: 4px;
        }

        .terkait-item:hover .terkait-judul {
            color: var(--accent);
        }

        .terkait-item .terkait-tanggal {
            font-size: 11px;
            color: var(--text-muted);
        }

        /* ── Breadcrumb ── */
        .breadcrumb-wrap {
            margin-bottom: 18px;
            font-size: 13px;
        }

        .breadcrumb-wrap a {
            color: var(--accent);
            text-decoration: none;
        }

        .breadcrumb-wrap a:hover { text-decoration: underline; }
        .breadcrumb-wrap span { color: var(--text-muted); }

        /* ── Detail artikel ── */
        .detail-cover {
            width: 100%;
            max-height: 400px;
            object-fit: cover;
            border-radius: 10px 10px 0 0;
        }

        .detail-body {
            background: #fff;
            border-radius: 0 0 var(--card-radius) var(--card-radius);
            padding: 24px 28px 32px;
            box-shadow: 0 2px 10px rgba(0,0,0,.06);
        }

        .detail-body h1 {
            font-size: 1.6rem;
            font-weight: 700;
            color: #1a1a2e;
            margin-bottom: 14px;
            line-height: 1.3;
        }

        .detail-isi {
            font-size: 14.5px;
            line-height: 1.85;
            color: #333;
            text-align: justify;
        }

        .detail-isi p { margin-bottom: 1rem; }

        /* ── Footer ── */
        .guest-footer {
            background-color: var(--header-bg);
            color: #aaaaaa;
            text-align: center;
            padding: 20px;
            font-size: 12px;
            margin-top: 48px;
        }

        /* ── Main area ── */
        .main-wrap {
            padding: 32px 0 0;
        }
    </style>
</head>
<body>

<!-- ══ NAVBAR ══════════════════════════════════ -->
<nav class="guest-navbar">
    <div class="container d-flex justify-content-between align-items-center">
        <a href="{{ route('guest.beranda') }}" class="brand-title">
            Blog Kami
            <span class="brand-sub">Artikel terbaru seputar teknologi dan pemrograman</span>
        </a>
        <div class="d-flex align-items-center gap-3">
            <a href="{{ route('guest.beranda') }}"
               class="nav-link {{ request()->routeIs('guest.beranda') && !request()->filled('kategori_id') ? 'active' : '' }}">
                Beranda
            </a>
            <a href="{{ route('guest.beranda', ['kategori_id' => '']) }}"
               class="nav-link">
                Artikel
            </a>
            <a href="#" class="nav-link">Tentang</a>

            {{-- Cek dua guard: admin atau penulis --}}
            @if(Auth::guard('admin')->check() || Auth::guard('web')->check())
                <a href="{{ route('dashboard') }}" class="btn-login">Dashboard</a>
                <form action="{{ route('logout') }}" method="POST" class="mb-0">
                    @csrf
                    <button type="submit"
                            style="font-size:12px; font-weight:600; color:#f5c6c6; background:transparent; border:1px solid rgba(255,255,255,0.25); border-radius:6px; padding:5px 14px; cursor:pointer; transition:background .15s;"
                            onmouseover="this.style.background='rgba(255,255,255,0.1)'"
                            onmouseout="this.style.background='transparent'">
                        Keluar
                    </button>
                </form>
            @else
                <a href="{{ route('login') }}" class="btn-login">Login</a>
            @endif
        </div>
    </div>
</nav>

<!-- ══ CONTENT ══════════════════════════════════ -->
<div class="main-wrap">
    <div class="container">
        @yield('content')
    </div>
</div>

<!-- ══ FOOTER ══════════════════════════════════ -->
<footer class="guest-footer">
    &copy; {{ date('Y') }} Blog Kami. Seluruh hak cipta dilindungi.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
