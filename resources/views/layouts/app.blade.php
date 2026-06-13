<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title', 'Sistem Manajemen Blog')</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f4f9;
            font-size: 14px;
        }
        .header {
            background-color: #2C3E50;
            color: #ffffff;
            padding: 12px 20px;
        }
        .header-title {
            font-size: 15px;
            font-weight: 500;
            margin: 0;
        }
        .header-sub {
            font-size: 11px;
            color: #aaaaaa;
            margin: 0;
        }
        .sidebar {
            width: 210px;
            min-height: calc(100vh - 52px);
            background-color: #ffffff;
            border-right: 1px solid #f0f0f0;
            padding: 16px 0;
            flex-shrink: 0;
        }
        .avatar-area {
            padding: 0 14px 16px;
            border-bottom: 1px solid #f0f0f0;
            margin-bottom: 12px;
        }
        .avatar-circle {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #e9ecef;
            margin-bottom: 8px;
        }
        .avatar-greeting {
            font-size: 11px;
            color: #868e96;
            margin: 0;
        }
        .avatar-name {
            font-size: 13px;
            font-weight: 500;
            color: #212529;
            margin: 0;
        }
        .sidebar-label {
            font-size: 10px;
            color: #adb5bd;
            padding: 0 14px 8px;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            font-weight: 600;
        }
        .nav-item {
            padding: 9px 14px;
            font-size: 13px;
            color: #555555;
            border-left: 2px solid transparent;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }
        .nav-item:hover {
            background-color: #f4f4f9;
            color: #333333;
        }
        .nav-item.active {
            background-color: #e8f5e9;
            color: #2e7d32;
            border-left-color: #4CAF50;
            font-weight: 600;
        }
        .sidebar-section-label {
            font-size: 10px;
            color: #ced4da;
            padding: 12px 14px 4px;
            text-transform: uppercase;
            letter-spacing: 0.06em;
            font-weight: 600;
        }
        .sidebar-bottom {
            padding: 12px 14px 0;
            border-top: 1px solid #f0f0f0;
            margin-top: auto;
        }
        .main-content {
            flex: 1;
            padding: 24px;
        }
        .role-badge {
            display: inline-block;
            font-size: 9px;
            font-weight: 700;
            padding: 1px 6px;
            border-radius: 10px;
            text-transform: uppercase;
            letter-spacing: .04em;
        }
        .role-badge.admin   { background: #fff3cd; color: #856404; }
        .role-badge.penulis { background: #e3f2fd; color: #1565c0; }
    </style>
</head>
<body>
    <div class="header d-flex align-items-center justify-content-between">
        <div>
            <p class="header-title">Sistem Manajemen Blog (CMS)</p>
            <p class="header-sub">db_blog</p>
        </div>
        <div class="d-flex align-items-center gap-3">
            <a href="{{ route('guest.beranda') }}"
               style="font-size:11px; color:#aaa; text-decoration:none;"
               title="Lihat halaman publik">
                ← Halaman Publik
            </a>
            <form action="{{ route('logout') }}" method="POST" class="mb-0">
                @csrf
                <button type="submit"
                        style="font-size:11px; color:#f5c6c6; background:transparent; border:1px solid #4a5568; border-radius:5px; padding:3px 10px; cursor:pointer; transition:background .15s;"
                        onmouseover="this.style.background='rgba(255,255,255,0.1)'"
                        onmouseout="this.style.background='transparent'">
                    Keluar
                </button>
            </form>
        </div>
    </div>

    <div class="d-flex">
        <div class="sidebar d-flex flex-column">

            {{-- ══ Avatar / info pengguna ══ --}}
            <div class="avatar-area">
                @if(Auth::guard('admin')->check())
                    {{-- Admin: tidak punya foto, tampilkan inisial --}}
                    @php $adminUser = Auth::guard('admin')->user(); @endphp
                    <img src="https://ui-avatars.com/api/?name=Admin&background=856404&color=fff&size=48"
                         alt="Admin"
                         class="avatar-circle">
                    <p class="avatar-greeting">Halo,</p>
                    <p class="avatar-name">{{ $adminUser->username }}</p>
                    <span class="role-badge admin">Admin</span>
                @else
                    {{-- Penulis --}}
                    @php $penulisUser = Auth::guard('web')->user(); @endphp
                    <img src="{{ asset('storage/foto/' . $penulisUser->foto) }}"
                         alt="Foto Profil"
                         class="avatar-circle"
                         onerror="this.src='https://ui-avatars.com/api/?name={{ urlencode($penulisUser->nama_depan) }}&background=27ae60&color=fff&size=48'">
                    <p class="avatar-greeting">Halo,</p>
                    <p class="avatar-name">
                        {{ $penulisUser->nama_depan }} {{ $penulisUser->nama_belakang }}
                    </p>
                    <span class="role-badge penulis">Penulis</span>
                @endif
            </div>

            <div class="sidebar-label">Menu Utama</div>

            <a href="{{ route('dashboard') }}"
               class="nav-item {{ request()->routeIs('dashboard') ? 'active' : '' }}">
                Dashboard
            </a>

            <a href="{{ route('artikel.index') }}"
               class="nav-item {{ request()->routeIs('artikel.*') ? 'active' : '' }}">
                Kelola Artikel
            </a>

            {{-- Menu Penulis & Kategori: hanya tampil untuk admin --}}
            @if(Auth::guard('admin')->check())
                <div class="sidebar-section-label">Admin</div>

                <a href="{{ route('penulis.index') }}"
                   class="nav-item {{ request()->routeIs('penulis.*') ? 'active' : '' }}">
                    Kelola Penulis
                </a>

                <a href="{{ route('kategori.index') }}"
                   class="nav-item {{ request()->routeIs('kategori.*') ? 'active' : '' }}">
                    Kelola Kategori
                </a>
            @endif

            <div class="sidebar-bottom mt-auto">
                <form action="{{ route('logout') }}" method="POST">
                    @csrf
                    <button type="submit"
                            class="btn btn-sm w-100"
                            style="background-color:#fff0f0; color:#c0392b; border:1px solid #f5c6c6;">
                        Keluar
                    </button>
                </form>
            </div>
        </div>

        <div class="main-content">
            @if(session('sukses'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('sukses') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            @endif

            @if(session('gagal'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    {{ session('gagal') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            @endif

            @yield('content')
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
