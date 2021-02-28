-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2021 pada 09.26
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peternakan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_berita`
--

CREATE TABLE `tb_berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_berita`
--

INSERT INTO `tb_berita` (`id_berita`, `judul`, `deskripsi`, `foto`) VALUES
(1, 'Kementan Bakal Rilis Aturan Sektor Perunggasan untuk Setarakan Usaha', 'Kementerian Pertanian (Kementan) akan menerbitkan aturan baru untuk melengkapi atau menegakkan pelaksanaan aturan sektor perunggasan yang sudah ada. Aturan ini diharapkan mampu menciptakan kesetaraan bisnis baik untuk peternak mandiri maupun pelaku industri.  Direktur Jenderal Peternakan dan Kesehatan Hewan, Kementan, Nasrullah mengatakan, salah fokus dalam aturan tersebut yakni terkait pemberian sanksi.  Ia mengakui, Kementan masih kurang dalam hal kewenangan dan administratif, lantaran lebih berfokus pada masalah produksi. \r\n\"Kita tahu aturan main sudah ada, tapi yang kurang adalah penegakan dari pelaksanaan aturan tersebut,\" kata Nasrullah dalam webinar Pataka, Jumat (4/9).\r\nSalah satu peraturan tentang perunggasan tercantum dalam Peraturan Menteri Pertanian Nomor 32 Tahun 2017 tentang Penyediaan, Peredaran, dan Pengawasan Ayam Ras dan Telur.\r\nNasrullah mengatakan, aturan itu menyebutkan sanksi yang diberikan dapat berupa pencabutan usaha. Namun, kewenangan pencabutan usaha tidak bisa dilakukan oleh Kementan, lamtaran penerbitan izin tidak masuk wilayah kerjanya. Contoh lainnya, Peraturan Menteri Pertanian (Permentan) No 32/2017 tentang Penyediaan, Peredaran, dan Pengawasan Ayam Ras dan Telur Konsumsi. Aturan menyebutkan pengusaha dan peternak yang memproduksi Ayam Ras potong (livebird) dengan kapasitas produksi minimal 300 ribu ekor per minggu wajib mempunyai Rumah Potong Hewan Unggas (RPHU) yang memiliki fasilitas rantai dingin. Namun, aturan tersebut tidak mengatur kapasitas minimal RPHU yang harus dimiliki pengusaha atau peternak. Dengan demikian, pemerintah merancang atura baru yang akan diupayakan terbit pada Januari 2021. Menurutnya, aturan baru tersebut akan menjadi solusi permanen yang disepakati secara bersama. Dengan aturan ini,  Kementan bisa melakukan penindakan kepada pihak yang melanggar aturan. Nasrullah juga memastikan, aturan bakal berlaku bagi peternak dan perusahaan perunggasan terintegrasi. Hal ini untuk menciptakan kesetaraan dalam bisnis. \"Intinya menjadi penegasan dari pemerintah terkait aturan main yang disepakati,\" ujar dia. Untuk diketahui, sektor perunggasan kerap menghadapi persoalan berupa fluktuasi harga ayam yang disebabkan oleh melimpahnya produksi maupun masalah lain seperti tingginya biaya produksi. Tekanan ini kerap menyebabkan peternak, khususnya peternak mandiri merugi atau bahkan gulung tikar. \r\n', 'berita1.jpg'),
(2, 'Berkat Program Sikomandan, Kebuntingan Sapi dan Kerbau di Sumut Lewati Target', 'Sapi dan Kerbau Komoditas Andalan Negeri atau yang lebih dikenal dengan Sikomandan merupakan salah satu program utama Kementerian Pertanian (Kementan) melalui Direktorat Jenderal Peternakan dan Kesehatan Hewan (Ditjen PKH). Program ini adalah aktivitas yang berkelanjutan dan berkesinambungan dalam rangka meningkatkan penyediaan daging di dalam negeri.\r\n\r\nSelain itu, program Sikomandan ini juga merupakan serangkaian aktivitas yang dirangkai secara bersinergi mulai dari upaya peningkatan kelahiran yang diikuti dengan peningkatan produktivitas ternak sapi dan kerbau dalam menghasilkan pangan, khususnya daging yang aman dan berkualitas bagi masyarakat Indonesia.\r\n\r\nSebagai program utama, Sikomandan telah diluncurkan oleh Menteri Pertanian (Mentan) pada 20 Februari 2020 lalu di Kabupaten Serdang Bedagai, Sumatera Utara. Pemilihan Sumatera Utara menjadi lokasi peluncuran ini sekaligus menunjukan bahwa potensi dan antusiasme peternak di Sumatera Utara khususnya Kabupaten Serdang Bedagai cukup besar.\r\n\r\n\"Populasi sapi potong di Provinsi Sumatera Utara menduduki urutan ke-6 di Indonesia dengan jumlah mencapai 1 juta ekor, dengan struktur populasi ternak betina mencapai 65,13 persen,\" ujar Dirjen PKH, I Ketut Diarmita, Selasa (23/6).\r\n\r\nBerdasarkan data Badan Pusat Statistik (BPS) pada Struktur Ongkos Usaha Ternak (SOUT), sebagian besar kepemilikan sapi potong merupakan usaha dalam skala besar. Rinciannya, 70,52 persen kepemilikan sapi potong dalam skala usaha besar, dan sisanya atau 25,12 persen merupakan skala menengah, serta skala kecil yaitu sebanyak 3,81 persen.\r\n\r\nUntuk sistem pemeliharaan, sudah sebanyak 75,97 persen yang telah dikandangkan, dengan sebagian besar tujuan pemeliharaan untuk pengembangbiakan, yaitu mencapai 88,95 persen.', 'berita2.jpg'),
(3, 'Kadis Dinas Hortikultura dan Peternakan Kalteng Bantah Kabar Food Estate Gagal Panen', 'Kepala Dinas (kadis) Hortikulturadan Peternakan Provinsi Kalimantan Tengah ( Kalteng) Sunarti membantah kabar beredar yang mengatakan bahwa program  food estate pemerintah di Kalteng mengalami gagal panen. Dia mengatakan, penurunan produksi hanya pada sebagian kecil lahan dan sama sekali tidak mengurangi rata-rata produktivitas lahan yang mencapai di atas 5 ton per hektar (ha). \"Kalau saya bilang yang turun itu lebih karena panen paksa karena belum saatnya panen, akibat roboh diterpa angin dan hujan. Tapi ini masukan buat kami agar ke depan bisa kami antisipasi,\" katanya seperti keterangan tertulis yang diterima Kompas.com, Rabu (3/2/2021). Sunarti berharap, para petani tetap melakukan produksi dengan mengedepankan pendekatan pola tanam modern melalui alat mesin pertanian (alsintan) dan pendampingan petugas penyuluh.', 'berita3.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kamus`
--

CREATE TABLE `tb_kamus` (
  `id_kamus` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_kamus`
--

INSERT INTO `tb_kamus` (`id_kamus`, `nama`, `deskripsi`) VALUES
(1, 'ADG', 'Average Daily Gain (ADG) merupakan nilai rata-rata pertambahan bobot badan harian hewan ternak. ADG ini diperoleh dengan mengurangi berat akhir dengan berat awal kemudian membaginya dengan lama pemeliharaan (hari). Para peternak biasanya menggunakan ADG sebagai parameter keberhasilan dari manajemen usaha yang telah dilakukan. Seperti misalnya, pada salah satu jenis sapi lokal yaitu sapi Bali memiliki ADG berkisar 1 sampai 1,5 kg per hari. Apabila ADG di bawah angka tersebut, maka terdapat kekeliruan terlebih pada manajemen pakannya. '),
(2, 'BETN', 'Bahan Ekstrak Tanpa Nitrogen (BETN) merupakan karbohidrat yang mudah larut dalam larutan asam dan basa serta memiliki daya cerna yang tinggi. BETN ini menjadi sumber energi yang sangat baik bagi hewan ternak.'),
(3, 'Breeding', 'Breeding dapat diartikan sebagai usaha pengembangbiakan hewan ternak yang bertujuan menghasilkan keturunan. Biasanya hasil keturunan yang diinginkan adalah yang memiliki mutu genetik lebih baik dari generasi sebelumnya sehingga dalam breeding terdapat berbagai unsur yang sangat kompleks dan sistematis yang harus diperhatikan.'),
(4, 'Bungkil', 'Bungkil adalah limbah atau ampas dari bijian-bijian seperti kacang, kedelai, kelapa, dll yang sudah diambil minyaknya.'),
(5, 'Calf', 'Calf merupakan anak sapi yang berusia 6 sampai 9 bulan. Anak sapi jantan biasa disebut dengan Bull calf sedangkan betina Heifer Calf.'),
(6, 'Estrus', 'Estrus yang juga sering disebut dengan istilah birahi merupakan kondisi dimana hewan betina siap menerima pejantan untuk melakukan kopulasi.'),
(7, 'Fattening', ' Fattening atau biasa disebut juga dengan Feedlot merupakan usaha penggemukan ternak dengan berprinsip untuk mendapatkan keuntungan yang maksimal. Program penggemukan ini dilakukan dengan cara memberi pakan dalam jumlah yang mencukupi kebutuhan hewan ternak selama periode tertentu untuk mempercepat dan meningkatkan produksi daging. '),
(8, 'Inseminasi buatan', 'Inseminasi buatan (IB)/ kawin suntik adalah suatu cara atau teknik untuk memperbaiki mutu genetika ternak, dimana bibit pejantan unggul tidak harus dibawa ke tempat yang dibutuhkan. Inseminasi buatan dilakukan dengan memasukkan sperma ternak jantan yang telah dicairkan dan telah diproses terlebih dahulu ke dalam saluran alat kelamin ternak betina dengan menggunakan metode dan alat khusus yang disebut \"insemination gun\". Cara ini sangat efektif untuk mengurangi biaya operasional khususnya transportasi, mengoptimalkan penggunaan bibit pejantan unggul secara lebih luas dalam jangka waktu yang lebih lama, meningkatkan angka kelahiran dengan cepat dan teratur mencegah penularan/ penyebaran penyakit kelamin.'),
(9, 'Karkas', 'Karkas merupakan bagian dari ternak yang telah disembelih. Tanpa kepala, kaki, kulit dan jeroan yang hanya berupa daging yang masih melekat pada tulangnya. Karkas ini bisa dijumpai di rumah potong hewan maupun pasar daging yang dipajang dengan posisi menggantung terbalik/ bagian leher berada di bawah.'),
(10, 'Laktasi', 'Laktasi dapat diartikan sebagai masa menyusui pada hewan ternak.'),
(11, 'Pakan Fermentasi', 'Pakan fermentasi merupakan pakan ternak hasil dari proses pemecahan senyawa organik menjadi senyawa yang lebih sederhana dengan bantuan suatu mikroorganisme. Pakan yang telah difermentasi selain lebih mudah dicerna oleh ternak, juga lebih mudah dalam penyimpanannya.'),
(12, 'Palatabilitas', 'Palatabilitas adalah tingkat kesukaan konsumsi yang ditunjukkan oleh ternak pada suatu bahan pakan yang diberikan. Mulai dari tekstur, warna, rasa, hingga aroma sangat mempengaruhi palatabilitas ini. Tingkat palatabilitas bisa diketahui dengan cara memberikan dua atau lebih pakan kepada ternak. Pakan yang memiliki palatabilitas yang baik, maka secara otomatis dapat menimbulkan selera makan yang tinggi dan langsung dimakan oleh ternak.'),
(13, 'Protein kasar', 'Protein kasar adalah salah satu nutrisi utama yang diperlukan ternak agar bisa tumbuh, berkembang, berproduksi dan bereproduksi secara baik.'),
(14, 'Ransum', 'Ransum adalah pakan jadi dari campuran beberapa jenis pakan yang diberikan untuk seekor ternak selama sehari semalam. Ransum harus mengandung zat gizi yang dibutuhkan ternak, mencakup untuk kebutuhan hidup pokok, produksi maupun reproduksi. Ransum ternak ruminansia (sapi, kambing, domba, dll) pada umumnya terdiri dari pakan hijauan dan konsentrat.'),
(15, 'Ras', 'Penggolongan jenis hewan ternak yang didasari oleh ciri-ciri fisik seperti postur tubuh, warna bulu, bentuk telinga, dan masih banyak lagi. '),
(16, 'Rearing', 'Rearing merupakan program pembesaran dan pemeliharaan sapi perah betina sejak lahir secara terprogram. Tujuan dari rearing ini adalah untuk mendapatkan sapi betina yang memiliki bentuk ambing dan pencernaan yang baik serta kaki kuat agar dapat menghasilkan produksi susu yang berkualitas. '),
(17, 'Rumen', 'Istilah dalam peternakan ruminansia selanjutnya adalah rumen. Rumen atau perut besar ini merupakan salah satu bagian lambung ternak ruminansia/ memamah biak yang didalamnya terdapat populasi mikroba yang cukup banyak jumlahnya. Mikroba tersebut berfungsi sebagai fermentor dari bahan pakan yang dimakan oleh ternak.'),
(18, 'Serat.', 'Serat adalah jenis mineral yang terkandung dalam bahan pakan yang tidak mudah dicerna dan diserap oleh tubuh ternak. Hampir sama seperti karbohidrat, serta mampu memberikan energi pada tubuh, namun serat lebih rendah kalori. Pakan yang baik adalah pakan yang memiliki serat kasar yang rendah.'),
(19, 'Silase', 'Silase adalah pakan hijauan ternak yang difermentasi dalam keadaan anaerobik (tanpa udara) dengan cara diawetkan dan disimpan dalam kantong plastik kedap udara/ silo/ drum. Beberapa hijauan yang dapat digunakan berupa rerumputan (dari suku Gramineae), termasuk juga jagung, sorgum, dan serealia lainnya dengan memanfaatkan seluruh bagian tanaman, hijauan kelapa sawit, dll.'),
(20, 'TDN', 'Total Digestible Nutrient (TDN) atau dalam Bahasa Indonesia berarti total nutrien tercerna merupakan angka yang menunjukkan jumlah zat makanan dari bahan makanan yang dapat dicerna oleh hewan ternak. Zat makanan itu seperti protein, karbohidrat, serat, dan lemak. Satuan dari TDN ini sendiri berupa persentase (%). Semakin besar persen TDN nya maka semakin baik, karena secara otomatis kandungan nutrisi dapat tercerna lebih banyak oleh hewan ternak sehingga pertumbuhan/ penggemukan badannya pun menjadi lebih cepat. '),
(21, 'Ternak perah', 'Ternak perah adalah ternak ruminansia yang dapat menghasilkan susu. Beberapa diantaranya meliputi sapi perah, kerbau perah, dan kambing perah. '),
(22, 'Vaksin', 'Vaksin merupakan suatu zat yang biasa diberikan baik kepada hewan ternak untuk mengebalkan sistem imun terhadap serangan mikroorganisme penyebab penyakit.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peternakan`
--

CREATE TABLE `tb_peternakan` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_peternakan`
--

INSERT INTO `tb_peternakan` (`id`, `judul`, `foto`) VALUES
(1, 'padang mangateh payakumbuh', 'foto1.jpg'),
(2, 'padang mangateh payakumbuh', 'foto2.jpg'),
(3, 'padang mangateh payakumbuh', 'foto3.jpg'),
(4, 'padang mangateh payakumbuh', 'foto4.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`) VALUES
(1, 'admin', '123', 'admin'),
(2, 'ijal', 'ijal', 'ijal');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indeks untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  ADD PRIMARY KEY (`id_kamus`);

--
-- Indeks untuk tabel `tb_peternakan`
--
ALTER TABLE `tb_peternakan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_berita`
--
ALTER TABLE `tb_berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_kamus`
--
ALTER TABLE `tb_kamus`
  MODIFY `id_kamus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_peternakan`
--
ALTER TABLE `tb_peternakan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
