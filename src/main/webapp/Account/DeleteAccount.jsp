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
            if(UserDAO.deteleUser(user.getUserID())){
                response.sendRedirect("LogOut.jsp");
            }else{
                response.sendRedirect("Account.jsp?deleteFailed=true");
            }
        %>
    </body>
</html>
