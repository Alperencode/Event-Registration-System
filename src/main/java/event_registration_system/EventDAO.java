package event_registration_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class EventDAO {
    // Methods for CRUD operations on the events table

    public static boolean checkEventNameExists(String eventName, String organizerID) {
        //  Prepare query to search database for user's event name
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM events WHERE eventName LIKE ? and organizerID = ?")) {
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

    public static int createEvent(Event event) throws ParseException {
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
            UserEventsDAO.createUserEvents(event.getOrganizerID(), event.getEventID(), "Hosting");

            // Return rowsAffected to indicate ">0"
            // >0 : Successfull registration
            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            // 0  : SQL query or database connection failed
            return 0;
        }
    }

    public static int deleteEvent(String eventID) {
        // Prepare query to delete an event
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM events WHERE eventID = ?")) {

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

    public static int updateEvent(Event event) {
        // Prepare query to update event information
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "UPDATE events SET eventName = ?, eventDate = ?, eventTime = ?, "
                + "location = ?, maxParticipant = ?, description = ?, organizerID = ? WHERE eventID = ?")) {

            preparedStatement.setString(1, event.getEventName());
            preparedStatement.setString(2, event.getEventDate());
            preparedStatement.setString(3, event.getEventTime());
            preparedStatement.setString(4, event.getEventLocation());
            preparedStatement.setInt(5, event.getMaxParticipant());
            preparedStatement.setString(6, event.getShortDescription());
            preparedStatement.setString(7, event.getLongDescription());
            preparedStatement.setString(8, event.getImage());
            preparedStatement.setString(9, event.getOrganizerID());
            preparedStatement.setString(10, event.getEventID());

            // Execute query
            int rowsAffected = preparedStatement.executeUpdate();

            // Return rowsAffected to indicate ">0"
            // >0 : Successful update
            return rowsAffected;

        } catch (SQLException e) {
            e.printStackTrace();
            // 0 : SQL query or database connection failed
            return 0;
        }
    }
}
