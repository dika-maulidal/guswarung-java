package controllers;

import models.Order;
import models.OrderDAO;

// =======================
// JAKARTA SERVLET (Tomcat 10+)
// =======================
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// =======================
// JIKA MASIH PAKAI JAVAX (Tomcat 9 ke bawah)
// =======================
// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;


@WebServlet("/admin/orders/AdminOrderServlet")
public class AdminOrderServlet extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        if (action == null) action = "index";

        switch (action) {
            case "index":
                listOrders(request, response);
                break;
            case "show":
                showOrderDetail(request, response);
                break;
            default:
                listOrders(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Logika untuk Update Status Pesanan (seperti route update_status di Laravel)
        int orderId = Integer.parseInt(request.getParameter("id"));
        String newStatus = request.getParameter("status");

        boolean success = orderDAO.updateStatus(orderId, newStatus);

        if (success) {
            request.getSession().setAttribute("success", "Status pesanan #" + orderId + " berhasil diperbarui!");
        }
        
        // Kembalikan ke halaman detail pesanan tersebut
        response.sendRedirect("AdminOrderServlet?action=show&id=" + orderId);
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Order> orders = orderDAO.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    private void showOrderDetail(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = orderDAO.getOrderById(id);
        
        if (order != null) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("show.jsp").forward(request, response);
        } else {
            response.sendRedirect("AdminOrderServlet?action=index");
        }
    }
}