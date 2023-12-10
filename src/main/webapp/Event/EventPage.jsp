<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.Event"%>
<%@page import="event_registration_system.Event"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event Page Viewer</title>
        <link rel="stylesheet" href="css/EventPage.css">
    </head>
    <body>
        <%@include file="../Header/header.jsp" %>

        <%
            String eventID = request.getParameter("eventID");
            if (request.getParameter("eventID") != null) {
                Event event = EventDAO.getEvent(eventID);
        %>

        <div class="event-container">
            <%-- 
            <div class="upload-area" onclick="openFileExplorer()">
                <img src="<%out.println("../Images/" + event.getImage());%>" style="weight:300px;">
            </div>
            --%>
            <div class="event-container">
                <div class="event-info" id="eventInfo">
                    <br><br>
                    <div class="input-group">
                        <label for="usernameInput" class="input-label">Event Name: <%out.println(event.getEventName());%></label>
                    </div>

                    <div class="input-group">
                        <label for="eventDate" class="input-label">Date <%out.println(event.getEventDate());%></label>
                    </div>

                    <div class="input-group">
                        <label for="eventTime" class="input-label">Time: <%out.println(event.getEventTime());%></label>
                    </div>

                    <div class="input-group">
                        <label for="eventLocation" class="input-label">Location: <%out.println(event.getEventLocation());%></label>
                    </div>

                    <div class="input-group">
                        <label for="numberOfParticipants">Number of Participants: <%out.println(event.getMaxParticipant());%></label>
                    </div>

                    <div class="button-group">
                        <button class="join-button">Join</button>
                        <button class="leave-button">Leave</button>
                    </div>
                    <button class="save-button">Save</button>

                </div>
            </div>

        </div>
        <br><br><br><br>
        <div class="input-group">
            <label for="description">Description:</label>
            <textarea readonly id="description" name="description" ><%out.println(event.getLongDescription());%></textarea>
        </div>
        <br>
        <div id="participantsList">
            <h3>Participants List</h3>
            <div id="participantContainer">
                <ul id="participants">
                    <%
                        for (int i = 0; i < 10; i++) {
                    %>                                
                    <li>
                        <span>User <% out.println(i + 1); %></span>

                    </li>
                    <%}%>
                </ul>

            </div>
        </div>
        <%} else {%>
        <p style="color:red; font-size:50px; font-weight: bold"> Event Not Found </p>
        <%}%>
        <script src="js/EventPage.js"></script>
    </body>
</html>
