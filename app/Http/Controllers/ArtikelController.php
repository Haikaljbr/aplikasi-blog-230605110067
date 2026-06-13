<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use App\Models\Artikel;
use App\Models\Penulis;
use App\Models\KategoriArtikel;

class ArtikelController extends Controller
{
    /** Cek apakah yang login adalah admin (guard 'admin') */
    private function isAdmin(): bool
    {
        return Auth::guard('admin')->check();
    }

    /**
     * ID penulis yang sedang login via guard 'web'.
     * Kembalikan null jika yang login adalah admin.
     */
    private function penulisId(): ?int
    {
        return $this->isAdmin() ? null : Auth::guard('web')->user()->id;
    }

    /**
     * Daftar artikel:
     * - Admin   → semua artikel
     * - Penulis → hanya artikel miliknya
     */
    public function index()
    {
        $query = Artikel::with('penulis', 'kategori')->orderBy('id', 'desc');

        if (!$this->isAdmin()) {
            $query->where('id_penulis', $this->penulisId());
        }

        $artikel = $query->get();
        return view('artikel.index', compact('artikel'));
    }

    /** Form tambah artikel */
    public function create()
    {
        $kategori = KategoriArtikel::orderBy('nama_kategori', 'asc')->get();
        return view('artikel.create', compact('kategori'));
    }

    /** Simpan artikel baru */
    public function store(Request $request)
    {
        $request->validate([
            'judul'       => 'required|string|max:255',
            'isi'         => 'required|string',
            'id_kategori' => 'required|exists:kategori_artikel,id',
            'gambar'      => 'required|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        /* Admin tidak bisa menulis artikel (tidak punya id di tabel penulis).
           Jika kamu ingin admin bisa membuat artikel, tambahkan kolom id_penulis
           atau buat penulis khusus untuk admin. Untuk sekarang: tolak. */
        if ($this->isAdmin()) {
            abort(403, 'Admin tidak dapat membuat artikel. Silakan gunakan akun penulis.');
        }

        $file     = $request->file('gambar');
        $namaFile = uniqid() . '.' . $file->getClientOriginalExtension();
        $file->storeAs('gambar', $namaFile, 'public');

        Artikel::create([
            'judul'        => $request->judul,
            'isi'          => $request->isi,
            'id_penulis'   => $this->penulisId(),
            'id_kategori'  => $request->id_kategori,
            'gambar'       => $namaFile,
            'hari_tanggal' => now()->timezone('Asia/Jakarta')
                ->locale('id')
                ->isoFormat('dddd, D MMMM Y | HH:mm'),
        ]);

        return redirect()->route('artikel.index')
            ->with('sukses', 'Artikel berhasil ditambahkan.');
    }

    /** Form edit — admin bisa edit semua, penulis hanya miliknya */
    public function edit(string $id)
    {
        $artikel = Artikel::findOrFail($id);

        if (!$this->isAdmin() && $artikel->id_penulis !== $this->penulisId()) {
            abort(403, 'Anda tidak memiliki izin untuk mengedit artikel ini.');
        }

        $kategori = KategoriArtikel::orderBy('nama_kategori', 'asc')->get();
        return view('artikel.edit', compact('artikel', 'kategori'));
    }

    /** Update artikel */
    public function update(Request $request, string $id)
    {
        $artikel = Artikel::findOrFail($id);

        if (!$this->isAdmin() && $artikel->id_penulis !== $this->penulisId()) {
            abort(403, 'Anda tidak memiliki izin untuk mengubah artikel ini.');
        }

        $request->validate([
            'judul'       => 'required|string|max:255',
            'isi'         => 'required|string',
            'id_kategori' => 'required|exists:kategori_artikel,id',
            'gambar'      => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        $data = [
            'judul'       => $request->judul,
            'isi'         => $request->isi,
            'id_kategori' => $request->id_kategori,
        ];

        if ($request->hasFile('gambar')) {
            Storage::disk('public')->delete('gambar/' . $artikel->gambar);
            $file     = $request->file('gambar');
            $namaFile = uniqid() . '.' . $file->getClientOriginalExtension();
            $file->storeAs('gambar', $namaFile, 'public');
            $data['gambar'] = $namaFile;
        }

        $artikel->update($data);

        return redirect()->route('artikel.index')
            ->with('sukses', 'Artikel berhasil diperbarui.');
    }

    /** Hapus artikel — admin bisa hapus semua, penulis hanya miliknya */
    public function destroy(string $id)
    {
        $artikel = Artikel::findOrFail($id);

        if (!$this->isAdmin() && $artikel->id_penulis !== $this->penulisId()) {
            abort(403, 'Anda tidak memiliki izin untuk menghapus artikel ini.');
        }

        try {
            Storage::disk('public')->delete('gambar/' . $artikel->gambar);
            $artikel->delete();
            return redirect()->route('artikel.index')
                ->with('sukses', 'Artikel berhasil dihapus.');
        } catch (\Exception $e) {
            return redirect()->route('artikel.index')
                ->with('gagal', 'Artikel gagal dihapus.');
        }
    }
}
