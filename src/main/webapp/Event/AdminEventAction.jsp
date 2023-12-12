<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.UserEventsDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@include file="/Header/header.jsp" %>

        <%
            String eventID = request.getParameter("eventID");
            String operation = request.getParameter("operation");

            eventID = eventID != null ? eventID.trim() : null;

            if (!UserEventsDAO.isUser(user.getUserID(), eventID, "Hosting")) {
                response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&connError=true");
                return;
            }

            switch (operation) {
                case "Update":
                    response.sendRedirect("CreateEvent.jsp?eventID=" + eventID);
                    return;
                case "Delete":
                    int result = EventDAO.deleteEvent(eventID);
                    if (result == 0) {
                        response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&connError=true");
                        return;
                    } else {
                        response.sendRedirect("EventPage.jsp?eventID=" + eventID + "&eventDeleteSuccess=true");
                    }
                    break;
            }
        %>
    </body>
</html>
