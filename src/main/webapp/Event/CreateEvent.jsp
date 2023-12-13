<%@page import="event_registration_system.UserEventsDAO"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">
        <link href="css/import_image.css" rel="stylesheet">

        <title>Create Event</title>

    </head>

    <body>
        <%@include file="/Header/header.jsp" %>
        <% if (user == null) {
                response.sendRedirect("../Login/login.jsp");
                return;
            } %>

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
                                <span class="d-block text-dark">Let's Create</span>
                                <span class="d-block text-primary">a New Event</span>

                            </h1>
                        </div>
                    </div>
                </div>
            </header>

            <form action="/Event-Registration-System/CreateEventServlet" method="POST">
                <section class="product-detail section-padding">
                    <div class="container">
                        <div class="row">
                            <%
                                if (request.getParameter("eventNameExist") != null && request.getParameter("eventNameExist").equals("true")) {
                            %>
                            <p style="color:red;font-size:26px;" class="text-center" > You already created event with same name! </p>
                            <%
                            } else if (request.getParameter("connError") != null && request.getParameter("connError").equals("true")) {
                            %>
                            <p style="color:red;font-size:26px;" class="text-center" > Something went wrong, please try again. </p>
                            <%
                            } else if (request.getParameter("successfull") != null && request.getParameter("successfull").equals("true")) {
                            %>
                            <p style="color:green;font-size:26px;" class="text-center" > Event successfully created! </p>
                            <%}%>
                            <div class="event-container">
                                <div class="upload-area" onclick="openFileExplorer()">
                                    <input type="file" name="image" id="fileInput" accept="image/*" style="display: none" onchange="loadImage()">
                                    <img id="uploadedImage">
                                    <p id="uploadText">Click to upload</p>
                                </div>
                            </div> 
                            <br>
                            <p>Event Name:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="text" name="eventName" id="eventName" class="form-control" maxlength="100" placeholder="Enter Event Name" required>
                                <label for="eventname">Event Name</label>
                            </div>


                            <p>Date / Time:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="datetime-local" name="eventDateTime" id="eventDateTime" class="form-control" placeholder="Enter Date/Time" required>
                                <label for="eventDateTime">Date / Time</label>
                            </div>

                            <p>Location:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="text" name="location" id="location" class="form-control" maxlength="100" placeholder="Enter Location" required>

                                <label for="location">Location</label>
                            </div>

                            <p>Short Description:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="text" name="shortDescription" class="form-control" maxlength="100" placeholder="Enter Short Description" required>

                                <label for="location">Short Description</label>
                            </div>

                            <p>Detailed Description:</p>
                            <div class="form-floating mb-4 p-0">
                                <textarea id="string" name="longDescription" class="form-control" maxlength="500" placeholder="Enter Detailed Description" required style="height: 160px"></textarea>

                                <label for="message">Tell us about your event</label>
                            </div>

                            <p>Max Participant:</p>
                            <div class="form-floating mb-4 p-0">
                                <input type="number" name="maxParticipant" id="location" min="1" class="form-control" maxlength="100" placeholder="Enter Max Participant" required>

                                <label for="location">Max Participant</label>
                            </div>

                            <div class="product-cart-thumb row">
                                <%
                                    String eventID = request.getParameter("eventID");
                                    if (eventID != null) {
                                        eventID = eventID;
                                        if (UserEventsDAO.isUser(user.getUserID(), eventID, "Hosting")) {%>
                                <input type="hidden" name="operation" value="Update">
                                <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                    <input type="hidden" name="eventID" value="<%out.println(eventID);%>">
                                    <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal" >UPDATE</button>
                                </div>
                                <%} else {%>
                                <p class="text-center" style="color:red;">You are not hosting this event.</p>
                                <%}
                                } else {%>
                                <input type="hidden" name="operation" value="Create">
                                <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                    <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal" >CREATE</button>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </section>
            </form>

            <script>
                // Limit date using current date
                var currentDate = new Date();
                var currentDateString = currentDate.toISOString().slice(0, 16);
                document.getElementById('eventDateTime').min = currentDateString;
            </script>

        </main>

        <%@include file="/Footer/footer.jsp" %>
        <script src="js/import_image.js"></script>
    </body>
</html>