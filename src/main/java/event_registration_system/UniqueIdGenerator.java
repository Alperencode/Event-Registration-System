package event_registration_system;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class UniqueIdGenerator {

    public static String generateUniqueId(String username, String email) {
        // Combine username, email, and current timestamp
        String dataToHash = username + email + System.currentTimeMillis();

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(dataToHash.getBytes());

            // Convert the first 8 bytes of the hash to a hexadecimal representation
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 8; i++) {
                sb.append(String.format("%02x", hashedBytes[i]));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
