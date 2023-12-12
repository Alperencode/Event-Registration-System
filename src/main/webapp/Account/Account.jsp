<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Account</title>
    </head>

    <body>
        <%@include file="../Header/header.jsp" %>
        <% if (user == null) {
                response.sendRedirect("../Login/login.jsp");
                return;
            }%>

        <section class="preloader">
            <div class="spinner">
                <span class="sk-inner-circle"></span>
            </div>
        </section>

        <main>

            <header class="site-header section-padding d-flex justify-content-center align-items-center">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-10 col-12">
                            <h1>
                                <span class="d-block text-dark">Make changes to</span>
                                <span class="d-block text-primary">Your Account</span>

                            </h1>
                        </div>
                    </div>
                </div>
            </header>

            <form action="AccountUpdate.jsp" method="POST" >
                <section class="product-detail section-padding">
                    <div class="container">
                        <div class="row">
                            <%
                                if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
                            <p class="text-center" style="color:green;">Account details updated successfully!</p>
                            <%}
                                if (request.getParameter("emptyUpdate") != null && request.getParameter("emptyUpdate").equals("true")) { %>
                            <p class="text-center" style="color:red;">Nothing changed, try to change anything</p>
                            <% }
                                if (request.getParameter("usernameExist") != null && request.getParameter("usernameExist").equals("true")) { %>
                            <p class="text-center" style="color:red;">Username already exists, try another one.</p>
                            <% }
                                if (request.getParameter("emailExist") != null && request.getParameter("emailExist").equals("true")) { %>
                            <p class="text-center" style="color:red;">Email already exists, try another one</p>
                            <% }
                                if (request.getParameter("connError") != null && request.getParameter("connError").equals("true")) { %>
                            <p class="text-center" style="color:red;">Something went wront, please try again</p>
                            <% }
                                if (request.getParameter("deleteFailed") != null && request.getParameter("deleteFailed").equals("true")) { %>
                            <p class="text-center" style="color:red;">Account deletion failed, please try again.</p>
                            <%}%>
                            <div class="event-container">
                                <div class="upload-area" onclick="openFileExplorer()">
                                    <input type="file" id="fileInput" accept="image/*" style="display: none" onchange="loadImage()">
                                    <img id="uploadedImage">
                                    <p id="uploadText">Click to upload</p>
                                </div>
                            </div> 
                            <br>
                            <p>E-mail:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="email" name="email" id="email" pattern="[^ @]*@[^ @]*" class="form-control" placeholder="Enter new email address">
                                <label for="email">Your new email</label>
                            </div>

                            <p>Username:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="text" name="username" id="username" class="form-control" placeholder="Enter new username">

                                <label for="username">Your new username</label>
                            </div>

                            <p>Password:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="password" name="password" id="password" class="form-control" placeholder="Enter new password">

                                <label for="password">Your new password</label>
                            </div>

                            <div class="product-cart-thumb row">

                                <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                    <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">UPDATE</button>
                                </div>
                                </form>

                                <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                    <form action="DeleteAccount.jsp" method="POST">
                                        <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">DELETE ACCOUNT</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>

        </main>

        <script src="js/import_image.js"></script>
        <%@include file="../Footer/footer.jsp" %>

    </body>
</html>