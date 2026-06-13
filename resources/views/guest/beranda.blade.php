@extends('layouts.guest')

@section('title', $kategoriAktif ? $kategoriAktif->nama_kategori . ' — Blog Kami' : 'Blog Kami')

@section('content')
<div class="row g-4">

    <!-- ══ KOLOM KIRI: Artikel ══════════════════════════════════ -->
    <div class="col-lg-8">

        @forelse($artikel as $item)
            <div class="artikel-card">

                {{-- Gambar cover --}}
                <a href="{{ route('guest.detail', $item->id) }}">
                    <img
                        class="cover"
                        src="{{ asset('storage/gambar/' . $item->gambar) }}"
                        alt="{{ $item->judul }}"
                        onerror="this.style.display='none'">
                </a>

                <div class="card-body">

                    {{-- Badge kategori --}}
                    <a href="{{ route('guest.beranda', ['kategori_id' => $item->id_kategori]) }}"
                       class="badge-kategori">
                        {{ $item->kategori->nama_kategori }}
                    </a>

                    {{-- Judul --}}
                    <h2>
                        <a href="{{ route('guest.detail', $item->id) }}">
                            {{ $item->judul }}
                        </a>
                    </h2>

                    {{-- Meta penulis --}}
                    <div class="meta-penulis">
                        <div class="avatar-circle">
                            {{ strtoupper(substr($item->penulis->nama_depan, 0, 1)) }}
                        </div>
                        <div>
                            <div class="nama">
                                {{ $item->penulis->nama_depan }} {{ $item->penulis->nama_belakang }}
                            </div>
                            <div class="tanggal">{{ $item->hari_tanggal }}</div>
                        </div>
                    </div>

                    {{-- Excerpt isi --}}
                    <p class="artikel-excerpt">
                        {{ Str::limit(strip_tags($item->isi), 200) }}
                    </p>

                    <a href="{{ route('guest.detail', $item->id) }}" class="btn-baca">
                        Baca Selengkapnya &rarr;
                    </a>
                </div>
            </div>
        @empty
            <div class="widget-card text-center py-5">
                <p class="text-muted mb-0">
                    @if($kategoriAktif)
                        Belum ada artikel di kategori <strong>{{ $kategoriAktif->nama_kategori }}</strong>.
                    @else
                        Belum ada artikel yang dipublikasikan.
                    @endif
                </p>
            </div>
        @endforelse

        {{-- Pagination --}}
        @if($artikel->hasPages())
            <div class="d-flex justify-content-center mt-2 mb-4">
                <nav>
                    <ul class="pagination pagination-sm mb-0" style="gap: 4px;">

                        {{-- Tombol Sebelumnya --}}
                        @if($artikel->onFirstPage())
                            <li class="page-item disabled">
                                <span class="page-link" style="border-radius:8px; border:1px solid #e9ecef; color:#adb5bd; font-size:13px; padding: 6px 14px;">
                                    &laquo;
                                </span>
                            </li>
                        @else
                            <li class="page-item">
                                <a class="page-link" href="{{ $artikel->previousPageUrl() }}"
                                   style="border-radius:8px; border:1px solid #e9ecef; color:#27ae60; font-size:13px; padding: 6px 14px;">
                                    &laquo;
                                </a>
                            </li>
                        @endif

                        {{-- Nomor halaman --}}
                        @foreach($artikel->getUrlRange(1, $artikel->lastPage()) as $page => $url)
                            @if($page == $artikel->currentPage())
                                <li class="page-item active">
                                    <span class="page-link"
                                          style="border-radius:8px; background-color:#27ae60; border-color:#27ae60; font-size:13px; padding: 6px 14px;">
                                        {{ $page }}
                                    </span>
                                </li>
                            @else
                                <li class="page-item">
                                    <a class="page-link" href="{{ $url }}"
                                       style="border-radius:8px; border:1px solid #e9ecef; color:#27ae60; font-size:13px; padding: 6px 14px;">
                                        {{ $page }}
                                    </a>
                                </li>
                            @endif
                        @endforeach

                        {{-- Tombol Berikutnya --}}
                        @if($artikel->hasMorePages())
                            <li class="page-item">
                                <a class="page-link" href="{{ $artikel->nextPageUrl() }}"
                                   style="border-radius:8px; border:1px solid #e9ecef; color:#27ae60; font-size:13px; padding: 6px 14px;">
                                    &raquo;
                                </a>
                            </li>
                        @else
                            <li class="page-item disabled">
                                <span class="page-link"
                                      style="border-radius:8px; border:1px solid #e9ecef; color:#adb5bd; font-size:13px; padding: 6px 14px;">
                                    &raquo;
                                </span>
                            </li>
                        @endif

                    </ul>
                </nav>
            </div>
        @endif

    </div>

    <!-- ══ KOLOM KANAN: Sidebar ══════════════════════════════════ -->
    <div class="col-lg-4">
        <div class="widget-card">
            <h5>Kategori Artikel</h5>

            {{-- Semua Artikel --}}
            <a href="{{ route('guest.beranda') }}"
               class="kategori-item {{ !$kategoriAktif ? 'active' : '' }}">
                <span>Semua Artikel</span>
                <span class="badge-count">{{ $totalArtikel }}</span>
            </a>

            {{-- Per kategori --}}
            @foreach($kategoriList as $kat)
                <a href="{{ route('guest.beranda', ['kategori_id' => $kat->id]) }}"
                   class="kategori-item {{ $kategoriAktif && $kategoriAktif->id === $kat->id ? 'active' : '' }}">
                    <span>{{ $kat->nama_kategori }}</span>
                    <span class="badge-count">{{ $kat->artikel_count }}</span>
                </a>
            @endforeach
        </div>
    </div>

</div>
@endsection
