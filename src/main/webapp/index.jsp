<%@page import="event_registration_system.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Registration System</title>
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("user");
            if(user != null){
            %>
                <h1>Welcome <% out.println(user.getUsername()); %></h1>
                <a href=Event/EventCreation.jsp>Create Event</a>
            <%
            }
        %>
        <h1>Event Registration System</h1>
        <a href="Login/login.jsp">Login Page</a>
    </body>
</html>
