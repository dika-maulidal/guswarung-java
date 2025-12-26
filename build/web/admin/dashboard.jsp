<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Proteksi Keamanan: Cek apakah user adalah admin
    String role = (String) session.getAttribute("userRole");
    String userName = (String) session.getAttribute("userName");
    
    if (userName == null || !"admin".equalsIgnoreCase(role)) {
        response.sendRedirect("../login.jsp"); 
        return;
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - GusWarung</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    
    <style>
        body { background-color: #f4f7f6; font-family: 'Poppins', sans-serif; }
        .navbar-admin { background-color: #ffc107 !important; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .nav-link { color: #000 !important; font-weight: 500; }
        .card-menu { 
            border: none; 
            border-radius: 15px; 
            transition: all 0.3s ease; 
            text-decoration: none; 
            color: inherit;
            display: block;
            background: white;
        }
        .card-menu:hover { 
            transform: translateY(-10px); 
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            color: #ffc107;
        }
        .icon-box {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-admin sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold text-dark" href="dashboard.jsp">
            <i class="fas fa-store me-2"></i>GusWarung <span class="badge bg-dark ms-2" style="font-size: 0.6em;">ADMIN</span>
        </a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#adminNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="adminNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
<!--                <li class="nav-item"><a class="nav-link" href="../home.jsp">Lihat Toko</a></li>-->
            </ul>
            
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle fw-bold d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle fs-4 me-2"></i>
                        <%= userName %>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow border-0">
                        <li><a class="dropdown-item" href="profile.jsp"><i class="fas fa-cog me-2"></i>Pengaturan</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="../LogoutServlet"><i class="fas fa-sign-out-alt me-2"></i>Keluar</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container my-5">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="fw-bold">Selamat Datang, <%= userName %>! 👋</h2>
            <p class="text-muted">Kelola operasional warung Anda di sini.</p>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-md-4 col-sm-6">
            <a href="products/index.jsp" class="card-menu p-4 shadow-sm h-100">
                <div class="icon-box bg-warning text-white shadow-sm">
                    <i class="fas fa-utensils fa-2x"></i>
                </div>
                <h5 class="fw-bold">Manajemen Produk</h5>
                <p class="text-muted small">Tambah, edit, atau hapus menu makanan dan minuman.</p>
            </a>
        </div>

        <div class="col-md-4 col-sm-6">
            <a href="${pageContext.request.contextPath}/inventaris" class="card-menu p-4 shadow-sm h-100">
                <div class="icon-box bg-primary text-white shadow-sm">
                    <i class="fas fa-boxes fa-2x"></i>
                </div>
                <h5 class="fw-bold">Manajemen Stok</h5>
                <p class="text-muted small">Pantau ketersediaan bahan baku dan sisa porsi menu.</p>
            </a>
        </div>

        <div class="col-md-4 col-sm-6">
            <a href="orders/index.jsp" class="card-menu p-4 shadow-sm h-100">
                <div class="icon-box bg-success text-white shadow-sm">
                    <i class="fas fa-receipt fa-2x"></i>
                </div>
                <h5 class="fw-bold">Kelola Pesanan</h5>
                <p class="text-muted small">Konfirmasi pembayaran dan status pengiriman pesanan.</p>
            </a>
        </div>

        <div class="col-md-4 col-sm-6">
            <a href="reports/index.jsp" class="card-menu p-4 shadow-sm h-100">
                <div class="icon-box bg-info text-white shadow-sm">
                    <i class="fas fa-chart-line fa-2x"></i>
                </div>
                <h5 class="fw-bold">Laporan Penjualan</h5>
                <p class="text-muted small">Lihat performa warung dan unduh laporan bulanan.</p>
            </a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>