package controllers;

import config.Koneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "StokSimpanServlet", urlPatterns = {"/stok-simpan"})
public class StokSimpanServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Ambil data dari form modal di Inventaris.jsp
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String unit = request.getParameter("unit");
        int minimalStock = Integer.parseInt(request.getParameter("minimal_stock"));
        double price = Double.parseDouble(request.getParameter("price"));
        String status = request.getParameter("status");

        try {
            Connection conn = Koneksi.configDB();
            String sql = "INSERT INTO inventaris (name, quantity, unit, minimal_stock, price, status) VALUES (?, ?, ?, ?, ?, ?)";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setInt(2, quantity);
            pstmt.setString(3, unit);
            pstmt.setInt(4, minimalStock);
            pstmt.setDouble(5, price);
            pstmt.setString(6, status);
            
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            // Setelah berhasil simpan, kembali ke halaman daftar inventaris
            response.sendRedirect("inventaris");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}