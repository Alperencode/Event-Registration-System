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
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Users WHERE username = ? AND password = ?")) {
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

    public static boolean checkUsernameExists(String username) {
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE username LIKE ?")) {
            preparedStatement.setString(1, username);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // If a record is found, the user is valid
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean checkEmailExists(String email) {
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email LIKE ?")) {
            preparedStatement.setString(1, email);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // If a record is found, the user is valid
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int registerUser(String username, String email, String password) {
        /*
            Registration function for database
        returns:
        >0 : Successfull registration
        -1 : if username already exists
        -2 : if email already exists
        0  : sql query or database connection failed
         */
        if (checkUsernameExists(username)) {
            return -1;
        } else if (checkEmailExists(email)) {
            return -2;
        }
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO Users (username, email, password) VALUES (?, ?, ?)")) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, password);

            // Use executeUpdate for INSERT statements
            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected; // If a new user is inserted, return true
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
