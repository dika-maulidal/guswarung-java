package controllers;

import config.Koneksi;
import models.Inventaris;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "InventarisServlet", urlPatterns = {"/inventaris"})
public class InventarisServlet extends HttpServlet {

    @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    List<Inventaris> listBarang = new ArrayList<>();
    
    try {
        // PERBAIKAN: Sesuaikan dengan nama method di Koneksi.java
        Connection conn = Koneksi.configDB(); 
        Statement stmt = conn.createStatement();
        
        String sql = "SELECT * FROM inventaris ORDER BY name ASC";
        ResultSet rs = stmt.executeQuery(sql); // Pastikan tulisan executeQuery menyambung
        
        while (rs.next()) {
            Inventaris brg = new Inventaris(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getInt("quantity"),
                rs.getString("unit"),
                rs.getInt("minimal_stock"),
                rs.getDouble("price"),
                rs.getString("status")
            );
            listBarang.add(brg);
        }
        
        rs.close();
        stmt.close();
        conn.close();
        
    } catch (Exception e) {
        // Tambahkan ini agar pesan error muncul di konsol saat dijalankan
        System.out.println("Error di Servlet: " + e.getMessage());
        e.printStackTrace();
    }
    
    request.setAttribute("dataStok", listBarang);
    request.getRequestDispatcher("admin/Inventaris.jsp").forward(request, response);
}
}