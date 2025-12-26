<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Proteksi Halaman
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - GusWarung</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo/logo.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    
    <style>
        body { font-family: "Poppins", sans-serif; background-color: #ffffff; padding-top: 80px; }
        .navbar { background-color: #ffc107 !important; }
        .about-hero {
            background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), 
                        url('${pageContext.request.contextPath}/img/restoran.jpeg') center/cover no-repeat;
            color: #fff; text-align: center; border-radius: 20px; padding: 80px 20px; margin: 20px auto; width: 90%;
        }
        .stats { display: flex; justify-content: center; gap: 50px; margin-top: 30px; flex-wrap: wrap; }
        .stat-item { text-align: center; }
        .stat-item .material-symbols-outlined { font-size: 48px; color: #ffc107; }
        .section-title { font-weight: 700; color: #5a2e00; text-align: center; margin-bottom: 10px; }
        .underline { width: 70px; height: 4px; background-color: #ffc107; margin: 0 auto 20px; border-radius: 2px; }
        .contact-card { background: #fff; border-radius: 15px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); padding: 25px; text-align: center; height: 100%; transition: 0.3s; }
        .contact-card:hover { transform: translateY(-10px); }
        .contact-card span { font-size: 40px; color: #ffc107; }
        footer { background: #222; color: #eee; padding: 40px 0; margin-top: 50px; }
    </style>
</head>
<body>

    <nav class="fixed-top navbar navbar-expand-lg shadow-lg">
        <div class="container">
            <a class="navbar-brand text-white fw-bold" href="home.jsp">
                <img src="${pageContext.request.contextPath}/img/logo/logo.png" width="40" height="40"> GusWarung
            </a>
            <div class="collapse navbar-collapse justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link text-black" href="home.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link text-black" href="about.jsp">About</a></li>
                    <li class="nav-item"><span class="nav-link fw-bold">Hi, <%= userName %></span></li>
                </ul>
            </div>
        </div>
    </nav>

    <section class="about-hero" data-aos="zoom-in">
        <h1>Tentang GusWarung</h1>
        <p>Warung makan tradisional dengan cita rasa istimewa</p>
        <div class="stats">
            <div class="stat-item">
                <span class="material-symbols-outlined">groups</span>
                <h4>100+</h4><p>Pelanggan</p>
            </div>
            <div class="stat-item">
                <span class="material-symbols-outlined">grade</span>
                <h4>5.0</h4><p>Rating</p>
            </div>
            <div class="stat-item">
                <span class="material-symbols-outlined">restaurant</span>
                <h4>20+</h4><p>Menu</p>
            </div>
        </div>
    </section>

    <section class="container my-5">
        <h2 class="section-title" data-aos="fade-right">Cerita Kami</h2>
        <div class="underline"></div>
        <p class="text-center mx-auto" style="max-width: 750px;" data-aos="fade-up">
            GusWarung didirikan untuk menyajikan hidangan rumahan berkualitas tinggi dengan harga terjangkau. 
            Setiap menu kami dibuat dari bahan segar pilihan dan resep turun-temurun.
        </p>
    </section>

    <section class="container py-5 text-center">
        <h2 class="section-title" data-aos="fade-down">Profil Video</h2>
        <div class="underline"></div>
        <div class="d-flex justify-content-center mt-4">
            <video controls muted loop style="width:80%; max-width:700px; border-radius:20px; box-shadow:0 10px 30px rgba(0,0,0,0.2);">
                <source src="${pageContext.request.contextPath}/video/video_guswarung.mp4" type="video/mp4">
            </video>
        </div>
    </section>

    <section class="container my-5">
        <div class="row g-4 justify-content-center">
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                <div class="contact-card">
                    <span class="material-symbols-outlined">location_on</span>
                    <h5>Lokasi</h5>
                    <p>Jl. Raya Kendung No 70, Benowo, Surabaya</p>
                </div>
            </div>
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                <div class="contact-card">
                    <span class="material-symbols-outlined">call</span>
                    <h5>WhatsApp</h5>
                    <p>+62 812 3456 7890</p>
                </div>
            </div>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</body>
</html>