package event_registration_system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        
        // Validate the user against the database using UserDAO
        String userID = UserDAO.validateUser(email, password);
        if (userID != null) {
            // If valid, create a session and redirect to a index page with session
            HttpSession session = request.getSession();

            // Create a cookie and add user ID to it
            if (rememberMe != null && rememberMe.equals("true")) {
                Cookie userIDCookie = new Cookie("userID", userID);
                userIDCookie.setMaxAge(60*60*24); 
                response.addCookie(userIDCookie);
            }

            User user = UserDAO.getUser(userID);
            session.setAttribute("user", user);
            response.sendRedirect("index.jsp");
        } else {
            // If invalid, redirect back to the login page with an error message
            response.sendRedirect("Login/login.jsp?error=true");
        }
    }
}
