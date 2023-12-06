package event_registration_system;

// EventDAO.java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

public class EventDAO {
    // Methods for CRUD operations on the Events table

    public static boolean checkEventNameExists(String eventName, String organizerID) {
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM events WHERE eventName LIKE ? and organizerID = ?")) {
            preparedStatement.setString(1, eventName);
            preparedStatement.setString(2, organizerID);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static int registerEvent(
            String eventName, String eventDateTime, String maxParcitipant,
            String shortDescription, String longDescription, String image,
            String organizerID
    ) throws ParseException {
        /*
            Event Registration function for database
        returns:
        >0 : Successfull registration
        -1 : if eventName already exists
        0  : sql query or database connection failed
         */
        if (checkEventNameExists(eventName, organizerID)) {
            return -1;
        }

        String eventID = Hash.generateUniqueId(eventName);
        String eventDate = Converters.convertDate(eventDateTime);
        String eventTime = Converters.convertTime(eventDateTime);

        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO events (eventID, eventName, eventDate, eventTime, shortDescription, longDescription, image, organizerID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, eventID);
            preparedStatement.setString(2, eventName);
            preparedStatement.setString(3, eventDate);
            preparedStatement.setString(4, eventTime);
            preparedStatement.setString(5, shortDescription);
            preparedStatement.setString(6, longDescription);
            preparedStatement.setString(7, image);
            preparedStatement.setString(8, organizerID);

            // Use executeUpdate for INSERT statements
            int rowsAffected = preparedStatement.executeUpdate();

            // If there is no error, registerUserEvents 
            registerUserEvents(organizerID, eventID, "Hosting");
            return rowsAffected; // If a new user is inserted, return true
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static int registerUserEvents(String userID, String eventID, String eventType) throws ParseException {
        /*
            Registration function for database
        returns:
        >0 : Successfull registration
        0  : sql query or database connection failed
         */

        String userEventID = Hash.generateUniqueId(userID, eventID);
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO user_events (userEventID, userID, eventID, eventType) VALUES (?, ?, ?, ?)")) {
            preparedStatement.setString(1, userEventID);
            preparedStatement.setString(2, userID);
            preparedStatement.setString(3, eventID);
            preparedStatement.setString(4, eventType);

            // Use executeUpdate for INSERT statements
            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        
    }
}
