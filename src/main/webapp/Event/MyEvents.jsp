<!DOCTYPE HTML5>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ERS</title>
        <link rel="stylesheet" href="css/cards.css">
        <script src="js/searchButton.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <%@include  file="../Header/header.jsp" %>

        <!-- Hosting/Joined/Saved buttons -->
        <div class="button-container">
            <a href="MyEvents.jsp?eventType=Hosting&pages=1" style="text-decoration:none; color: inherit;">
                <button class="button">
                    Hosting
                </button>
            </a>
            <a href="MyEvents.jsp?eventType=Joined&pages=1" style="text-decoration:none; color: inherit;">
                <button class="button">
                    Joined
                </button>
            </a>
            <a href="MyEvents.jsp?eventType=Saved&pages=1" style="text-decoration:none; color: inherit;">
                <button class="button">
                    Saved
                </button>
            </a>

            <div class="search-main">
                <input type="text" class="tbox-search" onfocus="setPlaceholder()">
                <a class="btn-search">
                    <i class="fa fa-search"></i>
                </a>
            </div>
        </div>

        <div class="card-container">
            <div class="card">
                <img src="${pageContext.request.contextPath}/Images/image.jpg"> 
                <div>
                    <div id="eventName" style="cursor: pointer; color: #333; text-decoration: underline;" onclick="goToEventPage()">
                        <h2>Event Name</h2>
                    </div>
                    <h3>Host:</h3>
                    <h3>Date:</h3>
                    <h3>Time:</h3>
                    <h3>Location:</h3>
                    <h3>Short description:</h3>
                </div>
            </div>
        </div>
        <br><br><br>
        <div class="card-container">
            <div class="card">
                <img src="${pageContext.request.contextPath}/Images/image.jpg"> 
                <div>
                    <div id="eventName" style="cursor: pointer; color: #333; text-decoration: underline;" onclick="goToEventPage()">
                        <h2>Event Name</h2>
                    </div>
                    <h3>Description</h3>
                </div>
            </div>
        </div>

        <%@include  file="../Pages/pages.jsp" %>

        <script src="js/searchButton.js"></script>
    </body>
</html>
