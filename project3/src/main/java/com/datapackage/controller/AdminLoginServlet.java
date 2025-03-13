package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.datapackage.dao.AdminDao;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDao adminDao = new AdminDao();
        String validationMessage = adminDao.validateAdmin(username, password);

        if ("Login successful.".equals(validationMessage)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);
            response.sendRedirect("admin/adminDashboard.jsp");
        } else {
            request.setAttribute("errorMessage", validationMessage);
            request.getRequestDispatcher("admin/adminLogin.jsp").forward(request, response);
        }
    }
}