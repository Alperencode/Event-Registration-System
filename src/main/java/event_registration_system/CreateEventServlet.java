package event_registration_system;

// CreateEventServlet.java
import java.io.IOException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String image = request.getParameter("image");
        String eventName = request.getParameter("eventName");
        String eventDateTime = request.getParameter("eventDateTime");
        String maxParcitipant = request.getParameter("maxParticipant");
        String shortDescription = request.getParameter("shortDescription");
        String longDescription = request.getParameter("description");

        HttpSession session = request.getSession();
        String organizerID = (String) session.getAttribute("userID");

        // Register the event using EventDAO
        int result = 0;
        try {
            result = EventDAO.registerEvent(
                    eventName, eventDateTime, maxParcitipant,
                    shortDescription, longDescription, image,
                    organizerID
            );
        } catch (ParseException ex) {
            // Auto-Created try-catch block
            Logger.getLogger(CreateEventServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (result == -1) {
            // -1: EventName already exists
            response.sendRedirect("Event/EventCreation.jsp?eventNameExist=true");
        } else if (result == 0) {
            // 0: Sql query or database connection failed
            response.sendRedirect("Event/EventCreation.jsp?connError=true");
        } else {
            // >0 : Registration successfull
            response.sendRedirect("Event/EventCreation.jsp?successfull=true");
        }
    }
}
