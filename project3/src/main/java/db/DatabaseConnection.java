package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/project3"; // Change 'rentcar' to your database name
    private static final String USER = "root"; // Change this to your MySQL username
    private static final String PASSWORD = "Kalani2003@#$"; // Change this to your MySQL password
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error connecting to the database", e);
        }
    }

    public static Connection getConnection() {
        return connection;
    }

	
}
