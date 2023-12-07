package event_registration_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

public class UserEventsDAO {
    // Methods for CRUD operations on the user_events table

    public static int createUserEvents(String userID, String eventID, String eventType) throws ParseException {
        // Generate unique userEventID
        String userEventID = Hash.generateUniqueId(userID, eventID);

        //  Prepare query to create new user
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO user_events (userEventID, userID, eventID, eventType) VALUES (?, ?, ?, ?)")) {
            preparedStatement.setString(1, userEventID);
            preparedStatement.setString(2, userID);
            preparedStatement.setString(3, eventID);
            preparedStatement.setString(4, eventType);

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

    public static int deleteUserEvents(String userEventID) {
        // Prepare query to delete a record from user_events
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM user_events WHERE userEventID = ?")) {

            preparedStatement.setString(1, userEventID);

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
