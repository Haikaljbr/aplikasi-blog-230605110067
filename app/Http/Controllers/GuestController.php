<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Artikel;
use App\Models\KategoriArtikel;

class GuestController extends Controller
{
    /**
     * Halaman utama pengunjung — menampilkan 5 artikel terbaru
     * Bisa difilter berdasarkan kategori via query string ?kategori_id=X
     */
    public function beranda(Request $request)
    {
        $kategoriList = KategoriArtikel::withCount('artikel')
            ->orderBy('nama_kategori', 'asc')
            ->get();

        $totalArtikel = Artikel::count();

        $kategoriAktif = null;
        $query = Artikel::with('penulis', 'kategori')->orderBy('id', 'desc');

        if ($request->filled('kategori_id')) {
            $kategoriAktif = KategoriArtikel::find($request->kategori_id);
            if ($kategoriAktif) {
                $query->where('id_kategori', $kategoriAktif->id);
            }
        }

        $artikel = $query->paginate(5)->appends($request->only('kategori_id'));

        return view('guest.beranda', compact('artikel', 'kategoriList', 'kategoriAktif', 'totalArtikel'));
    }

    /**
     * Halaman detail artikel — menampilkan isi lengkap beserta 5 artikel terkait
     */
    public function detail($id)
    {
        $artikel = Artikel::with('penulis', 'kategori')->findOrFail($id);

        $artikelTerkait = Artikel::with('penulis', 'kategori')
            ->where('id_kategori', $artikel->id_kategori)
            ->where('id', '!=', $artikel->id)
            ->orderBy('id', 'desc')
            ->take(5)
            ->get();

        return view('guest.detail', compact('artikel', 'artikelTerkait'));
    }
}
