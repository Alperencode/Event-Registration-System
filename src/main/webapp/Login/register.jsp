<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>ERS Sign Up</title>
    </head>

    <body>
        <%@include file="/Header/header.jsp" %>

        <section class="preloader">
            <div class="spinner">
                <span class="sk-inner-circle"></span>
            </div>
        </section>

        <main>

            <section class="sign-in-form section-padding">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-8 mx-auto col-12">

                            <h1 class="hero-title text-center mb-5">Sign Up to ERS</h1>

                            <div class="div-separator w-50 m-auto my-5"><span></span></div>

                            <div class="row">
                                <div class="col-lg-8 col-11 mx-auto">
                                    <form action="/Event-Registration-System/RegisterServlet" role="form" method="post">

                                        <div class="form-floating">
                                            <input type="text" name="username" id="username" class="form-control" placeholder="Username" required>

                                            <label for="username">Username</label>
                                        </div>

                                        <div class="form-floating my-4">
                                            <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Email address" required>

                                            <label for="email">Email address</label>
                                        </div>

                                        <div class="form-floating my-4">
                                            <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>

                                            <label for="password">Password</label>

                                        </div>

                                        <%
                                        // Connection error
                                        if (request.getParameter("connError") != null && request.getParameter("connError").equals("true")) { %>
                                        <p class="text-center" style="color:red;">Registration failed, Please try again.</p>
                                        <% }%> 
                                        <%
                                        // Username already exist
                                        if (request.getParameter("usernameExist") != null && request.getParameter("usernameExist").equals("true")) { %>
                                        <p class="text-center" style="color:red;">This username already exists, please try another one.</p>
                                        <% }%> 
                                        <%
                                        // Email already exist
                                        if (request.getParameter("emailExist") != null && request.getParameter("emailExist").equals("true")) { %>
                                        <p class="text-center" style="color:red;">This email already exists, please try another one.</p>
                                        <% }%> 

                                        <button type="submit" class="btn custom-btn form-control mt-4 mb-3">
                                            Create account
                                        </button>

                                        <p class="text-center">Already have an account? Please <a href="login.jsp">Sign In</a></p>

                                    </form>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </section>

        </main>
        <%@include file="/Footer/footer.jsp" %>
    </body>
</html>
