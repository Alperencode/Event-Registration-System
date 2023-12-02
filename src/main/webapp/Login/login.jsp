<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ERS Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <div class="main">

            <!-- Sing in  Form -->
            <section class="sign-in">
                <div class="container">
                    <div class="signin-content">
                        <div class="signin-image">
                            <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                            <a href="register.jsp" class="signup-image-link">Create an account</a>
                        </div>


                        <div class="signin-form">
                            <h2 class="form-title">Sign in to ERS</h2>
                            <form method="POST" action="/Event-Registration-System/LoginServlet" class="register-form">
                                <div class="form-group">
                                    <label for="username"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" placeholder="Your Name" required/>
                                </div>
                                <div class="form-group">
                                    <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" placeholder="Password" required/>
                                </div>
                                <%
                                // If login fails
                                if (request.getParameter("error") != null && request.getParameter("error").equals("true")) { %>
                                <div class="form-group">
                                    <p style="color: red;">Invalid username or password, Please try again.</p>
                                </div>
                                <% }%> 
                                <div class="form-group form-button">
                                    <input type="submit" name="signin" class="form-submit"/>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        </div>
    </section>
</div>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>