package event_registration_system;

// RegisterServlet.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get Parameters from form
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Setup user values
        String userID = Hash.generateUniqueId(username, email);
        String hashedPassword = Hash.hashPassword(password);

        // Assign user object values
        User user = new User(
                userID, username, email, hashedPassword
        );

        // Initialize returnValue
        int returnValue = 0;
        
        // Try to register user
        returnValue = UserDAO.createUser(user);
        
        // Redirect according to returnValue
        if (returnValue == -1) {
            // -1: Username already exists
            response.sendRedirect("Login/register.jsp?usernameExist=true");
        } else if (returnValue == -2) {
            // -2: Email already exists
            response.sendRedirect("Login/register.jsp?emailExist=true");
        } else if (returnValue == 0) {
            // 0: Sql query or database connection failed
            response.sendRedirect("Login/register.jsp?connError=true");
        } else {
            // >0 : Registration successfull
            HttpSession session = request.getSession();
            session.setAttribute("user", UserDAO.getUser(userID));
            response.sendRedirect("index.jsp");
        }
    }
}
