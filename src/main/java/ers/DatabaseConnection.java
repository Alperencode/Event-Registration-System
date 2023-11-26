package ers;

// DatabaseConnection.java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Connects do MySQL database
 */
public class DatabaseConnection {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/event_registration_system";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "admin123";

       public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver
            Connection connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
            System.out.println("Connected to the database!");
            return connection;
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading JDBC driver: " + e.getMessage());
            throw new SQLException("JDBC driver not found.", e);
        }
       }
}
