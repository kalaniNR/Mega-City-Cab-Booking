package com.datapackage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.datapackage.model.Admin;

public class AdminDao {
    private static final String URL = "jdbc:mysql://localhost:3306/project3";
    private static final String USER = "root";
    private static final String PASSWORD = "Kalani2003@#$";

    //Fetch All Admins
    public List<Admin> getAllAdmins() {
        List<Admin> adminList = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT id, username, password FROM admin");
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Admin admin = new Admin();
              
                admin.setUsername(rs.getString("username"));
                admin.setPassword(rs.getString("password"));
                adminList.add(admin);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return adminList;
    }

    public String validateAdmin(String username, String password) {
        if (username.matches("\\d+")) {
            return "Username cannot contain only numbers.";
        }

        String sql = "SELECT * FROM admin WHERE username = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");
                if (storedPassword.equals(password)) {
                    return "Login successful.";
                } else {
                    return "Incorrect password. Please try again.";
                }
            } else {
                return "Username not found. Please enter the correct username.";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error. Please try again later.";
        }
    }

    // Add Admin
    public boolean addAdmin(String username, String password) {
        String sql = "INSERT INTO admin (username, password) VALUES (?, ?)";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, username);
            stmt.setString(2, password);
            return stmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateAdmin(int id, String username, String password) {
        String sql;
        boolean result = false;

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            if (password == null || password.trim().isEmpty()) {
                sql = "UPDATE admin SET username=? WHERE id=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, username);
                    stmt.setInt(2, id);
                    int rowsAffected = stmt.executeUpdate();
                    result = rowsAffected > 0;
                }
            } else {
                sql = "UPDATE admin SET username=?, password=? WHERE id=?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, username);
                    stmt.setString(2, password);
                    stmt.setInt(3, id);
                    int rowsAffected = stmt.executeUpdate();
                    result = rowsAffected > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }


    // Delete Admin
    public boolean deleteAdmin(int id) {
        String sql = "DELETE FROM admin WHERE id=?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
