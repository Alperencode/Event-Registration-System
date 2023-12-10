<%@page import="event_registration_system.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.Event"%>
<%@page import="event_registration_system.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Event/css/cards.css">
        <title>My Events</title>
    </head>
    <body>
        <%@include file="/Header/header.jsp" %>
        <br><br><br>
        <%
            List<Event> events = EventDAO.getAllEvents();
            for (int i = 0; i < events.size(); i++) { %>
     <div class="card-container">
            <div class="card">
                <img src="${pageContext.request.contextPath}/Images/image.jpg"> 
                <div>
                    <a href="${pageContext.request.contextPath}/Event/EventPage.jsp?eventID=<% out.println(events.get(i).getEventID());%>" >
                        <div id="eventName" style="cursor: pointer; color: #333; text-decoration: underline;">
                            <h2><% out.println(events.get(i).getEventName()); %></h2>
                        </div>
                    </a>
                    <h3>Host: <% out.println(UserDAO.getUser(events.get(i).getOrganizerID()).getUsername());  %></h3>
                    <h3>Date: <% out.println(events.get(i).getEventDate()); %></h3>
                    <h3>Time: <% out.println(events.get(i).getEventTime()); %> </h3>
                    <h3>Location: <% out.println(events.get(i).getEventLocation()); %></h3>
                    <h3>Description: <% out.println(events.get(i).getShortDescription()); %></h3>
                </div>
            </div>
        </div>
        <br><br><br>
        <%}%>
    </body>
</html>
