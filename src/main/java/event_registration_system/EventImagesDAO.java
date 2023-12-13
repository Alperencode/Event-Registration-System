package event_registration_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class EventImagesDAO {
    // Methods for CRUD operations on the event_images table

    public static int createEventImage(String eventID, byte[] imageData) throws ParseException {
        //  Prepare query to create new user
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO event_images (eventID, image) VALUES (?, ?)")) {
            preparedStatement.setString(1, eventID);
            if (imageData == null) {
                System.out.println("Null image assigned");
                System.out.println("NULL: " + java.sql.Types.BLOB);
                preparedStatement.setNull(2, java.sql.Types.BLOB);
            } else {
                preparedStatement.setBytes(2, imageData);
            }

            // Execute query
            int rowsAffected = preparedStatement.executeUpdate();

            // Return rowsAffected to indicate ">0"
            // >0 : Successfull registration
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            // 0  : sql query or database connection failed
            return 0;
        }
    }

    public static byte[] getEventImage(String eventID) throws ParseException {
        //  Prepare query to create new user
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM event_images WHERE eventID = ?")) {
            preparedStatement.setString(1, eventID);

            // Execute query
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    // If user found, return User object
                    return resultSet.getBytes("image");
                } else {
                    return null; // Return null to indicate no user found
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static int updateImage(String eventID, byte[] imageData) {
        // Prepare query to update user information
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE event_images SET image = ? WHERE eventID = ?")) {
            if (imageData == null) {
                preparedStatement.setNull(1, java.sql.Types.BLOB);
            } else {
                preparedStatement.setBytes(1, imageData);
            }
            preparedStatement.setString(2, eventID);

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

    public static int deleteUserEvents(String eventID) {
        // Prepare query to delete a record from user_events
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM event_images WHERE eventID = ?")) {
            preparedStatement.setString(1, eventID);

            // Execute query
            int rowsAffected = preparedStatement.executeUpdate();

            // Return rowsAffected to indicate ">0"
            // >0 : Successful deletion
            return rowsAffected;

        } catch (SQLException e) {
            e.printStackTrace();
            // 0 : SQL query or database connection failed
            return 0;
        }
    }
}
