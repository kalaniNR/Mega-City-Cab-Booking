package com.datapackage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.datapackage.model.Register;

public class RegisterDao {
	private static final String URL = "jdbc:mysql://localhost:3306/project3";
    private static final String USER = "root";
    private static final String PASSWORD = "Kalani2003@#$";

    public boolean registerUser(Register user) {
        String query = "INSERT INTO register(name, address, contact, username, password) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getContact());
            ps.setString(4, user.getUsername());
            ps.setString(5, user.getPassword());
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //registration
    public boolean userExists(String username) {
        String query = "SELECT * FROM register WHERE username = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    //login
    public boolean validateUser(String username, String password) {
        String query = "SELECT * FROM register WHERE username = ? AND password = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();  // If a row exists, user is valid
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



}
