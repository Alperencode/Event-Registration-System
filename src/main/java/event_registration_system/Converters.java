package event_registration_system;

import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Converters {

    public static String convertDate(String date) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        java.sql.Date sqlDate = new java.sql.Date(formatter.parse(date).getTime());

        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        String eventDate = dateFormatter.format(sqlDate);
        return eventDate;
    }

    public static String convertTime(String date) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        java.sql.Date sqlDate = new java.sql.Date(formatter.parse(date).getTime());
        SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm");
        String eventTime = timeFormatter.format(sqlDate);
        return eventTime;
    }
}
