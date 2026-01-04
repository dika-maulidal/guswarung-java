CREATE DATABASE guswarungdb_java;
USE guswarungdb_java;

-- Tabel Users
CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user'
);

-- Tabel Menus
CREATE TABLE menus (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(150) NOT NULL,
    deskripsi TEXT,
    harga DOUBLE NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    kategori ENUM('makanan', 'minuman', 'addon') NOT NULL,
    gambar VARCHAR(255),
    is_popular TINYINT(1) DEFAULT 0, -- 1 untuk true, 0 untuk false
    diskon_persen INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabel Orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    customer_phone VARCHAR(20),
    customer_address TEXT,
    notes TEXT,
    payment_method VARCHAR(50),
    total_amount BIGINT,
    payment_proof_path VARCHAR(255),
    status VARCHAR(50) DEFAULT 'Menunggu Pembayaran',
    user_id BIGINT UNSIGNED,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel Order Details
CREATE TABLE order_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    menu_id INT,
    product_name VARCHAR(255),
    quantity INT,
    price_per_unit BIGINT,
    total_price BIGINT,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

-- Inventaris
CREATE TABLE IF NOT EXISTS `inventaris` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `minimal_stock` int(11) NOT NULL,
  `status` enum('aman','rendah') NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;