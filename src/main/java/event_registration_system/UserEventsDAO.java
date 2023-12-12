package event_registration_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

public class UserEventsDAO {
    // Methods for CRUD operations on the user_events table

    public static int createUserEvents(String userID, String eventID, String eventType) throws ParseException {
        if(EventDAO.getParticipant(eventID) >= EventDAO.getEvent(eventID).getMaxParticipant()){
            return -1;
        }
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
    
    public static int deleteUserEventsByType(String userID, String eventType) {
        // Prepare query to delete a record from user_events
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "DELETE FROM user_events WHERE userID = ? and eventType = ?")) {
            preparedStatement.setString(1, userID);
            preparedStatement.setString(2, eventType);

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

    public static boolean isUser(String userID, String eventID, String eventType) {
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM user_events WHERE userID = ? and eventID = ? and eventType = ?")) {
            preparedStatement.setString(1, userID);
            preparedStatement.setString(2, eventID);
            preparedStatement.setString(3, eventType);

            ResultSet resultSet = preparedStatement.executeQuery();

            return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
            // Handle SQL errors or database connection issues
        }
    }
    
    public static List<Event> getUserEvents(String userID, String eventType) {
        List<Event> events = new ArrayList<>();

        // Prepare query to select user's all event with specified type
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM user_events WHERE userID = ? and eventType = ?")) {
            preparedStatement.setString(1, userID);
            preparedStatement.setString(2, eventType);

            ResultSet resultSet = preparedStatement.executeQuery();

            // Iterate through the result set and create Event objects
            while (resultSet.next()) {
                events.add(EventDAO.getEvent(resultSet.getString("eventID")));
            }
            return events;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL errors or database connection issues
        }

        return events;
    }
    
    public static List<User> getUserEventsByEventID(String eventID, String eventType) {
        List<User> users = new ArrayList<>();

        // Prepare query to select user's all event with specified type
        try (Connection connection = DatabaseConnection.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT * FROM user_events WHERE eventID = ? and eventType = ?")) {
            preparedStatement.setString(1, eventID);
            preparedStatement.setString(2, eventType);

            ResultSet resultSet = preparedStatement.executeQuery();

            // Iterate through the result set and create Event objects
            while (resultSet.next()) {
                users.add(UserDAO.getUser(resultSet.getString("userID")));
            }
            return users;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}
