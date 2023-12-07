<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>ERS Register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="../Header/header.jsp" %>

        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up to ERS</h2>
                            <form method="POST" action="/Event-Registration-System/RegisterServlet" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="name" placeholder="Your Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <input type="email" name="email" id="email" placeholder="Your Email" required/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="passwd" placeholder="Password" required/>
                                </div>
                                <%
                                // Connection error
                                if (request.getParameter("connError") != null && request.getParameter("connError").equals("true")) { %>
                                <div class="form-group">
                                    <p style="color: red;">Registration failed, Please try again.</p>
                                </div>
                                <% }%> 
                                <%
                                // Username already exist
                                if (request.getParameter("usernameExist") != null && request.getParameter("usernameExist").equals("true")) { %>
                                <div class="form-group">
                                    <p style="color: red;">This username already exists, Try another one.</p>
                                </div>
                                <% }%> 
                                <%
                                // Email already exist
                                if (request.getParameter("emailExist") != null && request.getParameter("emailExist").equals("true")) { %>
                                <div class="form-group">
                                    <p style="color: red;">This email already exists, Try another one.</p>
                                </div>
                                <% }%> 
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                            <a href="login.jsp" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>