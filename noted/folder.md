GusWarung/
├── src/
│ └── java/
│ ├── config/
│ │ └── Koneksi.java # Pengaturan JDBC MySQL
│ ├── controllers/
│ │ ├── AdminOrderServlet.java # Controller Manajemen Pesanan Admin
│ │ ├── MenuServlet.java # Controller Katalog Produk (sell)
│ │ ├── OrderServlet.java # Controller Proses Checkout User
│ │ └── LogoutServlet.java # Controller Handle Sesi Keluar
│ └── models/
│ ├── Menu.java # Entity Class Produk
│ ├── MenuDAO.java # Data Access Object untuk Menu
│ ├── Order.java # Entity Class Pesanan Utama
│ ├── OrderDAO.java # Data Access Object untuk Pesanan
│ └── OrderDetail.java # Entity Class Item Pesanan
├── web/
│ ├── admin/
│ │ ├── orders/
│ │ │ ├── index.jsp # Daftar Pesanan (View Admin)
│ │ │ └── show.jsp # Detail & Update Status Pesanan
│ │ ├── products/
│ │ │ └── index.jsp # Manajemen CRUD Produk (Opsional)
│ │ └── dashboard.jsp # Panel Utama Admin
│ ├── css/
│ │ └── style-penjualan.css # Custom Styling Proyek
│ ├── img/
│ │ ├── logo/ # Logo GusWarung
│ │ ├── makanan/ # Gambar Produk Makanan
│ │ └── minuman/ # Gambar Produk Minuman
│ ├── uploads/
│ │ └── payments/ # Bukti Bayar (.jpg, .png) - BUAT MANUAL
│ ├── WEB-INF/
│ │ ├── lib/ # Tempat menaruh 5 file .jar library kamu
│ │ └── web.xml # Konfigurasi Servlet Mapping
│ ├── index.jsp # Landing Page
│ ├── sell.jsp # Katalog Belanja (User View)
│ ├── keranjang.jsp # Checkout & Upload Bukti (User View)
│ ├── login.jsp # Form Masuk
│ └── register.jsp # Form Daftar Akun
├── nbproject/ # Konfigurasi NetBeans (Jangan di-edit)
└── build.xml # Ant Script untuk Build Proyek
