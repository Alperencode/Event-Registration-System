package event_registration_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class EventDAO {
    // Methods for CRUD operations on the Events table

    public static boolean checkEventNameExists(String eventName, String organizerID) {
        //  Prepare query to search database for user's event name
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM events WHERE eventName LIKE ? and organizerID = ?")) {
            preparedStatement.setString(1, eventName);
            preparedStatement.setString(2, organizerID);

            // Execute query
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                // If found any, return to indicate true
                return resultSet.next();
            }
        } catch (SQLException e) {
            // If no event name found for given user, return false
            return false;
        }
    }

    public static int registerEvent(Event event) throws ParseException {
        if (checkEventNameExists(event.getEventName(), event.getOrganizerID())) {
            // -1 : User already created with same Event Name
            return -1;
        }

        //  Prepare query to create new event
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO events (eventID, eventName, eventDate, eventTime, eventLocation, maxParcitipant, shortDescription, longDescription, image, organizerID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, event.getEventID());
            preparedStatement.setString(2, event.getEventName());
            preparedStatement.setString(3, event.getEventDate());
            preparedStatement.setString(4, event.getEventTime());
            preparedStatement.setString(5, event.getEventLocation());
            preparedStatement.setInt(6, event.getMaxParticipant());
            preparedStatement.setString(7, event.getShortDescription());
            preparedStatement.setString(8, event.getLongDescription());
            preparedStatement.setString(9, event.getImage());
            preparedStatement.setString(10, event.getOrganizerID());

            // Execute query
            int rowsAffected = preparedStatement.executeUpdate();

            // If there is no error, register User as an Host of the created event
            registerUserEvents(event.getOrganizerID(), event.getEventID(), "Hosting");

            // Return rowsAffected to indicate ">0"
            // >0 : Successfull registration
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            // 0  : SQL query or database connection failed
            return 0;
        }
    }

    public static int registerUserEvents(String userID, String eventID, String eventType) throws ParseException {
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
}
