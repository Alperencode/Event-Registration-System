<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Event</title>
        <link rel="stylesheet" href="css/CreateEvent.css">
        <link rel="stylesheet" href="css/import_image.css">
    </head>
    <body>
        <%@include file="../Header/header.jsp" %>
        <% if(user == null){ response.sendRedirect("../Login/login.jsp"); } %>

        <form action="/Event-Registration-System/CreateEventServlet" method="POST">

            <div class="event-container">
                <div class="event-container">
                    <div class="upload-area" onclick="openFileExplorer()">
                        <input type="file" name="image" id="fileInput" accept="image/*" style="display: none" onchange="loadImage()">
                        <img id="uploadedImage">
                        <p id="uploadText">Click to upload</p>
                    </div>
                </div>  
                <div class="event-info" id="eventInfo">
                    <%
                        if (request.getParameter("eventNameExist") != null && request.getParameter("eventNameExist").equals("true")) {
                    %>
                    <p style="color:red;font-size:26px;"> You already created event with same name! </p>
                    <%
                    } else if (request.getParameter("connError") != null && request.getParameter("connError").equals("true")) {
                    %>
                    <p style="color:red;font-size:26px;"> Something went wrong, please try again. </p>
                    <%
                    } else if (request.getParameter("successfull") != null && request.getParameter("successfull").equals("true")) {
                    %>
                    <p style="color:green;font-size:26px;"> Event successfully created! </p>
                    <%}%>
                    <div class="input-group">
                        <label for="eventName" class="input-label">Event Name:</label>
                        <input type="text" id="eventName" name="eventName" placeholder="Enter event name">
                    </div>

                    <div class="input-group">
                        <label for="eventDateTime">Date/Time:</label>
                        <input type="datetime-local" name="eventDateTime" id="eventDateTime"><br><br>
                    </div>

                    <div class="input-group">
                        <label for="eventName" class="input-label">Location:</label>
                        <input type="text" id="location" name="location" placeholder="Enter event location">
                    </div>

                    <div class="input-group">
                        <label for="shortDescription">Short Description:</label>
                        <textarea id="shortDescription" placeholder="(max 100 characters)" maxlength="100" name="shortDescription"></textarea>
                    </div>

                    <div class="input-group">
                        <label for="longDescription">Detailed Description:</label>
                        <textarea id="longDescription" placeholder="(max 250 characters)" maxlength="250" name="longDescription" required></textarea>
                    </div>

                    <div class="input-group">
                        <label for="maxParticipant">Max Participant:</label>
                        <input type="number" id="maxParticipant" name="maxParticipant" min="1" placeholder="Max participant for the event">
                    </div>

                    <div class="button-group">
                        <button class="update-button" id="createButton" onclick="validateAndSubmit()">Create</button>
                    </div>
                </div>
            </div>
        </form>
        <script src="js/CreateEvent.js"></script>
        <script src="js/import_image.js"></script>
    </body>
</html>
