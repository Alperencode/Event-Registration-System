<%@page import="event_registration_system.UserEventsDAO"%>
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

        <title>Events</title>
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

            <%
                String eventType = request.getParameter("eventType");
                eventType = eventType == null ? "Hosting" : eventType;
                if (eventType != null) {
                    List<Event> events = UserEventsDAO.getUserEvents(user.getUserID(), eventType);
            %>
            <header class="site-header section-padding d-flex justify-content-center align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-10 col-12">
                            <h1>
                                <span class="d-block text-primary">Here is your</span>
                                <span class="d-block text-dark"><%out.println(eventType);%> Events!</span>
                            </h1>
                        </div>
                    </div>
                </div>
            </header>
            <a href="MyEvents.jsp?eventType=Hosting" class="btn custom-btn" style="margin-left:250px;margin-top:50px;">Hosting Events</a>
            <a href="MyEvents.jsp?eventType=Joined" class="btn custom-btn" style="margin-left:250px;margin-top:50px;">Joined Events</a>
            <a href="MyEvents.jsp?eventType=Saved" class="btn custom-btn" style="margin-left:250px;margin-top:50px;">Saved Events</a>
            <section class="products section-padding">
                <div class="container">
                    <div class="row">

                        <div class="col-12">
                            <h2 class="mb-5"> <% out.println(eventType); %> Events</h2>
                        </div>

                        <%
                                if (events.size() == 0) {%>
                        <br>
                        <p class="text-center" style="color:gray;font-size: 36px;font-weight: bold">You have no <%out.println(eventType);%> Events...</p>
                        <%} else {
                                for (int i = 0; i < events.size(); i++) {%>
                        <div class="col-lg-4 col-12 mb-3">
                            <div class="product-thumb">
                                <a href="${pageContext.request.contextPath}/Event/EventPage.jsp?eventID=<%out.println(events.get(i).getEventID()); %>">
                                    <img src="${pageContext.request.contextPath}/images/product/evan-mcdougall-qnh1odlqOmk-unsplash.jpeg" class="img-fluid product-image" alt="">
                                </a>

                                <div class="product-top d-flex"></div>

                                <div class="product-info d-flex">
                                    <div>
                                        <h5 class="product-title mb-0">
                                            <a href="${pageContext.request.contextPath}/Event/EventPage.jsp?eventID=<%out.println(events.get(i).getEventID()); %>" class="product-title-link"><% out.println(events.get(i).getEventName()); %></a>
                                        </h5>

                                        <p class="product-p"><% out.println(events.get(i).getShortDescription()); %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}
                                }%>
                    </div>
                </div>
            </section>
            <%}%>

        </main>
        <%@include file="/Footer/footer.jsp" %>
    </body>
</html>
