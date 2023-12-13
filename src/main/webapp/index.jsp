<%@page import="java.util.List"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="">
        <meta name="author" content="">

        <title>Event Registration System</title>
    </head>

    <body>
        <%@include file="/Header/header.jsp" %>

        <section class="preloader">
            <div class="spinner">
                <span class="sk-inner-circle"></span>
            </div>
        </section>

        <main>
            <section class="slick-slideshow">   
                <div class="slick-custom">
                    <img src="images/slideshow/event2.jpg" class="img-fluid" alt="">

                    <div class="slick-bottom">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-10">
                                    <h1 class="slick-title">Events</h1>

                                    <p class="lead text-white mt-lg-3 mb-lg-5">You can participate in created events</p>

                                    <a href="Event/Events.jsp" class="btn custom-btn">See Events</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <% if (user != null) {%>
                <div class="slick-custom">
                    <img src="images/slideshow/event4.jpg" class="img-fluid" alt="">

                    <div class="slick-bottom">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-10">
                                    <h1 class="slick-title">Create Event</h1>

                                    <p class="lead text-white mt-lg-3 mb-lg-5">Creating an event is just a click away</p>

                                    <a href="Event/CreateEvent.jsp" class="btn custom-btn">Create Event</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="slick-custom">
                    <img src="images/slideshow/event3.jpg" class="img-fluid" alt="">

                    <div class="slick-bottom">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-10">
                                    <h1 class="slick-title">Update Your Account</h1>

                                    <p class="lead text-white mt-lg-3 mb-lg-5">Would you like to update your account?</p>

                                    <a href="Account/Account.jsp" class="btn custom-btn">Update Account</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%} else {%>
                <div class="slick-custom">
                    <img src="images/slideshow/event4.jpg" class="img-fluid" alt="">

                    <div class="slick-bottom">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-10">
                                    <h1 class="slick-title">Sign-up to ERS</h1>

                                    <p class="lead text-white mt-lg-3 mb-lg-5">Didn't you sign-up already?</p>

                                    <a href="Login/register.jsp" class="btn custom-btn">Sign-up</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="slick-custom">
                    <img src="images/slideshow/event3.jpg" class="img-fluid" alt="">

                    <div class="slick-bottom">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-6 col-10">
                                    <h1 class="slick-title">Sign-in to ERS</h1>

                                    <p class="lead text-white mt-lg-3 mb-lg-5">You already have an account? Sign-in here!</p>

                                    <a href="Login/login.jsp" class="btn custom-btn">Sign-in</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </section>
            <% if (user != null) {%>
            <section class="about section-padding">
                <div class="container">
                    <div class="row">

                        <div class="col-12 text-center">
                            <h2 class="mb-5">Check-out Upcoming <span> Events </span></h2>
                        </div>

                        <div class="col-lg-2 col-12 mt-auto mb-auto">
                            <ul class="nav nav-pills mb-5 mx-auto justify-content-center align-items-center" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Hosted Events</button>
                                </li>

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-youtube-tab" data-bs-toggle="pill" data-bs-target="#pills-youtube" type="button" role="tab" aria-controls="pills-youtube" aria-selected="true">Joined Events</button>
                                </li>

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-skill-tab" data-bs-toggle="pill" data-bs-target="#pills-skill" type="button" role="tab" aria-controls="pills-skill" aria-selected="false">Saved Events</button>
                                </li>

                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-skill-tab" data-bs-toggle="pill" data-bs-target="#pills-createEvent" type="button" role="tab" aria-controls="pills-skill" aria-selected="false">Create Event</button>
                                </li>
                            </ul>
                        </div>

                        <div class="col-lg-10 col-12">
                            <div class="tab-content mt-2" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">

                                    <div class="row">
                                        <div class="col-lg-7 col-12">
                                            <img src="images/hosted.jpg" class="img-fluid" alt="">
                                        </div>

                                        <div class="col-lg-5 col-12">
                                            <div class="d-flex flex-column h-100 ms-lg-4 mt-lg-0 mt-5">
                                                <h4 class="mb-3">Check <span>Events</span><br>you<span> Host</span></h4>

                                                <p>Hosted Events Panel is a powerful section of the Check Events platform and allows you to manage your events more effectively.</p>

                                                <div class="mt-2 mt-lg-auto">
                                                    <a href="${pageContext.request.contextPath}/Event/MyEvents.jsp?eventType=Hosting" class="custom-link mb-2">
                                                        Hosting Events
                                                        <i class="bi-arrow-right ms-2"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="pills-youtube" role="tabpanel" aria-labelledby="pills-youtube-tab">

                                    <div class="row">
                                        <div class="col-lg-7 col-12">
                                            <img src="images/join.webp" class="img-fluid" alt="">
                                        </div>

                                        <div class="col-lg-5 col-12">
                                            <div class="d-flex flex-column h-100 ms-lg-4 mt-lg-0 mt-5">
                                                <h4 class="mb-3"><span></span><br>All events you<span><br> Joined</span></h4>

                                                <p>Joined Events is your personal event space on this platform and allows you to easily keep track of the events you attend.</p>

                                                <p>You can see features such as viewing the events you have participated in, quick access to event details, participation status and statistics.</p>

                                                <div class="mt-2 mt-lg-auto">
                                                    <a href="${pageContext.request.contextPath}/Event/MyEvents.jsp?eventType=Joined" class="custom-link mb-2">
                                                        Joined Events
                                                        <i class="bi-arrow-right ms-2"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="pills-skill" role="tabpanel" aria-labelledby="pills-skill-tab">
                                    <div class="row">
                                        <div class="col-lg-7 col-12">
                                            <img src="images/event5.jpg" class="img-fluid" alt="">
                                        </div>

                                        <div class="col-lg-5 col-12">
                                            <div class="d-flex flex-column h-100 ms-lg-4 mt-lg-0 mt-5">
                                                <h4 class="mb-3"><span></span><br>All events you<span><br> Saved</span></h4>

                                                <p>The Saved Events page is an area specially designed for you. Thanks to this panel, you can easily manage and follow the events you have recorded or found interesting.</p>

                                                <div class="mt-2 mt-lg-auto">
                                                    <a href="${pageContext.request.contextPath}/Event/MyEvents.jsp?eventType=Saved" class="custom-link mb-2">
                                                        Saved Events
                                                        <i class="bi-arrow-right ms-2"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="tab-pane fade" id="pills-createEvent" role="tabpanel" aria-labelledby="pills-youtube-tab">

                                    <div class="row">
                                        <div class="col-lg-7 col-12">
                                            <img src="images/pim-chu-z6NZ76_UTDI-unsplash.jpeg" class="img-fluid" alt="">
                                        </div>

                                        <div class="col-lg-5 col-12">
                                            <div class="d-flex flex-column h-100 ms-lg-4 mt-lg-0 mt-5">
                                                <h4 class="mb-3"><span></span><br>Do you want to<span><span><br>Created</span> an event</h4>

                                                <p>The Create Event panel is a powerful tool that allows you to easily manage your events.</p>

                                                <p>It provides you with features such as custom event page creation, participant registration and management, and customizable event details.</p>

                                                <div class="mt-2 mt-lg-auto">
                                                    <a href="${pageContext.request.contextPath}/Event/CreateEvent.jsp" class="custom-link mb-2">
                                                        Create Event
                                                        <i class="bi-arrow-right ms-2"></i>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <%}%>
            <%@include file="/YMAL/YouMightAlsoLike.jsp" %>

        </main>
        <%@include file="/Footer/footer.jsp" %>
    </body>
</html>

