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