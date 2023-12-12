<%@page import="event_registration_system.UserEventsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String userID = request.getParameter("userID");
            String eventID = request.getParameter("eventID");
            String eventType = request.getParameter("eventType");
            String operation = request.getParameter("operation");

            eventType = eventType != null ? eventType.trim() : null;
            userID = userID != null ? userID.trim() : null;
            eventID = eventID != null ? eventID.trim() : null;

            if (operation != null) {
                int result = 0;
                switch (operation) {
                    case "Leave":
                        result = UserEventsDAO.deleteUserEventsByType(userID, eventType);
                        if (result > 0) {
                            response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&Leaved=true");
                        }
                        break;
                    case "UnSave":
                        result = UserEventsDAO.deleteUserEventsByType(userID, eventType);
                        if (result > 0) {
                            response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&Un-Saved=true");
                        }
                        break;
                }
                if (result == 0) {
                    response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&connError=true");
                }
            } else {
                int result = UserEventsDAO.createUserEvents(userID, eventID, eventType);
                if (result == 0) {
                    response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&connError=true");
                } else if (result == -1) {
                    response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&maxParticipant=true");
                } else {
                    response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&success=true&eventType=" + eventType);
                }
            }
        %>
    </body>
</html>
