<%@page import="event_registration_system.UserEventsDAO"%>
<%@page import="event_registration_system.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.Event"%>
<%@page import="event_registration_system.Event"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Event Page</title>
    </head>
    <%@include file="/Header/header.jsp" %>

    <body>

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
                                <span class="d-block text-dark">Detailed Checkout</span>
                                <span class="d-block text-primary">to Events</span>

                            </h1>
                        </div>
                    </div>
                </div>
            </header>

            <%
                String eventID = request.getParameter("eventID");
                if (request.getParameter("eventID") != null) {
                    Event event = EventDAO.getEvent(eventID);
                    if (event != null) {
            %>
            <section class="product-detail section-padding">
                <div class="container">
                    <div class="row">
                        <%
                            if (request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
                        <p class="text-center" style="color:green;font-size:26px;">You've successfully <%out.println(request.getParameter("eventType"));%> the event!</p>
                        <%}
                            if (request.getParameter("Leaved") != null && request.getParameter("Leaved").equals("true")) { %>
                        <p class="text-center" style="color:green;font-size:26px;">You've successfully leaved the event!</p>
                        <%}
                            if (request.getParameter("Un-Saved") != null && request.getParameter("Un-Saved").equals("true")) { %>
                        <p class="text-center" style="color:green;font-size:26px;">You've Un-Saved the event!</p>
                        <%}
                            if (request.getParameter("connError") != null && request.getParameter("connError").equals("true")) { %>
                        <p class="text-center" style="color:red;font-size:26px;">Something went, please try again</p>
                        <%}
                            if (request.getParameter("maxParticipant") != null && request.getParameter("maxParticipant").equals("true")) { %>
                        <p class="text-center" style="color:red;font-size:26px;">Can't join the event because it's full, try again later.</p>
                        <%}%>
                        <div class="col-lg-6 col-12">
                            <div class="product-thumb">
                                <img src="${pageContext.request.contextPath}/images/product/evan-mcdougall-qnh1odlqOmk-unsplash.jpeg" class="img-fluid product-image" alt="">
                            </div>
                        </div>

                        <div class="col-lg-6 col-12">
                            <div class="product-info d-flex">
                                <div>
                                    <h2 class="product-title mb-0"><% out.println(event.getEventName()); %></h2>
                                </div>
                            </div>

                            <div class="product-description">

                                <strong class="d-block mt-4 mb-2">Host:</strong>

                                <p class="lead mb-5"><% out.println(UserDAO.getUser(event.getOrganizerID()).getUsername()); %></p>
                            </div>

                            <div class="product-description">

                                <strong class="d-block mt-4 mb-2">Date:</strong>

                                <p class="lead mb-5"><% out.println(event.getEventDate()); %></p>
                            </div>

                            <div class="product-description">

                                <strong class="d-block mt-4 mb-2">Time:</strong>

                                <p class="lead mb-5"><% out.println(event.getEventTime()); %></p>
                            </div>

                            <div class="product-description">

                                <strong class="d-block mt-4 mb-2">Location:</strong>

                                <p class="lead mb-5"><% out.println(event.getEventLocation()); %></p>
                            </div>

                            <div class="product-description">

                                <strong class="d-block mt-4 mb-2">Joined Participants:</strong>

                                <p class="lead mb-5"><% out.println(EventDAO.getParticipant(eventID)); %></p>
                            </div>


                            <div class="product-cart-thumb row">

                                <%
                                    if (user != null) {
                                        if (UserEventsDAO.isUser(user.getUserID(), eventID, "Hosting")) {%>
                                <form action="AdminEventAction.jsp" method="POST">
                                    <input type="hidden" name="eventID" value="<%out.println(eventID);%>">
                                    <input type="hidden" name="userID" value="<%out.println(user.getUserID());%>">
                                    <input type="hidden" name="operation" value="Update">
                                    <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                        <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Edit Event</button>
                                    </div>
                                    <br>
                                </form>
                                <form action="AdminEventAction.jsp" method="POST">
                                    <input type="hidden" name="eventID" value="<%out.println(eventID);%>">
                                    <input type="hidden" name="userID" value="<%out.println(user.getUserID());%>">
                                    <input type="hidden" name="operation" value="Delete">
                                    <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                        <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Delete Event</button>
                                    </div>
                                </form>
                                <%} else {%>
                                <%if (UserEventsDAO.isUser(user.getUserID(), eventID.trim(), "Joined")) {%>
                                <form action="EventAction.jsp" method="POST">
                                    <input type="hidden" name="eventID" value="<%out.println(event.getEventID());%>">
                                    <input type="hidden" name="userID" value="<%out.println(user.getUserID());%>">
                                    <input type="hidden" name="operation" value="Leave">
                                    <input type="hidden" name="eventType" value="Joined">
                                    <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                        <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Leave</button>
                                    </div>
                                    <br>
                                </form>
                                <%} else {%>
                                <form action="EventAction.jsp" method="POST">
                                    <input type="hidden" name="eventID" value="<%out.println(event.getEventID());%>">
                                    <input type="hidden" name="userID" value="<%out.println(user.getUserID());%>">
                                    <input type="hidden" name="eventType" value="Joined">
                                    <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                        <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal" <%if (EventDAO.getParticipant(event.getEventID()) >= event.getMaxParticipant()) {
                                                out.println("disabled");
                                            }%>>JOIN</button>
                                    </div>
                                    <br>
                                </form>
                                <%}%>
                                <br><br>
                                <%if (UserEventsDAO.isUser(user.getUserID(), eventID.trim(), "Saved")) {%>
                                <form action="EventAction.jsp" method="POST">
                                    <input type="hidden" name="eventID" value="<%out.println(event.getEventID());%>">
                                    <input type="hidden" name="userID" value="<%out.println(user.getUserID());%>">
                                    <input type="hidden" name="operation" value="UnSave">
                                    <input type="hidden" name="eventType" value="Saved">
                                    <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                        <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Un-Save</button>
                                    </div>
                                </form> 
                                <%} else {%>
                                <form action="EventAction.jsp" method="POST">
                                    <input type="hidden" name="eventID" value="<%out.println(event.getEventID());%>">
                                    <input type="hidden" name="userID" value="<%out.println(user.getUserID());%>">
                                    <input type="hidden" name="eventType" value="Saved">
                                    <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                        <button type="submit" class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Save</button>
                                    </div>
                                </form>    
                                <%}%>
                                <%}
                                } else {%>
                                <div class="col-lg-6 col-12 mt-4 mt-lg-0">
                                    <a href="../Login/login.jsp">
                                        <button  class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Join</button>
                                    </a>
                                    <br>
                                    <br>
                                    <a href="../Login/login.jsp">
                                        <button  class="btn custom-btn cart-btn" data-bs-toggle="modal" data-bs-target="#cart-modal">Save</button>
                                    </a>
                                </div>
                                <%}%>
                            </div>
                            <div class="product-description">

                                <strong class="d-block mt-4 mb-2">Description:</strong>

                                <p class="lead mb-5"><% out.println(event.getLongDescription()); %></p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <%} else {%>
            <%
                if (request.getParameter("eventDeleteSuccess") != null && request.getParameter("eventDeleteSuccess").equals("true")) { %>
            <br>
            <p class="text-center" style="color:green;font-size:26px;">Event successfully deleted!</p>
            <%} else {%>
            <br>
            <p class="text-center" style="color:red;font-size: 36px;font-weight: bold">Event Not Found</p>
            <%}
                }
            } else { %>
            <br>
            <p class="text-center" style="color:red;font-size: 36px;font-weight: bold">Event Not Found</p>
            <%}%>

            <%@include file="/YMAL/YouMightAlsoLike.jsp" %>
        </main>
        <%@include file="/Footer/footer.jsp" %>

    </body>
</html>