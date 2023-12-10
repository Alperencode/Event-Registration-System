<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event Page Host</title>
        <link rel="stylesheet" href="css/EventPageHost.css">
        <link rel="stylesheet" href="css/CreateEvent.css">

    </head>
    <body>
        <%@include file="../Header/header.jsp" %>
        <% if(user == null){ response.sendRedirect("../Login/login.jsp"); } %>
        <div class="event-container">
            <%@include file="import_image.jsp" %>
            <div class="event-info" id="eventInfo">
                <div class="input-group">
                    <label for="usernameInput" class="input-label">Event Name:</label>
                    <input type="text" id="usernameInput" name="usernameInput" placeholder="Enter username">
                </div>

                <div class="input-group">
                    <label for="eventDateTime">Date/Time:</label>
                    <input type="datetime-local" name="eventDateTime" id="eventDateTime"><br><br>
                </div>

                <div class="input-group">
                    <label for="maxParticipant">Participant:</label>
                    <input type="number" id="maxParticipant" name="maxParticipant" min="0" placeholder="Leave empty for unlimited">
                </div>

                <div class="button-group">
                    <button class="update-button">Update</button>
                    <button class="delete-button">Delete Account</button>
                </div>
            </div>

        </div>
        <br><br><br><br>

        <div class="input-group">
            <label for="description">Description:</label>
            <textarea id="description" placeholder="(max 250 characters)" maxlength="250" name="description" required></textarea>
        </div>
        <div id="participantsList">
            <h3>Participants List</h3>
            <div id="participantContainer">
                <ul id="participants">
                    <%
                        for (int i = 0; i < 10; i++) {
                    %>                                
                    <li>
                        <span>User <% out.println(i + 1); %></span>
                        <button onclick="removeParticipant(this)">Remove</button>
                    </li>
                    <%}%>
                </ul>

            </div>
        </div>
        <div id="removedUsersList">
            <h3>Removed Users List</h3>
            <ul id="removedUsers"></ul>
        </div>

        <script src="js/EventPageHost.js"></script>
    </body>
</html>
