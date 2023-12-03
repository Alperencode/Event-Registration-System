package event_registration_system;

public class User {
    private String userID, username, email, password, creationDate;

    public User(String userID, String username, String email, String password, String creationDate) {
        this.userID = userID;
        this.username = username;
        this.email = email;
        this.password = password;
        this.creationDate = creationDate;
    }
    
    public User(){}
    
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
