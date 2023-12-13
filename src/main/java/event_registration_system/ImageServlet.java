package event_registration_system;

import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ImageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String eventID = request.getParameter("eventID");
        
        byte[] imageData = null;
        try {
            imageData = EventImagesDAO.getEventImage(eventID);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        if (imageData != null && imageData.length > 0) {
            response.setContentType("image/jpeg");
            response.setContentLength(imageData.length);
            OutputStream outStream = response.getOutputStream();
            outStream.write(imageData);
            outStream.close();
        } else{
            String defaultImagePath = "images/default.jpeg";
            response.sendRedirect(defaultImagePath);
        }

    }
}
