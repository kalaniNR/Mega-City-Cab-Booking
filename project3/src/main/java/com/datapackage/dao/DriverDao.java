package com.datapackage.dao;

import com.datapackage.model.Driver;

import db.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDao {
    private Connection con;

    public DriverDao(Connection con) {
        this.con = con;
    }

    public boolean addDriver(Driver driver) throws SQLException {
        String query = "INSERT INTO drivers (name, phone, email, license_number, status,image_path) VALUES (?, ?, ?, ?, 'Available',?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, driver.getName());
        ps.setString(2, driver.getPhone());
        ps.setString(3, driver.getEmail());
        ps.setString(4, driver.getLicenseNumber());
        ps.setString(5, driver.getImagePath());
        return ps.executeUpdate() > 0;
    }

    public boolean updateDriver(Driver driver) throws SQLException {
        String sql = "UPDATE drivers SET name=?, phone=?, email=?, license_number=?, status=?, image_path=? WHERE id=?";
        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, driver.getName());
            pst.setString(2, driver.getPhone());
            pst.setString(3, driver.getEmail());
            pst.setString(4, driver.getLicenseNumber());
            pst.setString(5, driver.getStatus());
            pst.setString(6, driver.getImagePath());
            pst.setInt(7, driver.getId());

            return pst.executeUpdate() > 0;
        }
    }


    public boolean deleteDriver(int id) throws SQLException {
        String query = "DELETE FROM drivers WHERE id=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, id);
        return ps.executeUpdate() > 0;
    }

    public List<Driver> getAllDrivers() throws SQLException {
        List<Driver> drivers = new ArrayList<>();
        String query = "SELECT * FROM drivers";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        while (rs.next()) {
            Driver driver = new Driver(rs.getInt("id"),rs.getString("name"),rs.getString("phone"),rs.getString("email"),rs.getString("license_number"),rs.getString("status"),rs.getString("image_path"));
            drivers.add(driver);
        }
        return drivers;
    }

    public boolean assignDriverToBooking(int driverId, int bookingId) throws SQLException {
        String query = "UPDATE bookings SET driver_id=? WHERE id=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, driverId);
        ps.setInt(2, bookingId);
        return ps.executeUpdate() > 0;
    }
    
    public List<Driver> getAvailableDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try {
            Connection conn = DatabaseConnection.getConnection();
            String query = "SELECT * FROM drivers WHERE status = 'available'";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Driver driver = new Driver(rs.getInt("id"),rs.getString("name"),rs.getString("phone"),rs.getString("email"),rs.getString("license_number"),rs.getString("status"),rs.getString("image_path"));
                driver.setId(rs.getInt("id"));
                driver.setName(rs.getString("name"));
                driver.setPhone(rs.getString("phone"));
                driver.setEmail(rs.getString("email"));
                driver.setLicenseNumber(rs.getString("license_number"));
                driver.setStatus(rs.getString("status"));
                driver.setImagePath(rs.getString("image_path"));
                drivers.add(driver);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return drivers;
    }


	
}
