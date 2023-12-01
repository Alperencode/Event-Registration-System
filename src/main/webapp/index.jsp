<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Registration System</title>
    </head>
    <body>
        <%
            if(session.getAttribute("username") != null){
                out.println("<h1>Welcome " + session.getAttribute("username") + "!</h1>");
            }
        %>
        <h1>Event Registration System</h1>
        <a href="Login/login.jsp">Login Page</a>
    </body>
</html>
