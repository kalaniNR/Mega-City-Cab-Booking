package com.datapackage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.datapackage.model.Car;

import db.DatabaseConnection;

public class CarDao {
    private static final String URL = "jdbc:mysql://localhost:3306/project3";
    private static final String USER = "root";
    private static final String PASSWORD = "Kalani2003@#$";

    // Get all cars
    public List<Car> getAllCars() {
        List<Car> carList = new ArrayList<>();
        String sql = "SELECT * FROM cars";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrandName(rs.getString("brand_name"));
                car.setCapacity(rs.getInt("capacity"));
                car.setPrice(rs.getDouble("price"));
                car.setLicensePlate(rs.getString("license_plate"));
                car.setImage(rs.getString("image"));
                carList.add(car);
            }
            System.out.println("Fetched Cars: " + carList.size());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carList;
    }

    // Add a new car
    public boolean addCar(Car car) {
        String sql = "INSERT INTO cars (brand_name, capacity, price, license_plate, image) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, car.getBrandName());
            stmt.setInt(2, car.getCapacity());
            stmt.setDouble(3, car.getPrice());
            stmt.setString(4, car.getLicensePlate());
            stmt.setString(5, car.getImage());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update car details
    public boolean updateCar(Car car) {
        String sql = "UPDATE cars SET brand_name=?, capacity=?, price=?, license_plate=?, image=? WHERE id=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, car.getBrandName());
            stmt.setInt(2, car.getCapacity());
            stmt.setDouble(3, car.getPrice());
            stmt.setString(4, car.getLicensePlate());
            stmt.setString(5, car.getImage());
            stmt.setInt(6, car.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete car by ID
    public boolean deleteCar(int id) {
        String sql = "DELETE FROM cars WHERE id=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Car getCarById(int id) {
        Car car = null;
        String sql = "SELECT * FROM cars WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    car = new Car();
                    car.setId(rs.getInt("id"));
                    car.setBrandName(rs.getString("brand_name"));
                    car.setCapacity(rs.getInt("capacity"));
                    car.setPrice(rs.getDouble("price"));
                    car.setLicensePlate(rs.getString("license_plate"));
                    car.setImage(rs.getString("image"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return car;
    }


}
