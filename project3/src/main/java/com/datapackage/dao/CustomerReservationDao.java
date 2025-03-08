package com.datapackage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.datapackage.model.CustomerReservation;

public class CustomerReservationDao {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/project3";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Kalani2003@#$";
    
   


    public boolean saveBooking(CustomerReservation booking) {
        boolean isSaved = false;
        String sql = "INSERT INTO bookings (name, email, phone, from_location, to_location, datetime) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, booking.getName());
            stmt.setString(2, booking.getEmail());
            stmt.setString(3, booking.getPhone());
            stmt.setString(4, booking.getFromLocation());
            stmt.setString(5, booking.getToLocation());
            stmt.setString(6, booking.getDatetime());

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                isSaved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSaved;
    }
    
    public List<CustomerReservation> getBookingsByEmail(String email) {
        List<CustomerReservation> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings WHERE email = ?";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                CustomerReservation booking = new CustomerReservation(
                    rs.getInt("id"), rs.getString("name"),
                    rs.getString("email"), rs.getString("phone"),
                    rs.getString("from_location"), rs.getString("to_location"),
                    rs.getString("datetime"), sql, 0
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

}
