package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.datapackage.model.Car;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/project3"; // Change as per your DB
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "Kalani2003@#$"; 

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Retrieve all session details
        String name = (String) session.getAttribute("name");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String fromLocation = (String) session.getAttribute("fromLocation");
        String toLocation = (String) session.getAttribute("toLocation");
        String datetime = (String) session.getAttribute("datetime");

        Car car = (Car) session.getAttribute("selectedCar");
        String carBrand = (car != null) ? car.getBrandName() : "N/A";
        int carCapacity = (car != null) ? car.getCapacity() : 0;
        double carPrice = (car != null) ? car.getPrice() : 0.0;
        String licensePlate = (car != null) ? car.getLicensePlate() : "N/A";

        String paymentMethod = request.getParameter("paymentMethod");
        String paymentDetails = request.getParameter("paymentDetails");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentStatus = "Success";

        // Store payment status in session
        session.setAttribute("paymentMethod", paymentMethod);
        session.setAttribute("paymentDetails", paymentDetails);
        session.setAttribute("amount", amount);
        session.setAttribute("paymentStatus", paymentStatus);

        // Insert into database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "INSERT INTO bookings (customer_name, email, phone, from_location, to_location, datetime, " +
                         "car_brand, car_capacity, car_price, license_plate, payment_method, payment_details, amount_paid, payment_status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, fromLocation);
            stmt.setString(5, toLocation);
            stmt.setString(6, datetime);
            stmt.setString(7, carBrand);
            stmt.setInt(8, carCapacity);
            stmt.setDouble(9, carPrice);
            stmt.setString(10, licensePlate);
            stmt.setString(11, paymentMethod);
            stmt.setString(12, paymentDetails);
            stmt.setDouble(13, amount);
            stmt.setString(14, paymentStatus);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Booking saved successfully!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect to success page
        response.sendRedirect("Views/payment_success.jsp");
    }
}
