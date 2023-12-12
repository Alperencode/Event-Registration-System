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
                                <span class="d-block text-primary">Choose your</span>
                                <span class="d-block text-dark">favorite events</span>
                            </h1>
                        </div>
                    </div>
                </div>
            </header>

            <section class="products section-padding">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-12">
                            <h2 class="mb-5">All Events</h2>
                        </div>

                        <%
                            List<Event> events = EventDAO.getAllEvents();
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
                        <%}%>
                    </div>
                </div>
            </section>

        </main>
        <%@include file="/Footer/footer.jsp" %>
    </body>
</html>
