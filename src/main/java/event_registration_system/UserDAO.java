package event_registration_system;

// UserDAO.java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    // Methods for CRUD operations on the Users table

    // Validation method for user login
    public static String validateUser(String username, String password) {
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Users WHERE username = ? AND password = ?")) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getString("userID"); // Return the userID if a record is found
                } else {
                    return null; // Return null to indicate no user found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static User getUser(String userID) {
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Users WHERE userID = ?")) {
            preparedStatement.setString(1, userID);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    User user = new User();
                    user.setUserID(resultSet.getString("userID"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setPassword(resultSet.getString("password"));
                    user.setCreationDate(resultSet.getString("creationDate"));
                    return user;
                } else {
                    return null; // Return null to indicate no user found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
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

        String userID = UniqueIdGenerator.generateUniqueId(username, email);
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO Users (UserID, username, email, password) VALUES (?, ?, ?, ?)")) {
            preparedStatement.setString(1, userID);
            preparedStatement.setString(2, username);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, password);

            // Use executeUpdate for INSERT statements
            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected; // If a new user is inserted, return true
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
