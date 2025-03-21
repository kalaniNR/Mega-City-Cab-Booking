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
import java.util.regex.Pattern;


@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String department = request.getParameter("department").trim();
        String message = request.getParameter("message").trim();

        // Regular expressions for validation
        String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        String phoneRegex = "^[0-9]{10}$";

        // Server-side validation
        if (name.isEmpty() || email.isEmpty() || phone.isEmpty() || message.isEmpty()) {
            request.setAttribute("error", "All fields are required!");
            request.getRequestDispatcher("Views/ContactUs.jsp").forward(request, response);
            return;
        }
        if (!Pattern.matches(emailRegex, email)) {
            request.setAttribute("error", "Invalid email format!");
            request.getRequestDispatcher("Views/ContactUs.jsp").forward(request, response);
            return;
        }
        if (!Pattern.matches(phoneRegex, phone)) {
            request.setAttribute("error", "Phone number must be 10 digits!");
            request.getRequestDispatcher("Views/ContactUs.jsp").forward(request, response);
            return;
        }

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/project3";
        String dbUser = "root";
        String dbPassword = "Kalani2003@#$";

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // SQL query to insert data
            String sql = "INSERT INTO contact_us (name, email, phone, department, message) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, department);
            stmt.setString(5, message);

            // Execute update
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                request.setAttribute("success", "Your message has been successfully sent!");
            } else {
                request.setAttribute("error", "Error saving your message. Please try again!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database Connection Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

      
        response.sendRedirect("Views/ContactUs.jsp");
    }
}
