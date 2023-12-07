<%@page import="event_registration_system.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Event/css/cards.css">

        <title>Event Registration System</title>
    </head>
    <body>
        <%@include file="/Header/header.jsp" %>

        <h1>Event Registration System</h1>
        <%
            if (user != null) {
        %>
        <h1>Welcome <% out.println(user.getUsername()); %></h1>
        <%
            }
        %>
        
        <br>
        <% for (int i = 0; i < 5; i++) { %>
        <div class="card-container">
            <div class="card">
                <img src="${pageContext.request.contextPath}/Images/image.jpg"> 
                <div>
                    <div id="eventName" style="cursor: pointer; color: #333; text-decoration: underline;" onclick="goToEventPage()">
                        <h2>Event Name</h2>
                    </div>
                    <h3>Host:</h3>
                    <h3>Date:</h3>
                    <h3>Time:</h3>
                    <h3>Location:</h3>
                    <h3>Short description:</h3>
                </div>
            </div>
        </div>
        <br><br><br>
        <%}%>
    </body>
</html>
