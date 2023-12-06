package event_registration_system;

// LoginServlet.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate the user against the database using UserDAO
        String userID = UserDAO.validateUser(username, password);
        if (userID != null) {
            // If valid, create a session and redirect to a index page with session
            HttpSession session = request.getSession();
            session.setAttribute("user", userID);
            response.sendRedirect("index.jsp");
        } else {
            // If invalid, redirect back to the login page with an error message
            response.sendRedirect("Login/login.jsp?error=true");
        }
    }
}
