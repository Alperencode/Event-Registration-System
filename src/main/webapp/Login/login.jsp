<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Sign In Page</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">

        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;700;900&display=swap" rel="stylesheet">

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/bootstrap-icons.css" rel="stylesheet">

        <link href="../css/slick.css" rel="stylesheet">

        <link href="../css/tooplate-little-fashion.css" rel="stylesheet">

    </head>

    <body>

        <section class="preloader">
            <div class="spinner">
                <span class="sk-inner-circle"></span>
            </div>
        </section>

        <main>
            <form method="POST" action="/Event-Registration-System/LoginServlet" class="register-form">
                <section class="sign-in-form section-padding">
                    <div class="container">
                        <div class="row">

                            <div class="col-lg-8 mx-auto col-12">

                                <h1 class="hero-title text-center mb-5">Sign In to ERS</h1>

                                <div class="row">
                                    <div class="col-lg-8 col-11 mx-auto">
                                        <form role="form" method="post">

                                            <div class="form-floating mb-4 p-0">
                                                <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Email address" required>

                                                <label for="email">Email address</label>
                                            </div>

                                            <div class="form-floating p-0">
                                                <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>

                                                <label for="password">Password</label>
                                            </div>
                                            
                                            <%
                                                // If login fails
                                                if (request.getParameter("error") != null && request.getParameter("error").equals("true")) {%>
                                                <br>
                                                <p class="text-center" style="color:red;">Invalid email or password, please try again</p>
                                            <%}%>

                                            <button type="submit" class="btn custom-btn form-control mt-4 mb-3">
                                                Sign in
                                            </button>

                                            <p class="text-center">Do you have an account? <a href="register.jsp">Create One</a></p>

                                        </form>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </section>
            </form>
        </main>

        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.bundle.min.js"></script>
        <script src="../js/Headroom.js"></script>
        <script src="../js/jQuery.headroom.js"></script>
        <script src="../js/slick.min.js"></script>
        <script src="../js/custom.js"></script>

    </body>
</html>
