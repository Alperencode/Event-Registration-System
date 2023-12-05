package event_registration_system;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {

    public static String generateUniqueId(String arg1, String arg2) {
        // Combine arg1, arg2, and current timestamp
        String dataToHash = arg1 + arg2 + System.currentTimeMillis();

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
    
    public static String generateUniqueId(String arg1) {
        // Combine arg1 and current timestamp
        String dataToHash = arg1 + System.currentTimeMillis();

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

    public static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());

            // Truncate the hash to 16 characters (32 bytes)
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < Math.min(16, hashedBytes.length); i++) {
                sb.append(String.format("%02x", hashedBytes[i]));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
