
package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AdminContactServlet")
public class AdminContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String reply = request.getParameter("reply").trim();

        String jdbcURL = "jdbc:mysql://localhost:3306/project3";
        String dbUser = "root";
        String dbPassword = "Kalani2003@#$";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "UPDATE contact_us SET reply = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, reply);
            stmt.setInt(2, id);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                request.setAttribute("success", "Reply sent successfully!");
            } else {
                request.setAttribute("error", "Failed to send reply.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        request.getRequestDispatcher("admin/AdminContact.jsp").forward(request, response);
    }
}
