package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	public static DatabaseConnection Instance;
	private static final String URL = "jdbc:mysql://localhost:3306/project3"; 
    private static final String USER = "root"; 
    private static final String PASSWORD = "Kalani2003@#$"; 
    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); 
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
