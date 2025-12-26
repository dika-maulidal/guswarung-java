<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, models.Menu, java.text.NumberFormat" %>
<%
    // 1. Ambil data dari Servlet (List yang sudah difilter di Controller)
    List<Menu> makanan = (List<Menu>) request.getAttribute("makanan");
    List<Menu> minuman = (List<Menu>) request.getAttribute("minuman");
    List<Menu> addons = (List<Menu>) request.getAttribute("addons");
    
    // Gabungkan semua menu ke dalam satu list utama agar JavaScript Filter bekerja maksimal
    List<Menu> allMenu = new ArrayList<>();
    if(makanan != null) allMenu.addAll(makanan);
    if(minuman != null) allMenu.addAll(minuman);
    if(addons != null) allMenu.addAll(addons);
    
    String userName = (String) session.getAttribute("userName"); 
    NumberFormat nf = NumberFormat.getInstance(new Locale("id", "ID"));
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Menu Penjualan - GusWarung</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="css/style-penjualan.css" />
</head>

<body style="background-color: #f8f9fa;">

    <nav class="fixed-top navbar navbar-expand-lg shadow-lg" style="background-color: #ffc107">
        <div class="container">
            <a class="navbar-brand text-white fw-bold" href="home.jsp">
                <img src="logo/logo_guswarung tb.png" width="40" height="40"> GusWarung
            </a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item"><a class="nav-link text-black" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-black fw-bold" href="sell">Penjualan</a></li>
                    <% if(userName != null) { %>
                        <li class="nav-item fw-bold ps-3 text-dark"><i class="bi bi-person-circle"></i> <%= userName %></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <header style="padding-top: 130px; padding-bottom: 40px; background: white; text-align: center;">
        <div class="container" data-aos="fade-up">
            <h1 class="display-5 fw-bold text-dark">Daftar Menu Kami</h1>
            <div class="input-group mx-auto mt-4" style="max-width: 500px">
                <span class="input-group-text bg-white border-end-0"><i class="bi bi-search"></i></span>
                <input type="text" id="searchInput" class="form-control border-start-0 ps-0" placeholder="Cari menu favorit...">
            </div>
        </div>
    </header>

    <div class="container mt-4 mb-5" data-aos="fade-up">
        <div class="d-flex justify-content-center flex-wrap gap-2" id="menu-filters">
            <button class="btn btn-warning active" data-filter="all">Semua Menu</button>
            <button class="btn btn-outline-warning" data-filter="makanan">Makanan</button>
            <button class="btn btn-outline-warning" data-filter="minuman">Minuman</button>
            <button class="btn btn-outline-warning" data-filter="tambahan">Add-ons</button>
            <button class="btn btn-outline-warning" data-filter="populer">Populer</button>
            <button class="btn btn-outline-warning" data-filter="diskon">Diskon</button>
        </div>
    </div>

    <div class="container my-5">
        <div class="row g-4" id="menu-list-container">
            <% 
                if (allMenu != null && !allMenu.isEmpty()) { 
                    for(Menu m : allMenu) { 
                        double hargaFinal = m.getHarga() * (1 - (m.getDiskon() / 100.0));
                        
                        // LOGIKA GAMBAR SAMPLE BERDASARKAN KATEGORI
                        String cat = (m.getKategori() != null) ? m.getKategori().toLowerCase() : "";
                        String imagePath = "";

                        if (cat.contains("makanan")) {
                            imagePath = "/img/makanan/sample.png";
                        } else if (cat.contains("minuman")) {
                            imagePath = "/img/minuman/sample.png";
                        } else if (cat.contains("addon") || cat.contains("tambahan")) {
                            imagePath = "/img/tambahan/sample.png";
                        } else {
                            imagePath = "/img/makanan/sample.png"; // Default fallback
                        }
                        
                        String finalImgUrl = contextPath + imagePath;
            %>
                <div class="col-md-4 col-sm-6 menu-item" 
                     data-category="<%= cat %>"
                     data-popular="<%= m.getIsPopular() %>"
                     data-discount="<%= (m.getDiskon() > 0) %>">
                    
                    <div class="card h-100 shadow-sm border-0 position-relative">
                        <% if(m.getIsPopular()) { %> 
                            <span class="badge bg-danger position-absolute m-2 top-0 start-0 z-1">⭐ Populer</span> 
                        <% } %>
                        
                        <img src="<%= finalImgUrl %>" class="card-img-top" alt="Sample" style="height:220px; object-fit:cover;">
                        
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title fw-bold text-dark mb-1"><%= m.getNama() %></h5>
                            <p class="card-text text-muted small flex-grow-1"><%= m.getDeskripsi() %></p>
                            
                            <div class="mb-2">
                                <% if(m.getStok() > 0) { %>
                                    <small class="text-success fw-bold"><i class="bi bi-box-seam"></i> Tersedia: <%= m.getStok() %></small>
                                <% } else { %>
                                    <small class="text-danger fw-bold"><i class="bi bi-x-circle"></i> Habis</small>
                                <% } %>
                            </div>

                            <div class="price-group my-3">
                                <% if(m.getDiskon() > 0) { %>
                                    <div class="d-flex align-items-center gap-2">
                                        <span class="text-decoration-line-through text-muted small">Rp <%= nf.format(m.getHarga()) %></span>
                                        <span class="badge bg-danger p-1 small"><%= m.getDiskon() %>% OFF</span>
                                    </div>
                                    <span class="fw-bold text-danger fs-4">Rp <%= nf.format(hargaFinal) %></span>
                                <% } else { %>
                                    <span class="fw-bold text-warning fs-4">Rp <%= nf.format(m.getHarga()) %></span>
                                <% } %>
                            </div>

                            <button class="btn btn-warning text-white w-100 fw-bold" 
                                    onclick="addToCart(<%= m.getId() %>)" 
                                    <%= (m.getStok() <= 0 ? "disabled" : "") %>>
                                <i class="bi bi-cart-plus-fill me-2"></i> Tambah Ke Keranjang
                            </button>
                        </div>
                    </div>
                </div>
            <% 
                    } 
                } else { 
            %>
                <div class="col-12 text-center py-5">
                    <p class="text-muted">Maaf, menu tidak ditemukan atau database kosong.</p>
                </div>
            <% } %>
        </div>
    </div>

    <div class="position-fixed bottom-0 end-0 m-4 z-3">
        <button class="btn btn-danger rounded-circle shadow-lg p-3" style="width:65px; height:65px;">
            <i class="bi bi-cart-fill fs-3"></i>
            <span id="cart-count" class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-dark">0</span>
        </button>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 800, once: true });

        // LOGIKA FILTER JAVASCRIPT
        const filterButtons = document.querySelectorAll('#menu-filters button');
        const items = document.querySelectorAll('.menu-item');

        filterButtons.forEach(btn => {
            btn.addEventListener('click', () => {
                filterButtons.forEach(b => b.classList.replace('btn-warning', 'btn-outline-warning'));
                btn.classList.replace('btn-outline-warning', 'btn-warning');
                
                const filter = btn.getAttribute('data-filter');
                items.forEach(item => {
                    const category = item.getAttribute('data-category');
                    const isPop = item.getAttribute('data-popular') === 'true';
                    const isDisc = item.getAttribute('data-discount') === 'true';

                    if (filter === 'all') item.style.display = 'block';
                    else if (filter === 'populer') item.style.display = isPop ? 'block' : 'none';
                    else if (filter === 'diskon') item.style.display = isDisc ? 'block' : 'none';
                    else if (filter === 'tambahan') item.style.display = (category === 'addon' || category === 'tambahan') ? 'block' : 'none';
                    else item.style.display = (category === filter) ? 'block' : 'none';
                });
            });
        });

        // LOGIKA SEARCH
        document.getElementById('searchInput').addEventListener('input', function() {
            const val = this.value.toLowerCase();
            items.forEach(item => {
                const text = item.querySelector('.card-title').innerText.toLowerCase();
                item.style.display = text.includes(val) ? 'block' : 'none';
            });
        });

        function addToCart(id) {
            let badge = document.getElementById('cart-count');
            badge.innerText = parseInt(badge.innerText) + 1;
            alert("Berhasil menambahkan item ke keranjang!");
        }
    </script>
</body>
</html>