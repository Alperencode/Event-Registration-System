<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>account</title>
        <link rel="stylesheet" href="css/accountUpdate.css">
    </head>
    <body>
        <%@include file="../Header/header.jsp" %>
        <div class="event-container">
            <%@include file="import_image.jsp" %>
            <div class="event-info" id="eventInfo">
                <div class="input-group">
                    <label for="usernameInput" class="input-label">Username:</label>
                    <input type="text" id="usernameInput" name="usernameInput" placeholder="Enter username">
                </div>

                <div class="input-group">
                    <label for="emailInput" class="input-label">Email:</label>
                    <input type="email" id="emailInput" name="emailInput" placeholder="Enter email">
                </div>

                <div class="input-group">
                    <label for="passwordInput" class="input-label">New Password:</label>
                    <input type="password" id="passwordInput" name="passwordInput" placeholder="Enter password">
                </div>

                <div class="button-group">
                    <button class="update-button">Update</button>
                    <button class="delete-button">Delete Account</button>
                </div>
            </div>
        </div>
    </body>
</html>
