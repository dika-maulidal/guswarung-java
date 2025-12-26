package controllers;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("*.jsp") 
public class AuthFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        
        // Cek login status
        boolean loggedIn = (session != null && session.getAttribute("userName") != null);
        String userRole = (loggedIn) ? (String) session.getAttribute("userRole") : "";

        // Halaman yang boleh diakses tanpa login
        boolean isLoginRegister = path.endsWith("login.jsp") || path.endsWith("register.jsp");

        if (loggedIn) {
            // Jika sudah login tapi USER biasa mau masuk ke folder ADMIN
            if (path.startsWith("/admin/") && !"admin".equalsIgnoreCase(userRole)) {
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/home.jsp");
                return;
            }
            chain.doFilter(request, response);
        } else if (isLoginRegister) {
            // Belum login tapi mau ke login/register (Boleh)
            chain.doFilter(request, response);
        } else {
            // Belum login mau akses halaman lain (Tendang)
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
        }
    }
}