<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ERS</title>
        <link rel="stylesheet" href="../Header/header.css">
        <link rel="stylesheet" href="searchButton.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"> <!-- Font Awesome kütüphanesi -->
    </head>
    <body>
        <header>
            <div class="header-container">
                <a href = "">ERS</a>
                <a href= "">Events</a> 
                <div class="search-main">
                    <input type="text" class="tbox-search" onfocus="setPlaceholder()">
                    <a class="btn-search">
                        <i class="fa fa-search"></i> <!-- Font Awesome arama simgesi -->
                    </a>
                </div>
                <div class="dropdown">
                    <a class="dropdown-btn" id="myEventsBtn">MyEvents</a>
                    <div class="dropdown-content" id="myEventsDropdown">
                        <a href="#">Hosting Events</a>
                        <a href="#">Joined Events</a>
                        <a href="#">Saved Events</a>
                        <a href="#">Create Events</a>
                    </div>
                </div>
                <div class="dropdown">
                    <a class="dropdown-btn" id="myEventsBtn">UserName</a>
                    <div class="dropdown-content" id="myEventsDropdown">
                        <a href="#">Account Update</a>
                        <a href="#">Exit</a>
                    </div>
                </div>
            </div>
        </header>
        <script src="../Header/header.js"></script>
        <script src="../Header/searchButton.js"></script>
    </body>
</html>