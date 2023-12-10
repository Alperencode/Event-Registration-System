<%@page import="event_registration_system.UserEventsDAO"%>
<%@page import="event_registration_system.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.Event"%>
<!DOCTYPE HTML5>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ERS</title>
        <link rel="stylesheet" href="css/cards.css">
        <script src="js/searchButton.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <%@include  file="../Header/header.jsp" %>

        <!-- Hosting/Joined/Saved buttons -->
        <div class="button-container">
            <a href="MyEvents.jsp?eventType=Hosting&pages=1" style="text-decoration:none; color: inherit;">
                <button class="button">
                    Hosting
                </button>
            </a>
            <a href="MyEvents.jsp?eventType=Joined&pages=1" style="text-decoration:none; color: inherit;">
                <button class="button">
                    Joined
                </button>
            </a>
            <a href="MyEvents.jsp?eventType=Saved&pages=1" style="text-decoration:none; color: inherit;">
                <button class="button">
                    Saved
                </button>
            </a>

            <div class="search-main">
                <input type="text" class="tbox-search" onfocus="setPlaceholder()">
                <a class="btn-search">
                    <i class="fa fa-search"></i>
                </a>
            </div>
        </div>

        <%
            if (request.getParameter("eventType") != null) {
                List<Event> events = UserEventsDAO.getUserEvents(user.getUserID(), request.getParameter("eventType"));
                for (int i = 0; i < events.size(); i++) {
        %>
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
        <%}
            }%>

        <%@include  file="../Pages/pages.jsp" %>

        <script src="js/searchButton.js"></script>
    </body>
</html>
