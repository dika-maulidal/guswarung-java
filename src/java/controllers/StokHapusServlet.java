package controller;

import config.Koneksi;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "StokHapusServlet", urlPatterns = {"/stok-hapus"})
public class StokHapusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Ambil ID dari parameter URL
        String idHapus = request.getParameter("id");
        
        if (idHapus != null) {
            try {
                // 2. Koneksi ke Database
                Connection conn = Koneksi.configDB(); 
                
                // 3. Query Delete (Gunakan PreparedStatement untuk keamanan)
                String sql = "DELETE FROM inventaris WHERE id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(idHapus));
                
                // 4. Eksekusi Hapus
                ps.executeUpdate();
                
                // Tutup resource
                ps.close();
                conn.close();
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        // 5. Kembalikan ke halaman daftar inventaris setelah hapus
        response.sendRedirect("inventaris");
    }
}