package event_registration_system;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get Parameters from form
        String image = request.getParameter("image");
        String eventName = request.getParameter("eventName");
        String eventDateTime = request.getParameter("eventDateTime");
        String maxParcitipantString = request.getParameter("maxParticipant");
        String location = request.getParameter("location");
        String shortDescription = request.getParameter("shortDescription");
        String longDescription = request.getParameter("longDescription");

        // Get session to gather userID
        HttpSession session = request.getSession();

        // Initialize empty event object
        Event event = new Event();
        
        // Setup event values
        String organizerID = ((User) session.getAttribute("user")).getUserID();
        String eventID = Hash.generateUniqueId(eventName);
        try {
            String eventDate = Converters.convertDate(eventDateTime);
            String eventTime = Converters.convertTime(eventDateTime);
            int maxParcitipant = Integer.parseInt(maxParcitipantString);
            
            // Assign event object values
            event = new Event(
                eventID, eventName, eventDate, eventTime, location,
                maxParcitipant, shortDescription, longDescription, image, organizerID
            );
        } catch (NumberFormatException | ParseException e) {
            response.sendRedirect("Event/EventCreation.jsp?connError=true");
        }

        // Initialize return value
        int returnValue = 0;
        
        // Try to register event
        try {
            returnValue = EventDAO.registerEvent(event);
        } catch (ParseException ex) {
            response.sendRedirect("Event/EventCreation.jsp?connError=true");
        }
        
        // Redirect according to returnValue
        if (returnValue == -1) {
            // -1: EventName already exists
            response.sendRedirect("Event/EventCreation.jsp?eventNameExist=true");
        } else if (returnValue == 0) {
            // 0: Sql query or database connection failed
            response.sendRedirect("Event/EventCreation.jsp?connError=true");
        } else {
            // >0 : Registration successfull
            response.sendRedirect("Event/EventCreation.jsp?successfull=true");
        }
    }
}
