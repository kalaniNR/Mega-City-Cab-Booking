package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

@WebServlet("/ProfileUpdateServlet")
@MultipartConfig(fileSizeThreshold = 2 * 1024 * 1024, // 2MB
                 maxFileSize = 10 * 1024 * 1024, // 10MB
                 maxRequestSize = 50 * 1024 * 1024) // 50MB
public class ProfileUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        Part filePart = request.getPart("profilePic");
        String fileName = null;

        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("/" + UPLOAD_DIR);
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
            filePart.write(uploadPath + File.separator + fileName);
        }

        String jdbcURL = "jdbc:mysql://localhost:3306/project3";
        String dbUser = "root";
        String dbPassword = "Kalani2003@#$";

        try (Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            StringBuilder sql = new StringBuilder("UPDATE register SET name=?, address=?, contact=?");
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                sql.append(", password=?");
            }
            if (fileName != null) {
                sql.append(", profile_pic=?");
            }
            sql.append(" WHERE username=?");

            try (PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
                stmt.setString(1, name);
                stmt.setString(2, address);
                stmt.setString(3, contact);
                int paramIndex = 4;

                if (newPassword != null && !newPassword.trim().isEmpty()) {
                    stmt.setString(paramIndex++, newPassword);
                }
                if (fileName != null) {
                    stmt.setString(paramIndex++, fileName);
                }
                stmt.setString(paramIndex, username);

                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("Views/profile.jsp?success=Profile Updated Successfully");
                } else {
                    response.sendRedirect("Views/profile.jsp?error=No changes made");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Views/profile.jsp?error=Database Connection Error");
        }
    }
}
