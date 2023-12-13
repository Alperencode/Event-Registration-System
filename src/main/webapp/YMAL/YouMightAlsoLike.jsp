<%@page import="java.util.List"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.EventDAO"%>
<%@page import="event_registration_system.Event"%>
<%@page import="event_registration_system.Event"%>
<%@page import="event_registration_system.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <section class="featured-product section-padding">
            <div class="container">
                <div class="row">

                    <div class="col-12 text-center">
                        <h2 class="mb-5">You Might Also Like</h2>
                    </div>
                    <%
                        int size;
                        List<Event> events = EventDAO.getAllEventsRandomly();
                        if (events.size() >= 3) {
                            size = 3;
                        } else {
                            size = events.size();
                        }
                        for (int i = 0; i < size; i++) {
                    %>
                    <div class="col-lg-4 col-12 mb-3">
                        <div class="product-thumb">
                            <a href="${pageContext.request.contextPath}/Event/EventPage.jsp?eventID=<%out.println(events.get(i).getEventID()); %>">
                                <img src="/Event-Registration-System/ImageServlet?eventID=<%= events.get(i).getEventID() %>" class="img-fluid product-image" alt="">
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
                    <%}%>
                    <div class="col-12 text-center">
                        <a href="${pageContext.request.contextPath}/Event/Events.jsp" class="view-all">View All Events</a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
