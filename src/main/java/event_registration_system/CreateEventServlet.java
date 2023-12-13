package event_registration_system;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // 10MB max file size
public class CreateEventServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get Parameters from form
        String eventName = request.getParameter("eventName");
        String eventDateTime = request.getParameter("eventDateTime");
        String maxParcitipantString = request.getParameter("maxParticipant");
        String location = request.getParameter("location");
        String shortDescription = request.getParameter("shortDescription");
        String longDescription = request.getParameter("longDescription");
        String operation = request.getParameter("operation");
        String eventID = request.getParameter("eventID");

        // Process image
        InputStream inputStream = null;
        Part filePart = request.getPart("image");
        inputStream = filePart != null ? filePart.getInputStream() : null;
        byte[] imageData = inputStream.readAllBytes();

        // Get session to gather userID
        HttpSession session = request.getSession();

        // Initialize empty event object
        Event event = new Event();

        // Setup event values
        String organizerID = ((User) session.getAttribute("user")).getUserID();
        eventID = eventID == null ? Hash.generateUniqueId(eventName) : eventID.trim();

        try {
            String eventDate = Converters.convertDate(eventDateTime);
            String eventTime = Converters.convertTime(eventDateTime);
            int maxParcitipant = Integer.parseInt(maxParcitipantString);
            if (eventID != null && EventDAO.getEvent(eventID) != null) {
                if (EventDAO.getEvent(eventID).getMaxParticipant() > maxParcitipant) {
                    response.sendRedirect("Event/CreateEvent.jsp?eventID=" + eventID + "&lessMaxParticipant=true");
                    return;
                }
            }

            // Assign event object values
            event = new Event(
                    eventID, eventName, eventDate, eventTime, location,
                    maxParcitipant, shortDescription, longDescription, organizerID
            );
        } catch (Exception e) {
            response.sendRedirect("Event/CreateEvent.jsp?connError=true");
            return;
        }

        // Initialize return value
        int returnValue = 0;

        // Try to execute the operation
        try {
            switch (operation) {
                case "Update":
                    returnValue = EventDAO.updateEvent(event);
                    EventImagesDAO.updateImage(eventID, imageData);
                    break;
                case "Create":
                    returnValue = EventDAO.createEvent(event);
                    System.out.println("Calling create event");
                    EventImagesDAO.createEventImage(eventID, imageData);
                    System.out.println("Create event finished");
                    break;
            }

        } catch (ParseException ex) {
            response.sendRedirect("Event/CreateEvent.jsp?connError=true");
        }

        // Redirect according to returnValue
        if (returnValue == -1) {
            // -1: EventName already exists
            response.sendRedirect("Event/CreateEvent.jsp?eventNameExist=true");
        } else if (returnValue == 0) {
            // 0: Sql query or database connection failed
            response.sendRedirect("Event/CreateEvent.jsp?connError=true");
        } else {
            // >0 : Registration successfull
            if(operation.equals("Create")){
                response.sendRedirect("Event/CreateEvent.jsp?successfullCreate=true");
            }else if(operation.equals("Update")){
                response.sendRedirect("Event/CreateEvent.jsp?successfullUpdate=true");
            }
        }
    }
}
