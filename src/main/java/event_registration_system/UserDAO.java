package event_registration_system;

// UserDAO.java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 
 */
public class UserDAO {
    // Methods for CRUD operations on the Users table

    // Validation method for user login
    public static boolean validateUser(String username, String password) {
        try (Connection connection = DatabaseConnection.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Users WHERE username = ? AND password = ?")) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // If a record is found, the user is valid
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
