package event_registration_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    // Methods for CRUD operations on the Users table

    // Validation method for user login
    public static String validateUser(String username, String password) {
        // Hash the password before compare it
        String hashedPassword = Hash.hashPassword(password);

        // Prepare query to search database for username and email        
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Users WHERE username = ? AND password = ?")) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, hashedPassword);

            // Execute query
            try (ResultSet resultSet = preparedStatement.executeQuery()) {

                if (resultSet.next()) {
                    // If user found, return userID
                    return resultSet.getString("userID");
                } else {
                    // Else return null
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Also return null if any exception occurs
            return null;
        }
    }

    public static boolean checkUsernameExists(String username) {
        //  Prepare query to search database for same username
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE username LIKE ?")) {
            preparedStatement.setString(1, username);

            // Execute query
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // If found any, return to indicate true
                return resultSet.next();
            }
        } catch (SQLException e) {
            // If no username found, return false
            return false;
        }
    }

    public static boolean checkEmailExists(String email) {
        //  Prepare query to search database for same email
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE email LIKE ?")) {
            preparedStatement.setString(1, email);

            // Execute query
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // If found any, return to indicate true
                return resultSet.next();
            }
        } catch (SQLException e) {
            // If no email found, return false
            return false;
        }
    }

    public static int registerUser(User user) {
        if (checkUsernameExists(user.getUsername())) {
            // -1: Username already exists
            return -1;
        } else if (checkEmailExists(user.getEmail())) {
            // -2 : if email already exists
            return -2;
        }

        //  Prepare query to create new user
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO Users (UserID, username, email, password) VALUES (?, ?, ?, ?)")) {
            preparedStatement.setString(1, user.getUserID());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getPassword());

            // Execute query
            int rowsAffected = preparedStatement.executeUpdate();

            // Return rowsAffected to indicate ">0"
            // >0 : Successfull registration
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            // 0  : SQL query or database connection failed
            return 0;
        }
    }
}
