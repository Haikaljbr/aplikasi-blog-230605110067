# Aplikasi Blog — Sistem Manajemen Konten (CMS)

**Muhammad Haikal Fikri**
**NIM: 230605110067**

---

## Deskripsi Aplikasi

Aplikasi Blog ini adalah sistem manajemen konten (CMS) berbasis web yang dibangun menggunakan **Laravel**. Aplikasi ini memiliki dua sisi utama:

- **Halaman Publik** — Pengunjung dapat membaca artikel, memfilter berdasarkan kategori, dan melihat detail artikel beserta artikel terkait.
- **Area CMS** — Diakses setelah login, digunakan untuk mengelola konten blog dengan dua level akses:
  - **Admin** — Dapat mengelola seluruh artikel, data penulis, dan kategori artikel.
  - **Penulis** — Hanya dapat mengelola artikel miliknya sendiri.

Fitur utama meliputi manajemen artikel (tambah, edit, hapus), manajemen kategori, manajemen penulis, autentikasi multi-guard (admin & penulis), upload gambar, serta pagination di halaman publik.

---

## Langkah-Langkah Menjalankan Aplikasi Secara Lokal

### Prasyarat

Pastikan perangkat kamu sudah terinstal:
- PHP >= 8.2
- Composer
- MySQL (misalnya melalui XAMPP atau WAMP)
- Node.js & NPM (opsional, jika menggunakan asset build)

### 1. Clone Repository

```bash
git clone https://github.com/Haikaljbr/aplikasi-blog-230605110067
cd aplikasi-blog-230605110067
```

### 2. Install Dependency PHP

```bash
composer install
```

### 3. Salin File Environment

```bash
cp .env.example .env
```

### 4. Generate Application Key

```bash
php artisan key:generate
```

### 5. Konfigurasi Database

Buka file `.env` dan sesuaikan bagian berikut:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=db_blog
DB_USERNAME=root
DB_PASSWORD=
```

Buat database `db_blog` terlebih dahulu melalui phpMyAdmin atau MySQL CLI.

### 6. Jalankan Migrasi & Seeder

```bash
php artisan migrate --seed
```

### 7. Buat Symbolic Link Storage

```bash
php artisan storage:link
```

### 8. Jalankan Aplikasi

```bash
php artisan serve
```

Aplikasi dapat diakses di: [http://localhost:8000](http://localhost:8000)

---

## Demonstrasi Aplikasi

Tonton video demonstrasi lengkap aplikasi ini di YouTube:

▶️ [https://youtu.be/O6bETq25v18](https://youtu.be/O6bETq25v18)
