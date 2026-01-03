package controllers;

import models.Menu;
import models.MenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/products/ProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
                 maxFileSize = 1024 * 1024 * 10,      
                 maxRequestSize = 1024 * 1024 * 50)   
public class ProductServlet extends HttpServlet {

    private MenuDAO menuDAO = new MenuDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        if (action.equals("list")) {
            List<Menu> list = menuDAO.getAllMenu();
            request.setAttribute("menus", list);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (action.equals("edit")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Menu existing = menuDAO.getMenuById(id);
            request.setAttribute("product", existing);
            request.getRequestDispatcher("form.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            menuDAO.deleteMenu(id);
            response.sendRedirect("ProductServlet?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ambil data dari form
        String idStr = request.getParameter("id");
        String nama = request.getParameter("nama");
        String deskripsi = request.getParameter("deskripsi");
        double harga = Double.parseDouble(request.getParameter("harga"));
        int stok = Integer.parseInt(request.getParameter("stok"));
        String kategori = request.getParameter("kategori");
        int diskon = Integer.parseInt(request.getParameter("diskon_persen"));

        Menu menu = new Menu();
        menu.setNama(nama);
        menu.setDeskripsi(deskripsi);
        menu.setHarga(harga);
        menu.setStok(stok);
        menu.setKategori(kategori);
        menu.setDiskon(diskon);

        // Logika Upload Gambar
        Part filePart = request.getPart("gambar");
        String fileName = filePart.getSubmittedFileName();
        
        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "product";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            
            filePart.write(uploadPath + File.separator + fileName);
            menu.setGambar(fileName); 
        } else if (idStr != null && !idStr.isEmpty()) {
            // Jika edit dan tidak upload baru, pakai gambar lama
            Menu old = menuDAO.getMenuById(Integer.parseInt(idStr));
            menu.setGambar(old.getGambar());
        }

        if (idStr == null || idStr.isEmpty()) {
            menuDAO.insertMenu(menu); // Panggil fungsi insert di DAO
        } else {
            menu.setId(Integer.parseInt(idStr));
            menuDAO.updateMenu(menu); // Panggil fungsi update di DAO
        }

        response.sendRedirect("ProductServlet?action=list");
    }
}