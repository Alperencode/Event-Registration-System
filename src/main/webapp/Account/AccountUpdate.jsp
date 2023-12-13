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
                return;
            }

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            boolean isUsername = username != null && username.length() > 0;
            boolean isEmail = email != null && email.length() > 0;
            boolean isPassword = password != null && password.length() > 0;

            if (isUsername) {
                if (UserDAO.checkUsernameExists(username)) {
                    response.sendRedirect("Account.jsp?usernameExist=true");
                    return;
                }
                user.setUsername(username);
            }
            if (isEmail) {
                if (UserDAO.checkEmailExists(email)) {
                    response.sendRedirect("Account.jsp?emailExist=true");
                    return;
                }
                user.setEmail(email);
            }
            if (isPassword) {
                user.setPassword(Hash.hashPassword(password));
            }
            if (isUsername || isEmail || isPassword) {
                int result = UserDAO.updateUser(user);
                if (result > 0) {
                    response.sendRedirect("Account.jsp?success=true");
                } else {
                    response.sendRedirect("Account.jsp?connError=true");
                }
            } else {
                response.sendRedirect("Account.jsp?emptyUpdate=true");
            }
        %>
    </body>
</html>
