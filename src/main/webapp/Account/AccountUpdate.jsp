<%@page import="event_registration_system.Hash"%>
<%@page import="event_registration_system.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@include file="../Header/header.jsp" %>

        <%
            if (user == null) {
                response.sendRedirect("../Login/login.jsp");
            }

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            boolean isUsername = username != null && username.length() > 0;
            boolean isEmail = email != null && email.length() > 0;
            boolean isPassword = password != null && password.length() > 0;

            if (isUsername) {
                user.setUsername(username);
            }
            if (isEmail) {
                user.setEmail(email);
            }
            if (isPassword) {
                user.setPassword(Hash.hashPassword(password));
            }
            if (isUsername || isEmail || isPassword) {
                UserDAO.updateUser(user);
                response.sendRedirect("Account.jsp?success=true");
            } else {
                response.sendRedirect("Account.jsp?emptyUpdate=true");
            }
        %>
    </body>
</html>
