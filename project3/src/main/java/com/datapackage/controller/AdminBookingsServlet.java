package com.datapackage.controller;

import db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/AdminBookingsServlet")
public class AdminBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT id, customer_name, email, phone, from_location, to_location, amount_paid, created_at FROM bookings";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            out.println("<html><head><title>Admin Bookings</title>");
            out.println("<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css'>");
            out.println("</head><body><div class='container mt-4'><h2>Customer Bookings</h2>");
            out.println("<table class='table table-bordered'><thead><tr>");
            out.println("<th>ID</th><th>Customer Name</th><th>Email</th><th>Phone</th><th>From</th><th>To</th><th>Amount Paid</th><th>Created At</th>");
            out.println("</tr></thead><tbody>");

            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("customer_name") + "</td>");
                out.println("<td>" + rs.getString("email") + "</td>");
                out.println("<td>" + rs.getString("phone") + "</td>");
                out.println("<td>" + rs.getString("from_location") + "</td>");
                out.println("<td>" + rs.getString("to_location") + "</td>");
                out.println("<td>RS. " + rs.getDouble("amount_paid") + "</td>");
                out.println("<td>" + rs.getTimestamp("created_at") + "</td>");
                out.println("</tr>");
            }

            out.println("</tbody></table></div></body></html>");

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>Error loading data</p>");
        }
    }
}
