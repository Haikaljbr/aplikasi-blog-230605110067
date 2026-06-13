@extends('layouts.guest')

@section('title', $artikel->judul . ' — Blog Kami')

@section('content')
<div class="row g-4">

    <!-- ══ KOLOM KIRI: Detail Artikel ══════════════════════════ -->
    <div class="col-lg-8">

        {{-- Breadcrumb --}}
        <div class="breadcrumb-wrap">
            <a href="{{ route('guest.beranda') }}">Beranda</a>
            <span> / </span>
            <a href="{{ route('guest.beranda', ['kategori_id' => $artikel->id_kategori]) }}">
                {{ $artikel->kategori->nama_kategori }}
            </a>
            <span> / </span>
            <span style="color:#333;">{{ Str::limit($artikel->judul, 45) }}</span>
        </div>

        {{-- Gambar utama --}}
        <img
            class="detail-cover"
            src="{{ asset('storage/gambar/' . $artikel->gambar) }}"
            alt="{{ $artikel->judul }}"
            onerror="this.style.display='none'">

        {{-- Body artikel --}}
        <div class="detail-body">

            {{-- Badge kategori --}}
            <a href="{{ route('guest.beranda', ['kategori_id' => $artikel->id_kategori]) }}"
               class="badge-kategori">
                {{ $artikel->kategori->nama_kategori }}
            </a>

            {{-- Judul --}}
            <h1>{{ $artikel->judul }}</h1>

            {{-- Meta penulis --}}
            <div class="meta-penulis mb-4">
                <div class="avatar-circle" style="width:40px;height:40px;font-size:16px;">
                    {{ strtoupper(substr($artikel->penulis->nama_depan, 0, 1)) }}
                </div>
                <div>
                    <div class="nama" style="font-size:14px;">
                        {{ $artikel->penulis->nama_depan }} {{ $artikel->penulis->nama_belakang }}
                    </div>
                    <div class="tanggal">{{ $artikel->hari_tanggal }}</div>
                </div>
            </div>

            {{-- Isi artikel --}}
            <div class="detail-isi">
                {!! nl2br(e($artikel->isi)) !!}
            </div>

            {{-- Tombol kembali --}}
            <div class="mt-4 pt-3" style="border-top: 1px solid #e9ecef;">
                <a href="{{ route('guest.beranda') }}" class="btn-baca"
                   style="background:#6c757d;">
                    &larr; Kembali ke Beranda
                </a>
            </div>
        </div>

    </div>

    <!-- ══ KOLOM KANAN: Artikel Terkait ════════════════════════ -->
    <div class="col-lg-4">
        <div class="widget-card">
            <h5>Artikel Terkait</h5>

            @forelse($artikelTerkait as $terkait)
                <a href="{{ route('guest.detail', $terkait->id) }}" class="terkait-item">
                    <img
                        src="{{ asset('storage/gambar/' . $terkait->gambar) }}"
                        alt="{{ $terkait->judul }}"
                        onerror="this.src='https://via.placeholder.com/64x50?text=IMG'">
                    <div>
                        <div class="terkait-judul">
                            {{ Str::limit($terkait->judul, 60) }}
                        </div>
                        <div class="terkait-tanggal">
                            {{ $terkait->hari_tanggal }}
                        </div>
                    </div>
                </a>
            @empty
                <p class="text-muted" style="font-size:13px; margin:0;">
                    Tidak ada artikel terkait.
                </p>
            @endforelse
        </div>
    </div>

</div>
@endsection
