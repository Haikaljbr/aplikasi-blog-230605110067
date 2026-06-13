/*
 Navicat Premium Dump SQL

 Source Server         : localhost 8.4.8
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : db_blog

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 13/06/2026 23:35:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_admin_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'haikalfikri', '$2y$12$m.6GJGoAL/iSTLt8LDh46uLE72mT5vi4wknX6EuO.7PN9brOKI2i6');

-- ----------------------------
-- Table structure for artikel
-- ----------------------------
DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penulis` int NOT NULL,
  `id_kategori` int NOT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hari_tanggal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_artikel_penulis`(`id_penulis` ASC) USING BTREE,
  INDEX `fk_artikel_kategori`(`id_kategori` ASC) USING BTREE,
  CONSTRAINT `fk_artikel_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_artikel` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_artikel_penulis` FOREIGN KEY (`id_penulis`) REFERENCES `penulis` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of artikel
-- ----------------------------
INSERT INTO `artikel` VALUES (1, 2, 1, 'Pengenalan PHP 8', 'PHP 8 merupakan tonggak penting dalam evolusi bahasa pemrograman server-side yang telah mendominasi ekosistem web selama lebih dari dua dekade. Versi mayor ini membawa serangkaian inovasi fundamental yang secara signifikan mengubah paradigma penulisan kode di kalangan developer. Fitur unggulan seperti Just-In-Time (JIT) Compiler memungkinkan eksekusi bytecode secara langsung di level mesin, sehingga performa aplikasi meningkat drastis terutama pada operasi komputasi intensif. Di sisi sintaksis, Named Arguments memberikan fleksibilitas pemanggilan fungsi tanpa terikat urutan parameter, sedangkan Union Types memperkuat sistem type-checking untuk mencegah kesalahan tipe data sejak tahap kompilasi. Inovasi-inovasi ini secara kolektif menjawab kebutuhan industri akan bahasa scripting yang tidak hanya produktif, tetapi juga performatif dan type-safe.\r\n\r\nDampak praktis dari pembaruan PHP 8 terasa nyata dalam produktivitas tim pengembang di berbagai skala proyek. Kode yang sebelumnya memerlukan puluhan baris validasi manual kini dapat ditulis lebih ringkas dan ekspresif berkat fitur seperti Match Expression dan Nullsafe Operator. Framework enterprise seperti Laravel 9 ke atas telah mengoptimalkan seluruh lapisan internalnya untuk memanfaatkan keunggulan PHP 8, termasuk perbaikan pada Eloquent ORM dan sistem routing. Berbagai studi benchmark menunjukkan peningkatan throughput request per detik yang mencapai 10–15% dibandingkan PHP 7.4 pada workload aplikasi web standar. Hal ini menjadikan migrasi ke PHP 8 bukan sekadar pilihan teknis, melainkan keputusan strategis yang berdampak langsung pada efisiensi operasional dan pengalaman pengguna akhir.\r\n\r\nProses migrasi menuju PHP 8 memerlukan perencanaan yang matang agar tidak mengganggu stabilitas sistem yang sudah berjalan di lingkungan produksi. Langkah pertama yang krusial adalah melakukan audit menyeluruh terhadap seluruh dependensi pihak ketiga menggunakan tools seperti Composer Compatibility Checker untuk memastikan setiap package mendukung versi PHP terbaru. Developer juga perlu mewaspadai sejumlah breaking changes, seperti penghapusan fungsi-fungsi deprecated yang sebelumnya masih toleran di PHP 7.x namun kini menghasilkan fatal error. Strategi migrasi yang direkomendasikan meliputi pengujian di lingkungan staging secara paralel, penerapan PHPStan atau Psalm untuk analisis statis kode, serta pembaruan bertahap per modul untuk meminimalkan risiko regresi. Dengan pendekatan yang sistematis dan terukur, transisi ke PHP 8 dapat diselesaikan tanpa downtime signifikan sekaligus membuka peluang adopsi fitur-fitur canggih yang tersedia di ekosistem modern.', '6a2d032c1bcf3.jpg', 'Jumat, 12 Juni 2026 | 18:32');
INSERT INTO `artikel` VALUES (2, 3, 2, 'Belajar MySQL Dasar', 'Database relasional merupakan fondasi arsitektur data pada mayoritas aplikasi modern, mulai dari sistem e-commerce berskala UMKM hingga platform SaaS dengan jutaan pengguna aktif. MySQL, yang dikembangkan oleh Oracle Corporation, telah membuktikan dirinya sebagai Relational Database Management System (RDBMS) paling dominan di dunia dengan pangsa pasar yang konsisten selama lebih dari dua dekade. Keunggulan utama MySQL terletak pada kombinasi performa tinggi, kemudahan administrasi, serta ekosistem dokumentasi dan komunitas yang sangat kaya. Sistem ini mengimplementasikan standar SQL (Structured Query Language) yang memungkinkan developer berinteraksi dengan data secara deklaratif dan terstruktur. Pemahaman mendalam tentang MySQL bukan hanya keterampilan teknis, melainkan kompetensi inti yang wajib dikuasai oleh setiap engineer yang berambisi membangun sistem informasi yang andal dan skalabel.\r\n\r\nFondasi dari penguasaan MySQL dimulai dari pemahaman terhadap lima kelompok perintah SQL yang membentuk siklus hidup data dalam sebuah sistem. Perintah DDL (Data Definition Language) seperti CREATE TABLE dan ALTER TABLE digunakan untuk mendefinisikan struktur skema database, sedangkan DML (Data Manipulation Language) mencakup INSERT, UPDATE, dan DELETE untuk operasi manipulasi data. Perintah SELECT sebagai bagian dari DQL (Data Query Language) merupakan yang paling sering digunakan dan memiliki kompleksitas paling tinggi, karena mendukung JOIN, subquery, agregasi, serta pengurutan dan pemfilteran data secara bersamaan. Pemahaman tentang tipe data MySQL — seperti perbedaan antara VARCHAR dan TEXT, atau INT dan BIGINT — juga krusial untuk perancangan skema yang efisien. Penguasaan fondasi ini akan menjadi bekal solid sebelum developer melanjutkan ke topik-topik lanjutan seperti optimasi query, indexing, dan manajemen transaksi.\r\n\r\nIntegrasi MySQL dengan aplikasi backend memerlukan konfigurasi koneksi yang presisi dan aman agar sistem dapat beroperasi dengan reliabilitas tinggi. Pada framework seperti Laravel, parameter koneksi database dikonfigurasi melalui file .env yang memuat variabel seperti DB_HOST, DB_PORT, DB_DATABASE, DB_USERNAME, dan DB_PASSWORD, kemudian dimuat secara dinamis oleh file config/database.php. Kesalahan sekecil apapun pada nilai variabel tersebut — termasuk perbedaan huruf kapital pada nama database atau spasi tersembunyi pada password — akan mengakibatkan exception PDOException yang memblokir seluruh operasi aplikasi. Praktik keamanan terbaik mengharuskan penggunaan akun MySQL dengan hak akses terbatas (principle of least privilege), bukan akun root, untuk menghubungkan aplikasi ke database di lingkungan produksi. Dengan konfigurasi yang tepat dan pemahaman menyeluruh tentang mekanisme koneksi, developer dapat membangun lapisan data yang stabil sebagai tulang punggung fungsionalitas aplikasi.', '6a2d0323a8cca.jpg', 'Jumat, 12 Juni 2026 | 18:34');
INSERT INTO `artikel` VALUES (3, 2, 2, 'Optimasi Query MySQL untuk Aplikasi Skala Besar', 'Performa query database menjadi faktor determinan yang secara langsung mempengaruhi kualitas pengalaman pengguna dan kapasitas skalabilitas sebuah aplikasi web berskala enterprise. Ketika volume data dalam sebuah tabel telah melampaui ambang jutaan baris, query yang tidak dioptimalkan dapat menghasilkan response time yang mencapai puluhan detik, jauh melampaui toleransi pengguna modern yang mengharapkan respons di bawah 200 milidetik. Fenomena ini umumnya dipicu oleh mekanisme Full Table Scan, di mana MySQL terpaksa membaca setiap baris secara sekuensial karena tidak tersedia jalur pencarian yang efisien. Konsekuensi kumulatif dari performa query yang buruk tidak hanya berdampak pada kepuasan pengguna, tetapi juga meningkatkan beban CPU dan I/O server secara eksponensial seiring pertumbuhan data. Oleh karena itu, optimasi query bukan merupakan tahap opsional, melainkan kebutuhan teknis yang harus direncanakan sejak fase perancangan arsitektur sistem.\r\n\r\nIndexing merupakan teknik optimasi paling fundamental dan berdampak paling besar dalam meningkatkan kecepatan retrieval data pada MySQL. Indeks bekerja dengan membangun struktur data B-Tree yang memungkinkan mesin database menemukan baris target tanpa harus memindai seluruh tabel, menurunkan kompleksitas pencarian dari O(n) menjadi O(log n). Kolom yang menjadi kandidat ideal untuk diindeks adalah kolom yang sering muncul dalam klausa WHERE, JOIN ON, maupun ORDER BY pada query-query kritis aplikasi. Namun demikian, penambahan indeks secara berlebihan juga memiliki trade-off negatif, yaitu memperlambat operasi INSERT, UPDATE, dan DELETE karena setiap perubahan data mengharuskan pembaruan struktur indeks secara bersamaan. Penggunaan perintah EXPLAIN sebelum eksekusi query sangat direkomendasikan untuk menganalisis execution plan dan memastikan indeks yang relevan benar-benar dimanfaatkan oleh query optimizer MySQL.\r\n\r\nSelain strategi indexing, terdapat serangkaian praktik penulisan query yang secara langsung berkontribusi pada efisiensi konsumsi sumber daya server database. Penggunaan sintaks SELECT * (wildcard) adalah anti-pattern yang harus dihindari karena memaksa server mentransfer seluruh kolom dari disk ke memori aplikasi, meskipun hanya sebagian kecil kolom yang dibutuhkan oleh logika bisnis. Developer disarankan selalu menentukan nama kolom secara eksplisit untuk meminimalkan payload transfer data dan memungkinkan query optimizer membuat keputusan yang lebih optimal. Teknik lain yang krusial mencakup penggunaan query caching secara selektif, pembatasan hasil menggunakan LIMIT untuk query yang tidak memerlukan seluruh dataset, serta penghindaran fungsi skalar pada kolom yang terindeks karena dapat membatalkan efektivitas indeks. Pendekatan holistik yang menggabungkan desain skema yang baik, strategi indexing yang tepat, dan penulisan query yang efisien merupakan kunci untuk mempertahankan performa tinggi sistem database sekalipun volume data terus berkembang.', '6a2d76801349d.jpg', 'Sabtu, 13 Juni 2026 | 18:36');
INSERT INTO `artikel` VALUES (4, 2, 1, 'Memahami Konsep RESTful API dengan Laravel', 'RESTful API (Representational State Transfer Application Programming Interface) telah berkembang menjadi arsitektur komunikasi data yang paling universal dalam ekosistem pengembangan perangkat lunak modern. Standar ini mendefinisikan seperangkat constraint arsitektural yang memastikan interoperabilitas lintas platform, memungkinkan backend berbasis PHP berinteraksi secara mulus dengan aplikasi mobile Android/iOS, Single Page Application berbasis React atau Vue, maupun layanan pihak ketiga melalui integrasi webhook. Prinsip inti REST memanfaatkan semantik HTTP method secara penuh dan bermakna: GET untuk retrieval data, POST untuk pembuatan resource baru, PUT/PATCH untuk pembaruan, dan DELETE untuk penghapusan, sehingga endpoint API menjadi self-describing dan mudah dipahami lintas tim. Konsistensi dalam desain endpoint, struktur respons JSON, serta penggunaan HTTP status code yang tepat merupakan indikator kematangan sebuah RESTful API. Dalam konteks arsitektur microservices yang semakin diadopsi industri, kemampuan mendesain dan mengimplementasikan RESTful API yang robust merupakan kompetensi krusial bagi setiap backend developer.\r\n\r\nLaravel menyediakan ekosistem yang sangat matang dan komprehensif untuk pembangunan RESTful API, menjadikannya framework pilihan utama bagi developer PHP yang menargetkan standar enterprise. Fitur API Resource dan Resource Collection memungkinkan transformasi model Eloquent menjadi representasi JSON yang terstruktur dan konsisten, memisahkan lapisan presentasi data dari lapisan logika bisnis. Sistem routing Laravel yang ekspresif mendukung definisi API route secara terpisah melalui file routes/api.php dengan prefix /api yang otomatis, dilengkapi middleware throttle untuk pembatasan rate request guna melindungi server dari penyalahgunaan. Autentikasi stateless pada API Laravel umumnya diimplementasikan menggunakan token berbasis JWT (JSON Web Token) atau Laravel Sanctum yang menyediakan mekanisme personal access token yang ringan namun aman. Integrasi antara fitur-fitur bawaan Laravel dengan prinsip-prinsip REST menghasilkan API yang tidak hanya fungsional, tetapi juga mudah dipelihara, didokumentasikan, dan dikembangkan secara iteratif.\r\n\r\nPrinsip statelessness yang menjadi fondasi arsitektur REST membawa implikasi desain yang mendalam terhadap bagaimana sistem backend dibangun dan diskalakan. Dalam model stateless, setiap HTTP request dari client harus bersifat mandiri dan membawa seluruh informasi konteks yang dibutuhkan server untuk memprosesnya, termasuk token autentikasi, parameter paginasi, dan filter data. Pendekatan ini secara fundamental berbeda dari aplikasi web tradisional berbasis session, dan memungkinkan infrastruktur server API untuk diskalakan secara horizontal tanpa kekhawatiran terhadap sinkronisasi state antar instance. Ketika terjadi lonjakan traffic, arsitektur stateless memfasilitasi penambahan node server baru di belakang load balancer tanpa konfigurasi khusus, karena tidak ada state sesi yang perlu direplikasi. Memahami dan menginternalisasi prinsip statelessness ini merupakan syarat mutlak bagi developer yang ingin merancang API yang tidak hanya bekerja dengan baik pada skala kecil, tetapi juga mampu bertahan menghadapi pertumbuhan pengguna yang eksponensial.', '6a2d7678b1318.jpg', 'Sabtu, 13 Juni 2026 | 18:38');
INSERT INTO `artikel` VALUES (5, 2, 2, 'Tips Meningkatkan Keamanan Database dari Serangan SQL Injection', 'SQL Injection secara konsisten menempati posisi teratas dalam daftar kerentanan aplikasi web paling kritis yang diterbitkan oleh OWASP (Open Web Application Security Project), mencerminkan betapa persisten dan berbahayanya ancaman ini meskipun teknik mitigasinya sudah lama diketahui. Serangan ini dieksploitasi dengan cara menyisipkan atau \"menginjeksi\" perintah SQL yang berbahaya ke dalam input pengguna yang kemudian dieksekusi oleh mesin database tanpa validasi yang memadai. Konsekuensi dari serangan yang berhasil dapat mencakup ekstraksi seluruh isi tabel pengguna beserta kredensial terenkripsi, modifikasi atau penghapusan data secara masif, bypass mekanisme autentikasi, hingga eksekusi perintah di level sistem operasi pada konfigurasi database tertentu. Kerugian yang ditimbulkan tidak hanya bersifat teknis, tetapi juga meliputi konsekuensi hukum terkait pelanggaran regulasi perlindungan data seperti UU PDP di Indonesia atau GDPR di Eropa. Memahami mekanisme SQL Injection secara mendalam adalah prasyarat bagi setiap developer untuk dapat membangun sistem yang benar-benar aman dari ancaman ini.\r\n\r\nPrepared Statements, juga dikenal sebagai Parameterized Queries, merupakan mekanisme pertahanan primer yang paling efektif dan direkomendasikan secara universal oleh komunitas keamanan siber global. Prinsip kerja Prepared Statements adalah dengan memisahkan fase kompilasi struktur query SQL dari fase pengikatan nilai parameter, sehingga input pengguna diperlakukan murni sebagai data literal dan tidak pernah diinterpretasikan sebagai bagian dari instruksi SQL. Pada implementasi Laravel, perlindungan ini sudah tertanam secara built-in melalui Query Builder dan Eloquent ORM yang secara otomatis menggunakan PDO prepared statements untuk semua operasi database, sehingga developer terlindungi dari SQL Injection selama tidak menggunakan raw query tanpa sanitasi. Dalam kasus di mana raw query tidak dapat dihindari, Laravel menyediakan metode DB::select() dengan parameter binding sebagai alternatif yang aman. Pengujian kerentanan SQL Injection secara berkala menggunakan tools seperti SQLMap atau OWASP ZAP juga disarankan sebagai bagian dari pipeline keamanan yang komprehensif.\r\n\r\nPenerapan prinsip least privilege pada konfigurasi akses database merupakan lapisan pertahanan berlapis yang melengkapi proteksi yang sudah diberikan oleh Prepared Statements. Prinsip ini mengharuskan setiap akun database yang digunakan aplikasi hanya memiliki hak akses minimum yang benar-benar diperlukan untuk menjalankan fungsinya, misalnya hak SELECT dan INSERT pada tabel transaksi tanpa hak DROP atau ALTER. Dengan demikian, meskipun serangan SQL Injection berhasil menembus lapisan pertama, cakupan kerusakan yang dapat ditimbulkan penyerang dibatasi secara signifikan oleh keterbatasan privilege akun yang dikompromikan. Selain pembatasan privilege, praktik keamanan database yang komprehensif juga mencakup enkripsi data sensitif saat disimpan (at-rest encryption), audit log untuk semua aktivitas database yang mencurigakan, serta rotasi kredensial secara berkala. Kombinasi antara Prepared Statements, konfigurasi privilege yang ketat, dan monitoring aktif membentuk strategi defense-in-depth yang secara substansial meningkatkan postur keamanan aplikasi Laravel di lingkungan produksi.', '6a2d766116826.jpg', 'Sabtu, 13 Juni 2026 | 18:40');
INSERT INTO `artikel` VALUES (6, 3, 1, 'Mengenal Clean Architecture dalam Pengembangan Aplikasi', 'Clean Architecture merupakan paradigma desain perangkat lunak yang dicetuskan oleh Robert C. Martin (Uncle Bob) sebagai respons terhadap permasalahan umum yang menghinggapi basis kode berumur panjang, yaitu tingginya coupling antar komponen yang menyulitkan pengujian, pemeliharaan, dan evolusi sistem. Arsitektur ini mengorganisir kode ke dalam lapisan-lapisan konsentris yang mengikuti Dependency Rule: dependensi kode hanya boleh mengarah ke dalam, dari lapisan luar (infrastruktur) menuju lapisan dalam (domain bisnis inti). Lapisan terdalam berisi Entities yang merepresentasikan aturan bisnis paling fundamental dan tidak bergantung pada framework, database, maupun antarmuka pengguna. Lapisan selanjutnya berisi Use Cases yang mengorkestrasikan aliran data dan mengimplementasikan logika aplikasi spesifik, sementara lapisan terluar berisi adapter dan framework yang dapat diganti tanpa mempengaruhi inti sistem. Pemisahan yang tegas ini menghasilkan kode yang truly testable, framework-agnostic, dan database-agnostic dalam pengertian yang sesungguhnya.\r\n\r\nManfaat terbesar dari penerapan Clean Architecture terasa secara nyata dalam aktivitas pengujian perangkat lunak, khususnya unit testing dan integration testing. Karena logika bisnis dalam Use Cases tidak bergantung pada implementasi konkret database atau HTTP framework, pengujian dapat dilakukan dengan mock object atau stub sederhana tanpa memerlukan koneksi database sungguhan atau server HTTP yang berjalan. Kecepatan eksekusi test suite meningkat drastis, memungkinkan tim menjalankan ribuan unit test dalam hitungan detik sebagai bagian dari pipeline CI/CD. Dari perspektif maintainability, ketika sebuah library pihak ketiga seperti library email atau payment gateway perlu diganti, perubahan hanya terjadi di lapisan adapter tanpa menyentuh Use Cases atau Entities, meminimalkan risiko regresi. Karakteristik ini menjadikan Clean Architecture sebagai fondasi yang ideal untuk proyek dengan umur panjang dan tim yang terus berkembang.\r\n\r\nInvestasi awal yang diperlukan untuk menegakkan Clean Architecture memang lebih tinggi dibandingkan pendekatan tradisional yang mengikuti konvensi framework secara literal, namun trade-off ini terbayar lunas dalam jangka menengah hingga panjang. Fase setup awal membutuhkan pendefinisian interface atau contract yang jelas untuk setiap batas lapisan, pembuatan struktur direktori yang mencerminkan hierarki arsitektur, serta kesepakatan tim mengenai konvensi yang akan diterapkan secara konsisten. Pada ekosistem Laravel, Clean Architecture dapat diimplementasikan dengan mengkombinasikan konsep Repository Pattern untuk lapisan data, Service Layer untuk Use Cases, serta memanfaatkan dependency injection container Laravel untuk menghubungkan implementasi konkret dengan interface-nya. Untuk proyek startup dengan deadline ketat dan cakupan terbatas, variasi yang lebih pragmatis seperti Layered Architecture atau Hexagonal Architecture bisa menjadi titik awal yang lebih realistis sebelum bermigrasi ke Clean Architecture penuh. Keputusan adopsi arsitektur ini pada akhirnya harus diselaraskan dengan kompleksitas domain bisnis, ukuran tim, dan proyeksi pertumbuhan jangka panjang sistem yang sedang dibangun.', '6a2d7e6fb2490.jpg', 'Sabtu, 13 Juni 2026 | 19:21');
INSERT INTO `artikel` VALUES (7, 3, 3, 'Tren Desain UI/UX Menggunakan Tailwind CSS', 'Tailwind CSS telah memicu pergeseran paradigma yang signifikan dalam metodologi pembangunan antarmuka web, menggeser pendekatan component-first dari framework seperti Bootstrap menuju filosofi utility-first yang memberikan kontrol granular kepada developer di setiap level desain. Dikembangkan oleh Adam Wathan dan dirilis pada 2017, Tailwind menyediakan ratusan class utility atomik yang masing-masing merepresentasikan satu properti CSS tunggal, memungkinkan komposisi desain kompleks langsung di dalam markup HTML tanpa menulis satu baris CSS kustom pun. Pendekatan ini secara fundamental mengeliminasi permasalahan klasik seperti specificity conflict, naming convention yang tidak konsisten, serta bloat CSS yang terakumulasi seiring berkembangnya proyek. Konsistensi visual dipertahankan melalui design token yang terpusat dalam file tailwind.config.js, di mana tim dapat mendefinisikan palet warna, skala tipografi, dan sistem spacing yang selaras dengan design system perusahaan. Adopsi Tailwind yang masif di industri — termasuk oleh perusahaan seperti GitHub, Heroku, dan Stripe — mengonfirmasi validitas pendekatan utility-first sebagai metodologi desain web yang matang dan production-ready.\r\n\r\nEkspresi kreativitas desain dalam Tailwind CSS terwujud melalui komposisi class utility yang intuitif dan dapat dibaca langsung di dalam template Blade, JSX, maupun Vue Single File Component. Desainer dapat mengimplementasikan konsep layout kompleks seperti CSS Grid dan Flexbox menggunakan class seperti grid grid-cols-3 gap-6 atau flex items-center justify-between tanpa perlu beralih konteks ke file stylesheet terpisah. Sistem responsivitas Tailwind berbasis breakpoint prefix (sm:, md:, lg:, xl:, 2xl:) memungkinkan penyesuaian tampilan untuk berbagai ukuran layar ditulis secara inline dan mudah dibaca, merepresentasikan pendekatan mobile-first secara eksplisit dalam kode. Fitur arbitrary values dalam kurung kotak seperti w-[327px] atau text-[#1a2b3c] menjembatani kebutuhan kustomisasi presisi ketika skala default Tailwind tidak mencukupi persyaratan desain spesifik. Produktivitas pengembangan front-end meningkat secara terukur karena developer tidak perlu lagi berpindah antara file HTML dan CSS secara berulang untuk iterasi desain.\r\n\r\nOptimasi performa merupakan salah satu keunggulan kompetitif terbesar Tailwind CSS dibandingkan framework berbasis komponen yang menyertakan stylesheet monolitik berukuran besar. Mekanisme PurgeCSS yang terintegrasi (atau Content configuration pada Tailwind v3+) bekerja dengan melakukan static analysis pada seluruh file template untuk mengidentifikasi class yang benar-benar digunakan, kemudian menghapus semua class lainnya saat proses build produksi. Hasil akhirnya adalah file CSS dengan ukuran yang sangat kecil — umumnya di bawah 10KB setelah gzip — yang berkontribusi langsung pada peningkatan Core Web Vitals, khususnya First Contentful Paint (FCP) dan Largest Contentful Paint (LCP). Tren desain web kontemporer yang sangat menekankan performa sebagai faktor pengalaman pengguna dan SEO menjadikan karakteristik ini sebagai nilai tambah yang substansial. Dikombinasikan dengan dukungan native untuk dark mode, animasi transisi, dan CSS custom properties, Tailwind CSS memposisikan dirinya bukan sekadar utility framework, melainkan platform desain front-end yang komprehensif untuk kebutuhan aplikasi web modern.', '6a2d7e69ea56e.jpg', 'Sabtu, 13 Juni 2026 | 19:23');
INSERT INTO `artikel` VALUES (8, 4, 1, 'Panduan Git & GitHub untuk Kolaborasi Tim Developer', 'Git merupakan distributed version control system (DVCS) yang dirancang oleh Linus Torvalds pada 2005 untuk memenuhi kebutuhan manajemen kode sumber kernel Linux yang sangat kompleks, dan kini telah menjadi standar de facto dalam industri pengembangan perangkat lunak global. Berbeda dengan sistem version control terpusat seperti SVN, Git memungkinkan setiap developer memiliki salinan lengkap seluruh histori repositori secara lokal, sehingga operasi seperti commit, diff, dan log dapat dilakukan tanpa koneksi jaringan. Setiap commit dalam Git merepresentasikan snapshot lengkap dari kondisi repositori pada satu titik waktu, bukan sekadar delta perubahan, yang memungkinkan operasi rollback dan branching yang sangat efisien. Kemampuan tracking perubahan yang granular — hingga tingkat karakter per baris kode — menjadikan Git sebagai alat audit trail yang tak ternilai, memungkinkan tim untuk mengidentifikasi kapan dan oleh siapa sebuah bug diperkenalkan ke dalam basis kode. Tanpa penguasaan Git, kolaborasi pada proyek software dengan lebih dari satu developer hampir mustahil dilakukan secara terorganisir dan tanpa risiko kehilangan pekerjaan.\r\n\r\nGitHub berfungsi sebagai lapisan sosial dan kolaborasi di atas Git, menyediakan infrastruktur cloud yang memungkinkan tim yang tersebar secara geografis untuk bekerja pada basis kode yang sama dengan koordinasi yang terstruktur. Fitur Pull Request (PR) merupakan mekanisme inti kolaborasi di GitHub yang memfasilitasi proses code review terstruktur, di mana perubahan dari sebuah branch diusulkan untuk digabungkan ke branch utama dan dapat dikomentari, didiskusikan, serta disetujui oleh peer reviewer sebelum merge dilakukan. Strategi branching seperti Git Flow atau trunk-based development mendefinisikan konvensi penamaan dan aliran kerja branch yang memastikan branch utama (main/master) selalu berada dalam kondisi stabil dan siap deploy. Integrasi GitHub Actions memungkinkan otomatisasi pipeline CI/CD secara native, mulai dari eksekusi test suite otomatis saat setiap push, linting kode, build artefak, hingga deployment ke lingkungan staging atau produksi. Kombinasi antara Git sebagai mesin version control dan GitHub sebagai platform kolaborasi membentuk tulang punggung workflow pengembangan yang efisien dan dapat diskalakan.\r\n\r\nMerge conflict, meskipun sering dianggap sebagai momok oleh developer pemula, sesungguhnya merupakan mekanisme perlindungan Git yang mencegah penimpaan pekerjaan satu developer oleh developer lain secara tidak sengaja. Conflict terjadi ketika dua atau lebih developer memodifikasi baris kode yang sama pada branch yang berbeda, dan Git tidak dapat secara otomatis menentukan versi mana yang harus dipertahankan tanpa keputusan manusia. Resolusi conflict yang efektif memerlukan pemahaman mendalam tentang konteks perubahan yang terlibat, yang menekankan pentingnya komunikasi tim yang aktif, terutama ketika mengerjakan modul yang berdekatan secara fungsional. Praktik terbaik untuk meminimalkan frekuensi conflict mencakup menjaga branch berumur pendek (short-lived branches), melakukan pull dan rebase dari branch utama secara reguler, serta membagi tanggung jawab kode (code ownership) antar anggota tim dengan jelas. Kematangan sebuah tim engineering sering kali tercermin dari bagaimana mereka mengelola workflow Git mereka: apakah conflict ditangani dengan cepat dan kolaboratif, atau dibiarkan berakkumulasi menjadi technical debt yang memperlambat laju pengembangan.', '6a2d7e5942d72.jpg', 'Sabtu, 13 Juni 2026 | 19:25');
INSERT INTO `artikel` VALUES (9, 4, 3, 'Desain Antarmuka Responsif Menggunakan Grid System Bootstrap 5', 'Responsivitas antarmuka web telah bertransformasi dari fitur tambahan menjadi persyaratan fundamental dalam standar pengembangan web modern, didorong oleh statistik yang menunjukkan bahwa lebih dari 60% traffic internet global kini berasal dari perangkat mobile. Bootstrap 5, versi terbaru dari framework front-end paling banyak digunakan di dunia yang dikembangkan oleh tim Twitter, menghadirkan grid system yang sepenuhnya direkonstruksi di atas fondasi CSS Flexbox untuk menggantikan pendekatan float-based pada versi sebelumnya. Sistem grid ini membagi lebar viewport menjadi 12 kolom virtual yang bersifat fluid dan proporsional, memungkinkan developer mendefinisikan layout yang berbeda secara deklaratif untuk setiap ukuran layar menggunakan kelas breakpoint yang expressif. Penghapusan ketergantungan pada jQuery di Bootstrap 5 merupakan keputusan arsitektural signifikan yang mengurangi ukuran bundle secara substansial dan meningkatkan kompatibilitas dengan ekosistem JavaScript modern seperti React dan Vue. Framework ini telah menjadi bahasa desain visual yang dipahami secara universal di industri, menjadikannya pilihan pragmatis untuk tim yang memprioritaskan kecepatan pengembangan dan konsistensi lintas browser.\r\n\r\nSistem grid Bootstrap 5 beroperasi melalui hierarki container, row, dan column yang menciptakan struktur layout yang prediktif dan mudah di-debug. Container berfungsi sebagai pembungkus lebar maksimum yang berpusat di halaman, tersedia dalam varian .container (fixed-width dengan max-width per breakpoint) dan .container-fluid (full-width yang selalu mengisi viewport). Dalam sebuah row, kolom-kolom didefinisikan menggunakan kelas seperti col-sm-6 col-md-4 col-lg-3 yang secara bersamaan mendefinisikan lebar kolom pada breakpoint small, medium, dan large dalam satu atribut class. Sistem breakpoint Bootstrap 5 (xs <576px, sm ≥576px, md ≥768px, lg ≥992px, xl ≥1200px, xxl ≥1400px) menyediakan granularitas yang memadai untuk mengakomodasi berbagai ukuran perangkat dari smartwatch hingga monitor ultra-wide. Kemampuan nesting kolom dan penggunaan utility class seperti offset, order, dan align — semuanya berbasis Flexbox — memberikan fleksibilitas layouting yang melampaui sekadar pembagian kolom sederhana.\r\n\r\nEfisiensi yang ditawarkan Bootstrap 5 dalam proses transformasi desain dari Figma menjadi kode web fungsional merupakan nilai proposisi utama yang mempertahankan relevansi framework ini di tengah ekosistem front-end yang terus berevolusi. Konsistensi visual lintas browser — termasuk normalisasi CSS melalui Reboot yang berbasis Normalize.css — mengeliminasi kebutuhan untuk menulis browser-specific hack yang menghabiskan waktu debugging. Komponen siap pakai seperti Navbar responsif, Modal, Carousel, dan Dropdown hadir dengan aksesibilitas bawaan yang memenuhi standar ARIA, memastikan antarmuka yang dibangun dapat diakses oleh pengguna dengan disabilitas. Proses slicing desain dari wireframe Figma dipercepat secara signifikan karena developer dapat langsung memetakan komponen Figma ke komponen Bootstrap yang ekuivalen, kemudian menyesuaikan warna dan tipografi melalui Sass variables atau CSS custom properties. Untuk proyek yang memerlukan identitas visual yang kuat dan berbeda, Bootstrap 5 dapat dikustomisasi secara mendalam melalui Sass partials-nya, memungkinkan penggunaan grid system dan utility-nya sambil mengganti seluruh estetika visual dengan design language brand yang unik.', '6a2d7e5338c54.jpg', 'Sabtu, 13 Juni 2026 | 19:27');
INSERT INTO `artikel` VALUES (10, 4, 2, 'Penerapan Relasi Foreign Key untuk Integritas Data MySQL', 'Integritas referensial merupakan properti fundamental sebuah database relasional yang menjamin bahwa hubungan antar tabel selalu berada dalam kondisi konsisten dan valid sepanjang siklus hidup data. Tanpa mekanisme penegakan integritas yang otomatis, operasi DELETE atau UPDATE pada tabel induk berpotensi meninggalkan baris-baris \"yatim\" (orphan records) pada tabel anak yang tidak lagi memiliki parent yang valid, menyebabkan inkonsistensi data yang sulit dideteksi dan berpotensi merusak logika bisnis aplikasi. Foreign Key Constraint pada storage engine InnoDB MySQL hadir sebagai mekanisme deklaratif yang mendelegasikan tanggung jawab penjagaan integritas referensial kepada mesin database itu sendiri, bukan kepada lapisan aplikasi yang lebih rentan terhadap kesalahan implementasi. Pendekatan ini mengikuti prinsip single source of truth untuk aturan bisnis terkait relasi data: aturan didefinisikan sekali di level skema database dan berlaku secara konsisten untuk semua akses data, terlepas dari framework atau bahasa pemrograman yang digunakan. Pemahaman mendalam tentang foreign key bukan hanya relevan untuk administrator database, tetapi merupakan kompetensi inti yang harus dikuasai oleh setiap developer yang bertanggung jawab merancang skema database untuk aplikasi production.\r\n\r\nKonfigurasi referential action pada Foreign Key Constraint memberikan fleksibilitas yang sangat berguna dalam mendefinisikan perilaku kaskade saat data pada tabel induk dimodifikasi atau dihapus. Opsi ON DELETE RESTRICT dan ON UPDATE RESTRICT merupakan pilihan paling konservatif yang memblokir operasi modifikasi pada tabel induk selama masih ada baris dependen di tabel anak, memastikan data tidak pernah berada dalam kondisi tidak konsisten. Sebaliknya, ON DELETE CASCADE dan ON UPDATE CASCADE mempropagasi perubahan secara otomatis ke seluruh tabel anak, berguna untuk skenario di mana record anak tidak memiliki makna mandiri tanpa parent-nya, seperti item detail order yang harus ikut terhapus jika order induknya dihapus. Opsi ON DELETE SET NULL berguna untuk kasus di mana penghapusan parent tidak serta-merta menginvalidasi record anak, tetapi cukup melepaskan asosiasi dengan memset kolom foreign key menjadi NULL. Pemilihan referential action yang tepat harus didasarkan pada pemahaman mendalam tentang semantik bisnis dari relasi tersebut, bukan sekadar pilihan teknis yang diambil secara default.\r\n\r\nAspek performa dari Foreign Key Constraint seringkali tidak mendapat perhatian yang cukup dalam diskusi tentang integritas data, padahal implikasinya sangat signifikan terutama pada skala data yang besar. MySQL secara otomatis membuat indeks pada kolom yang dideklarasikan sebagai foreign key jika indeks belum ada, sebuah perilaku yang dalam banyak kasus menguntungkan karena mengakselerasi operasi JOIN antara tabel induk dan anak. Namun demikian, setiap operasi INSERT, UPDATE, atau DELETE pada tabel dengan foreign key memerlukan lookup tambahan ke tabel referensi untuk memvalidasi constraint, yang menambah overhead pada operasi write — sebuah trade-off yang harus diperhitungkan dalam desain sistem dengan throughput write yang sangat tinggi. Pada skenario migrasi data massal atau seeding database awal, foreign key constraint dapat dinonaktifkan sementara menggunakan SET FOREIGN_KEY_CHECKS = 0 untuk mengakselerasi proses, kemudian diaktifkan kembali setelah data konsisten dimuat. Strategi perancangan database yang matang harus mempertimbangkan secara holistik antara kebutuhan integritas data, karakteristik pola akses (read-heavy vs write-heavy), dan target performa sistem untuk menentukan skema foreign key yang paling optimal bagi kebutuhan spesifik aplikasi yang dikembangkan.', '6a2d7e4d528a6.jpg', 'Sabtu, 13 Juni 2026 | 19:29');

-- ----------------------------
-- Table structure for cache
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  INDEX `cache_expiration_index`(`expiration` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache
-- ----------------------------

-- ----------------------------
-- Table structure for cache_locks
-- ----------------------------
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE `cache_locks`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  INDEX `cache_locks_expiration_index`(`expiration` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cache_locks
-- ----------------------------

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `cancelled_at` int NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_batches
-- ----------------------------

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED NULL DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `jobs_queue_index`(`queue` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jobs
-- ----------------------------

-- ----------------------------
-- Table structure for kategori_artikel
-- ----------------------------
DROP TABLE IF EXISTS `kategori_artikel`;
CREATE TABLE `kategori_artikel`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_nama_kategori`(`nama_kategori` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kategori_artikel
-- ----------------------------
INSERT INTO `kategori_artikel` VALUES (1, 'Tutorial', 'Artikel panduan langkah demi langkah');
INSERT INTO `kategori_artikel` VALUES (2, 'Database', 'Artikel seputar pengelolaan database');
INSERT INTO `kategori_artikel` VALUES (3, 'Web Design', 'Artikel tentang desain antarmuka web');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '0001_01_01_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '0001_01_01_000001_create_cache_table', 1);
INSERT INTO `migrations` VALUES (3, '0001_01_01_000002_create_jobs_table', 1);

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for penulis
-- ----------------------------
DROP TABLE IF EXISTS `penulis`;
CREATE TABLE `penulis`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_depan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_belakang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_user_name`(`user_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of penulis
-- ----------------------------
INSERT INTO `penulis` VALUES (2, 'Ahmad', 'Fauzi', 'ahmad_f', '$2y$12$17QvpBxjFUL.yAHzAJQa4esAZXp3TE3KsROmAFw45UKcbhq2iZT16', 'default.png');
INSERT INTO `penulis` VALUES (3, 'Siti', 'Rahayu', 'siti_r', '$2y$12$yN.l/4x1OuUnfQ7vojEro.XiT4SFomzexKqo2ilJr37rQYA825LMG', 'default.png');
INSERT INTO `penulis` VALUES (4, 'Budi', 'Santoso', 'budi_s', '$2y$12$Plvx9Rjj8cDLWPHgNF0Hnu5Z3ZN0H0X2zLiDIzo4O5N8/BnBs9U9G', 'default.png');
INSERT INTO `penulis` VALUES (5, 'Ahmad', 'Daffa', 'ahmad_d', '$2y$12$uW8QG7kL0xIbjnsLW4q39.0VyyIi8CPPrPSBupqGXx7fdfEe7MS6a', '1781367073_Kitty.png');

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id` ASC) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('FPoyOUb2UyishKvInKYxZQT8OB6tgnjwbacFx8yO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3ZnZUp1WTA1UjZoVVlmWmJXSTZJUEhDYXpobFRZeE8zZGp1TWV2RCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781358438);
INSERT INTO `sessions` VALUES ('h7AIxPnAnOl8pRQyAfMOdtADNe9kfq9rorQyBhAS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.124.2 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialozOWFFZ0dYYzJzV0Z1amZyazhpS0tWbm4wTTdKSDlRbWtlNURaRyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czoxMzoiZ3Vlc3QuYmVyYW5kYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1781358185);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
