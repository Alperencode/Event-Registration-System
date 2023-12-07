<%@page import="event_registration_system.User"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ERS</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Header/header.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/Header/searchButton.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!-- Font Awesome kütüphanesi -->
    </head>
    <body>
        <header>
            <div class="header-container">
                <a href ="${pageContext.request.contextPath}/index.jsp">ERS</a>
                <a href= "${pageContext.request.contextPath}/Event/Events.jsp">Events</a> 
                <div class="search-main">
                    <input type="text" class="tbox-search" onfocus="setPlaceholder()">
                    <a class="btn-search">
                        <i class="fa fa-search"></i>
                    </a>
                </div>
                <%
                    User user = (User) session.getAttribute("user");
                    if (user != null) {
                %>
                <div class="dropdown">
                    <a class="dropdown-btn">My Events</a>
                    <div class="dropdown-content" id="myEventsDropdown">
                        <a href="${pageContext.request.contextPath}/Event/MyEvents.jsp?eventType=Hosting&page=1">
                            Hosting Events
                        </a>
                        <a href="${pageContext.request.contextPath}/Event/MyEvents.jsp?eventType=Joined&page=1">
                            Joined Events</a>
                        <a href="${pageContext.request.contextPath}/Event/MyEvents.jsp?eventType=Saved&page=1">
                            Saved Events</a>
                        <a href="${pageContext.request.contextPath}/Event/CreateEvent.jsp">
                            Create Events</a>
                    </div>
                </div>
                <div class="dropdown">
                    <a class="dropdown-btn">Welcome <%out.println(user.getUsername().toUpperCase()+"!");%></a>
                    <div class="dropdown-content" id="myEventsDropdown">
                        <a href="${pageContext.request.contextPath}/Account/accountUpdate.jsp">Account Update</a>
                        <a href="${pageContext.request.contextPath}/Account/logOut.jsp">Log-Out</a>
                    </div>
                </div>
            </div>
            <%} else {%>
                <a href = "Login/login.jsp">Login</a>
                <a href = "Login/register.jsp">Register</a>
            <%}%>

        </header>
        <script src="${pageContext.request.contextPath}/Header/header.js"></script>
        <script src="${pageContext.request.contextPath}/Header/searchButton.js"></script>
    </body>
</html>