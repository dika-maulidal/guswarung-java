<%
    // Cek apakah session "userName" ada
    if (session.getAttribute("userName") == null) {
        // Jika tidak ada, arahkan paksa ke login.jsp
        response.sendRedirect("login.jsp");
        return; // Hentikan proses render halaman
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gus Warung</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo/logo.png" />
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;800&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Poppins", sans-serif; }
        body { background-color: #fffef8; color: #222; padding-top: 70px; }
        .navbar-brand img { margin-right: 10px; }
        .hero-scroll { display: flex; overflow-x: auto; scroll-snap-type: x mandatory; width: 100%; height: 90vh; }
        .hero-slide { flex: 0 0 100%; position: relative; scroll-snap-align: start; display: flex; align-items: center; justify-content: center; padding: 2rem; background-size: cover; background-position: center; color: white; }
        .hero-overlay { position: absolute; inset: 0; background: rgba(0,0,0,0.5); backdrop-filter: blur(2px); }
        .hero-text { position: relative; z-index: 2; text-align: center; max-width: 800px; }
        .hero-slide h1 { font-size: 3rem; font-weight: 800; margin-bottom: 20px; }
        .category-card:hover { transform: translateY(-5px); transition: 0.3s; }
        
        /* Hilangkan scrollbar pada hero-scroll jika ingin rapi */
        .hero-scroll::-webkit-scrollbar { display: none; }
    </style>
</head>

<body>
    <%
        // 1. Ambil nama user dari session (pastikan nama atribut sama dengan di Servlet)
        String userName = (String) session.getAttribute("userName");

        // 2. Jika session kosong, lempar ke login
        if (userName == null) {
            response.sendRedirect("login.jsp");
            return; // Penting agar kode di bawah tidak dijalankan
        }

        // 3. Inisialisasi variabel badge pesanan agar tidak error "cannot be resolved"
        Integer newOrdersCount = (Integer) request.getAttribute("newOrdersCount");
        if (newOrdersCount == null) {
            newOrdersCount = 0; // Default jika tidak ada data
        }
    %>

    <nav class="fixed-top navbar navbar-expand-lg shadow-lg" style="background-color: #ffc107">
        <div class="container">
            <a class="navbar-brand text-white fw-bold" href="home.jsp">
                <img src="${pageContext.request.contextPath}/img/logo/logo.png" width="40" height="40">
                GusWarung
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav align-items-center">
                    <li class="nav-item"><a class="nav-link text-black" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-black" href="sell">Penjualan</a></li>
                    <li class="nav-item"><a class="nav-link text-black" href="about.jsp">About</a></li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-black d-flex align-items-center position-relative"
                           href="#" role="button" data-bs-toggle="dropdown">
                            <span class="material-symbols-outlined me-1">account_circle</span>
                            
                            <%-- Menampilkan Nama User --%>
                            <span class="fw-bold"><%= userName %></span>

                            <%-- Menampilkan Badge jika ada pesanan baru --%>
                            <% if (newOrdersCount > 0) { %>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                                    <%= newOrdersCount %>
                                </span>
                            <% } %>
                        </a>

                        <ul class="dropdown-menu dropdown-menu-end bg-warning">
                            <li><span class="dropdown-item fw-bold text-black border-bottom">Halo, <%= userName %></span></li>
                            <li><a class="dropdown-item" href="profile.jsp">Akun Saya</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="LogoutServlet">Keluar</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="hero-scroll">
        <div class="hero-slide" style="background-image: url('${pageContext.request.contextPath}/img/restoran.jpeg');">
            <div class="hero-overlay"></div>
            <div class="hero-text">
                <h2 class="text-warning">Hello, <%= userName %>!</h2>
                <h1>Nikmati Cita Rasa <span>Nusantara</span></h1>
                <div class="card p-4 shadow-sm text-dark" style="background-color: rgba(255, 226, 64, 0.9);">
                    <p>Gus Warung menghadirkan pengalaman menikmati hidangan tradisional secara modern dan mudah.</p>
                </div>
            </div>
        </div>
    </section>

    <section class="container py-5">
        <h2 class="text-center fw-bold mb-4">Kategori Pilihan</h2>
        <div class="row g-4">
            <div class="col-6 col-md-4">
                <div class="card category-card border-0 shadow-sm">
                    <img src="${pageContext.request.contextPath}/img/nasi ayam.jpg" class="card-img-top" alt="Nasi">
                    <div class="card-body text-center"><p class="fw-bold">Aneka Nasi</p></div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init();</script>
</body>
</html>