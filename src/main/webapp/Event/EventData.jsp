<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>
        <%
            // CREATED TO TEST AND VIEW COMING DATA
            String image = request.getParameter("image");
            String eventName = request.getParameter("eventName");
            String eventDateTime = request.getParameter("eventDateTime");
            String maxParcitipant = request.getParameter("maxParticipant");
            String shortDescription = request.getParameter("shortDescription");
            String description = request.getParameter("description");
            

            out.println("Image: " + image + "<br><br>");
            out.println("eventName: " + eventName + "<br><br>");
            out.println("eventDateTime: " + eventDateTime + "<br><br>");
            out.println("maxParcitipant: " + maxParcitipant + "<br><br>");
            out.println("shortDescription: " + shortDescription + "<br><br>");
            out.println("description: " + description + "<br><br>");
        %>
        </h1>
    </body>
</html>
