package event_registration_system;

// EventDAO.java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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

    public static String convertDate(String date) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        java.sql.Date sqlDate = new java.sql.Date(formatter.parse(date).getTime());

        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String eventDate = dateFormatter.format(sqlDate);
        return eventDate;
    }

    public static String convertTime(String date) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        java.sql.Date sqlDate = new java.sql.Date(formatter.parse(date).getTime());
        SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm");
        String eventTime = timeFormatter.format(sqlDate);
        return eventTime;
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
        String eventDate = convertDate(eventDateTime);
        String eventTime = convertTime(eventDateTime);

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

            return rowsAffected; // If a new user is inserted, return true
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }
}
