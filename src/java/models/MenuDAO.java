package models;

import config.Koneksi;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
    public List<Menu> getAllMenu() {
        List<Menu> list = new ArrayList<>();
        // Query disesuaikan dengan kolom di database Anda
        String sql = "SELECT * FROM menus"; 
        
        try (Connection con = Koneksi.configDB();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while(rs.next()) {
    Menu m = new Menu();
    m.setId(rs.getInt("id"));
    m.setNama(rs.getString("nama"));
    m.setDeskripsi(rs.getString("deskripsi"));
    m.setHarga(rs.getDouble("harga"));
    m.setStok(rs.getInt("stok")); // Ambil stok
    m.setKategori(rs.getString("kategori"));
    m.setGambar(rs.getString("gambar"));
    
    // Sesuaikan dengan nama kolom di screenshot database Anda:
    m.setIsPopular(rs.getBoolean("is_popular")); // database: is_popular
    m.setDiskon(rs.getInt("diskon_persen"));      // database: diskon_persen
    
    list.add(m);
}
        } catch (SQLException e) {
            System.out.println("Error MenuDAO: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
}