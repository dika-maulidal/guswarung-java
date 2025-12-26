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

@WebServlet(name = "StokUpdateServlet", urlPatterns = {"/stok-update"})
public class StokUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Ambil data dari form update di Inventaris.jsp
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String unit = request.getParameter("unit");
        double price = Double.parseDouble(request.getParameter("price"));

        try {
            Connection conn = Koneksi.configDB();
            
            // Query untuk update berdasarkan NAMA
            // Kita juga sekalian update status secara otomatis: 
            // jika qty > minimal_stock maka 'aman', jika tidak maka 'rendah'
            String sql = "UPDATE inventaris SET quantity=?, unit=?, price=?, "
                       + "status = CASE WHEN ? > minimal_stock THEN 'aman' ELSE 'rendah' END "
                       + "WHERE name=?";
            
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, quantity);
            pstmt.setString(2, unit);
            pstmt.setDouble(3, price);
            pstmt.setInt(4, quantity); // Untuk pengecekan status
            pstmt.setString(5, name);
            
            int rowsUpdated = pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
            
            // Opsional: Anda bisa menambahkan pesan sukses/gagal di session
            if (rowsUpdated > 0) {
                System.out.println("Update berhasil untuk: " + name);
            } else {
                System.out.println("Update gagal, nama tidak ditemukan: " + name);
            }

            // Redirect kembali ke halaman utama inventaris
            response.sendRedirect("inventaris");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("inventaris?error=true");
        }
    }
}