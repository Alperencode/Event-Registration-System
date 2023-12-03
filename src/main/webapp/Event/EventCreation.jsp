<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event creation</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin-top: 60px;
                padding: 0;
            }

            header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: right;
                position: fixed;
                top: 0;
                width: 99%;
                z-index: 1000;
            }

            #logo {
                float: left;
                margin-right: 20px;
            }

            #search {
                float: left;
                margin-left: 50px;
            }

            #myEvents {
                float: right;
                margin-right: 125px;
                margin-top: -18px;
            }
            #Events {
                float: left;
                margin-bottom: 10px;

                #username {
                    float: right;
                    margin-right: 20px;
                }

                main {
                    padding: 20px;
                    display: flex;
                    justify-content: space-between;
                }

                #searchBox {
                    padding: 5px;
                }
                #uploadArea {
                    width: 30%;
                }

                #eventDetails {
                    width: 65%;
                }

                #searchBox {
                    padding: 5px;
                }

                #uploadButton {
                    padding: 10px;
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }

                #editButton,
                #deleteButton {
                    padding: 10px;
                    background-color: #008CBA;
                    color: white;
                    border: none;
                    border-radius: 5px;
                    cursor: pointer;
                }
                #explanationText {
                    width: 100%; /* Genişliği tamamen dolduracak şekilde ayarlanır */
                    height: 100px; /* İstediğiniz yüksekliği ayarlayabilirsiniz */
                    resize: vertical; /* Sadece dikey yönde yeniden boyutlandırma */
                }
                #explanationText {
                    width: 100%;
                    height: 100px;
                    resize: vertical;
                }

                #participantsList {
                    margin-top: 20px;
                }

                #participantContainer {
                    max-height: 200px;
                    overflow-y: auto;
                    border: 1px solid #ddd;
                    padding: 10px;
                }

                #participants {
                    list-style-type: none;
                    padding: 0;
                }

                #participants li {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    margin-bottom: 10px;
                }

                #participants button {
                    background-color: #f44336;
                    color: white;
                    border: none;
                    padding: 5px 10px;
                    cursor: pointer;
                }
                footer {
                    background-color: #333;
                    color: white;
                    text-align: center;
                    padding: 10px;
                }

                .footer-left, .footer-right {
                    display: inline-block;
                }

            </style>
        </head>
        <body>
            <header>
                <div id="logo">ESR</div>
                <div id="Events">Events</div>
                <div id="search">
                    <input type="text" name="search" id="searchBox" placeholder="Search">
                </div>
                <div id="username">Username</div>
                <div id="myEvents">My Events</div>
            </header>
            <main>
                <form action="/Event-Registration-System/CreateEventServlet" method="POST">
                    <div id="uploadArea">
                        <input type="file" name="image" accept="image/*"><br><br>
                    </div>
                    <div id="eventDetails">
                        <label for="eventName">Event Name:</label>
                        <input type="text" name="eventName" id="eventName"> <br><br>

                        <label for="eventDateTime">Date/Time:</label>
                        <input type="datetime-local" name="eventDateTime" id="eventDateTime"><br><br>

                        <label for="attendees">Max participant:</label>
                        <input type="number" name="maxParticipant" id="attendees"><br><br>

                        <label for="shortDescription">Short Description:</label>
                        <input type="text" name="shortDescription" id="eventName"> <br><br>

                        <div id="explanation">
                            <label for="description">Description :</label>
                            <textarea id="explanationText" name="description" placeholder="(max 250 character)" maxlength="250"></textarea><br><br>
                        </div>
                    </div>

                    <label for="editButton"></label>
                    <input type="submit" value="Save"><br><br>

                    <label for="deleteButton"></label>
                    <button id="deleteButton">Delete</button><br><br>
                </form>

                <div id="participantsList">
                    <h3>Participants List</h3>
                    <div id="participantContainer">
                        <ul id="participants">
                            <%
                                for (int i = 0; i < 10; i++) {
                            %>                                
                            <li>
                                <span>User <% out.println(i + 1); %></span>
                                <button onclick="removeParticipant(this)">Remove</button>
                            </li>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <footer>
                    <div class="footer-left">
                        <p>&copy; 2023</p>
                    </div>
                    <div class="footer-right">
                        <p>Made by ERS</p>
                    </div>
                </footer>
            </main>
            <script>
                // Şu anki tarihi al
                var currentDate = new Date();
                var currentDateString = currentDate.toISOString().slice(0, 16); // YYYY-MM-DDTHH:mm formatına dönüştür

                // Tarih/Zaman input'unun min özelliğine şu anki tarihi ata
                document.getElementById('eventDateTime').min = currentDateString;

                // Katılanları Listeden Çıkarma
                function removeParticipant(button) {
                    var listItem = button.parentNode;
                    listItem.parentNode.removeChild(listItem);
                }
            </script>

        </body>
    </html>