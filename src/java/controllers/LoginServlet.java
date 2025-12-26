package controllers;

import config.Koneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Gunakan .trim() untuk menghindari error karena spasi tidak sengaja
        String email = request.getParameter("email") != null ? request.getParameter("email").trim() : "";
        String password = request.getParameter("password");
        String selectedRole = request.getParameter("role"); 
        
        List<String> errors = new ArrayList<>();

        // Validasi input kosong
        if (email.isEmpty() || password == null || password.isEmpty()) {
            errors.add("Email dan Password wajib diisi!");
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = Koneksi.configDB()) {
            // Query cukup cek Email dan Password
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Ambil role asli dari database
                String dbRole = rs.getString("role");
                
                // Jika akun lama tidak punya role (null), anggap sebagai 'user'
                if (dbRole == null || dbRole.isEmpty()) {
                    dbRole = "user";
                }

                // Validasi role: form vs database
                if (dbRole.equalsIgnoreCase(selectedRole)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", rs.getInt("id"));
                    session.setAttribute("userName", rs.getString("name"));
                    session.setAttribute("userRole", dbRole.toLowerCase());

                    // REDIRECT BERDASARKAN ROLE
                    if ("admin".equalsIgnoreCase(dbRole)) {
                        // Gunakan getContextPath() agar link tidak patah
                        response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/home.jsp");
                    }
                    return; 
                } else {
                    errors.add("Role yang dipilih (" + selectedRole + ") tidak sesuai dengan data akun Anda.");
                }
            } else {
                errors.add("Email atau Password salah!");
            }

            // Jika sampai sini berarti login gagal
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("login.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            errors.add("Terjadi kesalahan sistem: " + e.getMessage());
            request.setAttribute("errors", errors);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}