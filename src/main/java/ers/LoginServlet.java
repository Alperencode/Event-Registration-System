package ers;

// LoginServlet.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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

        System.out.println("Entered credentials - Username: " + username + ", Password: " + password);

        // Validate the user against the database using UserDAO
        if (UserDAO.validateUser(username, password)) {
            // If valid, create a session and redirect to a welcome page
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("welcome.jsp");
        } else {
            // If invalid, redirect back to the login page with an error message
            response.sendRedirect("Login/login.jsp?error=true");
        }
    }
}
