package event_registration_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    // Methods for CRUD operations on the users table

    public static User getUser(String userID) {
        // Prepare query to search database for user with given userID
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM Users WHERE userID = ?")) {
            preparedStatement.setString(1, userID);

            // Execute query
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    // If user found, return User object
                    return new User(
                            resultSet.getString("userID"),
                            resultSet.getString("username"),
                            resultSet.getString("email"),
                            resultSet.getString("password")
                    );
                } else {
                    return null; // Return null to indicate no user found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String validateUser(String email, String password) {
        // Hash the password before compare it
        String hashedPassword = Hash.hashPassword(password);

        // Prepare query to search database for username and email        
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM Users WHERE email = ? AND password = ?")) {
            preparedStatement.setString(1, email);
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
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM users WHERE username LIKE ?")) {
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
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM users WHERE email LIKE ?")) {
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

    public static int createUser(User user) {
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

    public static boolean deteleUser(String userID) throws SQLException {
        // Prepare query to search database for user with given userID
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM users WHERE userID = ?")) {
            preparedStatement.setString(1, userID);

            // Execute the delete query
            int rowsAffected = preparedStatement.executeUpdate();

            // Return true to indicate user is deleted
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int updateUser(User user) {
        // Prepare query to update user information
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE Users SET username = ?, email = ?, password = ? WHERE UserID = ?")) {

            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getUserID());

            // Execute query
            int rowsAffected = preparedStatement.executeUpdate();

            // Return rowsAffected to indicate ">0"
            // >0 : Successfull update
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            // 0 : SQL query or database connection failed
            return 0;
        }
    }

}
