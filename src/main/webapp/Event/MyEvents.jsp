<!DOCTYPE HTML5>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ERS</title>
        <link rel="stylesheet" href="MyEvents/searchButton.css">
        <link rel="stylesheet" href="MyEvents/itemCards.css">
        <link rel="stylesheet" href="MyEvents/pages.css">
        <link rel="stylesheet" href="searchButton.css">
        <script src="searchButton.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!-- Font Awesome kütüphanesi -->
    </head>
    <body>
        <%@include  file="../Header/header.jsp" %>
        <div class="button-container">
            <button class="button">Hosting</button>
            <button class="button">Joined</button>
            <button class="button">Saved</button>
            <div class="search-main">
                <input type="text" class="tbox-search" onfocus="setPlaceholder()">
                <a class="btn-search">
                    <i class="fa fa-search"></i> <!-- Font Awesome arama simgesi -->
                </a>
            </div>
        </div>

        <div class="container-wrapper">
            <div class="container" id="boxesContainer">
                <!-- Kutular burada JavaScript ile eklenir -->
            </div>
        </div>

        <div class="pagination" id="pagination"></div>

        <script src="MyEvents/searchButton.js"></script>
        <script src="MyEvents/pages.js"></script>
    </body>
</html>
