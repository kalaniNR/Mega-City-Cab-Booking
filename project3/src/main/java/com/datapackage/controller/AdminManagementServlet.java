package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.datapackage.dao.AdminDao;

@WebServlet("/AdminManagementServlet")
public class AdminManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Ensures proper encoding for special characters
        String action = request.getParameter("action");
        AdminDao adminDao = new AdminDao();

        try {
            if ("add".equals(action)) {
                // Get input values
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                System.out.println("Adding new admin: " + username);

                // Validate input
                if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                    response.sendRedirect("manageAdmins.jsp?error=Invalid+input");
                    return;
                }

                // Add admin to database
                boolean added = adminDao.addAdmin(username, password);
                response.sendRedirect(added 
                    ? "admin/manageAdmins.jsp?success=Admin+added+successfully"
                    : "admin/manageAdmins.jsp?error=Failed+to+add+admin");

            } else if ("update".equals(action)) {
                String idParam = request.getParameter("id");
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                System.out.println("Updating admin ID: " + idParam);

                if (idParam == null || idParam.trim().isEmpty() || username == null || username.trim().isEmpty()) {
                    response.sendRedirect("admin/manageAdmins.jsp?error=Invalid+input");
                    return;
                }

                int id;
                try {
                    id = Integer.parseInt(idParam);
                } catch (NumberFormatException e) {
                    response.sendRedirect("admin/manageAdmins.jsp?error=Invalid+ID");
                    return;
                }

                boolean updated = adminDao.updateAdmin(id, username, password);
                response.sendRedirect(updated 
                    ? "admin/manageAdmins.jsp?success=Admin+updated+successfully"
                    : "admin/manageAdmins.jsp?error=Failed+to+update+admin");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/manageAdmins.jsp?error=An+unexpected+error+occurred");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AdminDao adminDao = new AdminDao();

        try {
            if ("delete".equals(action)) {
                String idParam = request.getParameter("id");

                System.out.println("Deleting admin ID: " + idParam);

                if (idParam == null || idParam.trim().isEmpty()) {
                    response.sendRedirect("admin/manageAdmins.jsp?error=Invalid+input");
                    return;
                }

                int id;
                try {
                    id = Integer.parseInt(idParam);
                } catch (NumberFormatException e) {
                    response.sendRedirect("admin/manageAdmins.jsp?error=Invalid+ID");
                    return;
                }

                boolean deleted = adminDao.deleteAdmin(id);
                response.sendRedirect(deleted 
                    ? "admin/manageAdmins.jsp?success=Admin+deleted+successfully"
                    : "admin/manageAdmins.jsp?error=Failed+to+delete+admin");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/manageAdmins.jsp?error=An+unexpected+error+occurred");
        }
    }
}
