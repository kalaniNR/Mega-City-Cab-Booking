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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProfileUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");

        // Handle Profile Picture Upload
        Part filePart = request.getPart("profilePic");
        String fileName = null;
        
        if (filePart != null && filePart.getSize() > 0) {
            String uploadPath = getServletContext().getRealPath("/" + UPLOAD_DIR);
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            // Generate a unique file name
            fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);
        }

        String jdbcURL = "jdbc:mysql://localhost:3306/project3";
        String dbUser = "root";
        String dbPassword = "Kalani2003@#$";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Construct SQL dynamically to update only the fields that have been provided
            StringBuilder sql = new StringBuilder("UPDATE register SET name=?, address=?, contact=?");
            if (newPassword != null && !newPassword.trim().isEmpty()) {
                sql.append(", password=?");
            }
            if (fileName != null) {
                sql.append(", profile_pic=?");
            }
            sql.append(" WHERE username=?");

            PreparedStatement stmt = conn.prepareStatement(sql.toString());
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
            stmt.close();
            conn.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("Views/profile.jsp?success=Profile Updated Successfully");
            } else {
                response.sendRedirect("Views/profile.jsp?error=Error Updating Profile");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Views/profile.jsp?error=Database Connection Error");
        }
    }
}
