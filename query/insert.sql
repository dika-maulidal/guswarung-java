-- 1. Bersihkan tabel terlebih dahulu (Opsional, seperti DB::table('menus')->truncate())
TRUNCATE TABLE menus;

-- 2. Masukkan data menu
INSERT INTO menus (nama, deskripsi, harga, stok, kategori, gambar, is_popular, diskon_persen, created_at, updated_at) VALUES
-- MENU MAKANAN
('Bubur Ayam Dewasa', 'Bubur komplit dengan suwiran ayam & topping melimpah.', 14000, 25, 'makanan', 'img/makanan/BuburKomplit.jpg', 1, 10, NOW(), NOW()),
('Bubur Ayam Anak', 'Bubur porsi kecil, cocok untuk anak tanpa topping pedas.', 11000, 20, 'makanan', 'img/makanan/BuburAnak.jpg', 0, 0, NOW(), NOW()),
('Bubur Polos', 'Bubur original gurih tanpa suwiran ayam atau topping.', 8000, 15, 'makanan', 'img/makanan/BuburPolos.jpg', 0, 0, NOW(), NOW()),
('Nasi Kuning Ayam Goreng', 'Nasi kuning wangi disajikan dengan ayam goreng renyah.', 13000, 35, 'makanan', 'img/makanan/NasiKunGor.jpg', 1, 0, NOW(), NOW()),
('Nasi Kuning Ayam Urap', 'Nasi kuning, ayam bakar, dan sambal urap kelapa pedas.', 15000, 10, 'makanan', 'img/makanan/NasiKunUrap.jpg', 0, 0, NOW(), NOW()),
('Nasi Kuning Telur Bali', 'Nasi kuning wangi dengan telur bumbu Bali pedas manis.', 13000, 8, 'makanan', 'img/makanan/NasiKunTelur.jpg', 0, 0, NOW(), NOW()),
('Nasi Ayam Bakar Urap', 'Ayam bakar dengan bumbu manis gurih khas tradisional.', 15000, 5, 'makanan', 'img/makanan/AyamBakarUrap.jpg', 1, 0, NOW(), NOW()),
('Nasi Ayam Laos', 'Ayam goreng berbumbu laos khas Jawa dengan aroma wangi.', 15000, 30, 'makanan', 'img/makanan/AyamLaos.jpg', 0, 0, NOW(), NOW()),
('Nasi Ayam Kremes', 'Ayam goreng renyah dengan taburan kremes gurih khas rumahan.', 15000, 18, 'makanan', 'img/makanan/AyamKremes.jpg', 0, 20, NOW(), NOW()),
('Nasi Ayam Karage', 'Nasi dengan potongan ayam karage renyah ala Jepang.', 15000, 12, 'makanan', 'img/makanan/NasiKarage.jpg', 0, 0, NOW(), NOW()),

-- MENU MINUMAN
('Es Teh Manis', 'Teh hitam segar dingin dengan gula pas takaran yang mantap.', 3000, 50, 'minuman', 'img/minuman/EsTeh.jpg', 0, 0, NOW(), NOW()),
('Teh Hangat', 'Teh melati hangat dengan aroma menenangkan dan sedikit gula.', 3000, 45, 'minuman', 'img/minuman/TehHangat.jpg', 0, 50, NOW(), NOW()),
('Es Jeruk', 'Perpaduan jeruk peras segar dan es batu yang menyegarkan dahaga.', 5000, 40, 'minuman', 'img/minuman/EsJeruk.jpg', 1, 0, NOW(), NOW()),
('Jeruk Hangat', 'Sari jeruk peras hangat dengan sedikit tambahan madu alami.', 5000, 35, 'minuman', 'img/minuman/JerukHangat.jpg', 0, 0, NOW(), NOW()),

-- MENU ADD-ONS
('Telur Asin', 'Telur asin gurih kualitas terbaik dengan cita rasa khas.', 5000, 20, 'addon', 'img/tambahan/TelurAsin.jpg', 1, 0, NOW(), NOW()),
('Sate Puyuh', 'Sate telur puyuh empuk dengan bumbu manis gurih kecap.', 4000, 25, 'addon', 'img/tambahan/SatePuyuh.jpg', 0, 0, NOW(), NOW()),
('Sate Usus', 'Sate usus ayam yang lembut dengan balutan bumbu kecap manis.', 3000, 30, 'addon', 'img/tambahan/SateUsus.jpg', 0, 0, NOW(), NOW());

-- Insert Stok
INSERT INTO `inventaris` (`id`, `name`, `quantity`, `unit`, `minimal_stock`, `status`, `price`, `created_at`, `updated_at`) VALUES
	(1, 'ayam', 10, 'kg', 5, 'aman', 34000.00, '2025-12-05 08:49:56', '2025-12-07 02:46:26'),
	(3, 'air galon', 4, 'galon', 5, 'aman', 5000.00, '2025-12-05 08:51:00', '2025-12-05 09:09:57'),
	(4, 'bawang merah', 4, 'kg', 5, 'rendah', 50000.00, '2025-12-05 08:51:53', '2025-12-05 09:18:59'),
	(5, 'Gula', 100, 'kg', 5, 'rendah', 16000.00, '2025-12-05 09:09:07', '2025-12-05 09:10:31'),
	(6, 'Garam', 50, 'kg', 5, 'aman', 3000.00, '2025-12-06 00:39:43', '2025-12-06 00:39:43'),
	(7, 'Bawang Putih', 10, 'kg', 5, 'aman', 34000.00, '2025-12-06 00:50:22', '2025-12-06 00:50:22'),
	(8, 'Beras', 20, 'kg', 5, 'aman', 13500.00, '2025-12-06 00:51:54', '2025-12-06 00:51:54'),
	(9, 'Minyak Goreng', 20, 'liter', 5, 'aman', 18000.00, '2025-12-06 00:52:24', '2025-12-06 00:52:24'),
	(10, 'Tepung Terigu', 3, 'kg', 5, 'rendah', 12000.00, '2025-12-06 00:54:37', '2025-12-06 01:14:06'),
	(11, 'Usus Ayam', 10, 'kg', 5, 'aman', 17000.00, '2025-12-06 00:55:09', '2025-12-06 00:55:09'),
	(12, 'Telur Ayam', 10, 'kg', 5, 'aman', 27000.00, '2025-12-06 00:55:48', '2025-12-06 00:55:48'),
	(13, 'Telur Bebek', 10, 'lkg', 5, 'aman', 35000.00, '2025-12-06 00:56:12', '2025-12-06 00:56:12'),
	(14, 'Telur Puyuh', 10, 'kg', 5, 'aman', 28000.00, '2025-12-06 00:56:35', '2025-12-06 00:56:35'),
	(15, 'Cabai Rawit', 10, 'kg', 5, 'aman', 50000.00, '2025-12-06 00:57:21', '2025-12-06 00:57:21'),
	(16, 'Cabai Merah Keriting', 10, 'kg', 5, 'aman', 30000.00, '2025-12-06 00:57:42', '2025-12-06 00:57:42'),
	(17, 'Kentang', 10, 'kg', 5, 'aman', 19000.00, '2025-12-06 00:58:13', '2025-12-06 00:58:13'),
	(18, 'Tomat', 10, 'kg', 5, 'aman', 10000.00, '2025-12-06 00:58:37', '2025-12-06 00:58:37'),
	(19, 'Timun', 10, 'kg', 5, 'aman', 10000.00, '2025-12-06 01:00:13', '2025-12-06 01:00:13'),
	(20, 'Selada', 12, 'kg', 5, 'aman', 25000.00, '2025-12-06 01:00:36', '2025-12-06 01:00:36'),
	(21, 'Jeruk Peras', 13, 'kg', 5, 'aman', 12000.00, '2025-12-06 01:01:22', '2025-12-06 01:01:22'),
	(22, 'Laos', 13, 'kg', 5, 'aman', 12000.00, '2025-12-06 01:01:40', '2025-12-06 01:01:40'),
	(23, 'Kelapa Parut', 20, 'Biji', 5, 'aman', 8000.00, '2025-12-06 01:02:47', '2025-12-06 01:02:47'),
	(24, 'Santan Instan', 25, 'pcs', 5, 'aman', 3000.00, '2025-12-06 01:03:20', '2025-12-06 01:03:20'),
	(25, 'Bumbu Racik', 30, 'pcs', 5, 'aman', 2000.00, '2025-12-06 01:04:43', '2025-12-06 01:04:43'),
	(26, 'Kecap Manis', 10, 'botol', 5, 'aman', 23000.00, '2025-12-06 01:05:25', '2025-12-06 01:05:25'),
	(27, 'Saos Tomat', 15, 'botol', 5, 'aman', 20000.00, '2025-12-06 01:06:20', '2025-12-06 01:06:20'),
	(28, 'Penyedap Rasa', 13, 'renceng', 5, 'aman', 5500.00, '2025-12-06 01:09:00', '2025-12-06 01:09:00'),
	(29, 'Bawking Powder', 7, 'botol', 5, 'aman', 6000.00, '2025-12-06 01:09:55', '2025-12-06 01:09:55'),
	(30, 'Kacang Kedelai', 10, 'kg', 5, 'aman', 13000.00, '2025-12-06 01:10:52', '2025-12-06 01:10:52'),
	(33, 'Teh', 4, 'kotak', 5, 'rendah', 6500.00, '2025-12-07 00:23:48', '2025-12-07 02:21:35'),
	(34, 'Kerupuk Udang Mentah', 15, 'kg', 5, 'aman', 16000.00, '2025-12-12 01:56:24', '2025-12-12 01:56:24'),
	(35, 'Kecap Asin', 6, 'botol', 5, 'rendah', 15000.00, '2025-12-12 01:57:14', '2025-12-12 01:57:14');