package controllers;

import models.Menu;
import models.MenuDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "MenuServlet", urlPatterns = {"/sell"})
public class MenuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MenuDAO menuDAO = new MenuDAO();
        List<Menu> allMenu = menuDAO.getAllMenu();
        
        // Cek jika data ada
        if (allMenu != null) {
            // Filter berdasarkan kategori
            List<Menu> makanan = allMenu.stream()
                    .filter(m -> m.getKategori() != null && "makanan".equalsIgnoreCase(m.getKategori()))
                    .collect(Collectors.toList());
                    
            List<Menu> minuman = allMenu.stream()
                    .filter(m -> m.getKategori() != null && "minuman".equalsIgnoreCase(m.getKategori()))
                    .collect(Collectors.toList());
                    
            List<Menu> addons = allMenu.stream()
                    .filter(m -> m.getKategori() != null && "addon".equalsIgnoreCase(m.getKategori()))
                    .collect(Collectors.toList());

            request.setAttribute("makanan", makanan);
            request.setAttribute("minuman", minuman);
            request.setAttribute("addons", addons);
        }
        
        request.getRequestDispatcher("sell.jsp").forward(request, response);
    }
}