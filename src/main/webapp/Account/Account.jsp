<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>account</title>
        <link rel="stylesheet" href="css/accountUpdate.css">
        <link rel="stylesheet" href="css/import_image.css">
    </head>
    <body>
        <%@include file="../Header/header.jsp" %>

        <form action="AccountUpdate.jsp" method="POST" name="updateForm">

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
                        if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
                    <div class="form-group">
                        <p style="color: green;font-size:26px;">Account details updated successfully!</p>
                    </div>
                    <%}
                        if (request.getParameter("emptyUpdate") != null && request.getParameter("emptyUpdate").equals("true")) { %>
                    <div class="form-group">
                        <p style="color: red;font-size:26px;">Nothing changed, try to change anything</p>
                    </div>
                    <% }
                        if (request.getParameter("deleteFailed") != null && request.getParameter("deleteFailed").equals("true")) { %>
                    <div class="form-group">
                        <p style="color: red;font-size:26px;">Account deletion failed, please try again.</p>
                    </div>
                    <%}%>
                    <div class="input-group">
                        <label for="usernameInput" class="input-label">Username:</label>
                        <input type="text" id="usernameInput" name="username" placeholder="Enter new username">
                    </div>

                    <div class="input-group">
                        <label for="emailInput" class="input-label">Email:</label>
                        <input type="email" id="emailInput" name="email" placeholder="Enter new email">
                    </div>

                    <div class="input-group">
                        <label for="passwordInput" class="input-label">New Password:</label>
                        <input type="password" id="passwordInput" name="password" placeholder="Enter new password">
                    </div>

                    <div class="button-group">
                        <input style="margin-right:15px" type="submit" value="Update">
                        </form>
                        <form action="DeleteAccount.jsp" method="POST">
                            <input type="submit" value="Delete Account">
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
