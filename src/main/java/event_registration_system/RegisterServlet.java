package event_registration_system;

// RegisterServlet.java
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Register the user using UserDAO
        int result = UserDAO.registerUser(username, email, password);
        if (result == -1) {
            // -1: Username already exists
            response.sendRedirect("Login/register.jsp?usernameExist=true");
        } else if (result == -2) {
            // -2: Email already exists
            response.sendRedirect("Login/register.jsp?emailExist=true");
        } else if (result == 0) {
            // 0: Sql query or database connection failed
            response.sendRedirect("Login/register.jsp?connError=true");
        } else {
            // >0 : Registration successfull
            HttpSession session = request.getSession();
            String userID = UserDAO.validateUser(username, password);
            session.setAttribute("user", UserDAO.getUser(userID));
            response.sendRedirect("index.jsp");
        }
    }
}
