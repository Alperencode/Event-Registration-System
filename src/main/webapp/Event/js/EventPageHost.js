// Şu anki tarihi al
                var currentDate = new Date();
                var currentDateString = currentDate.toISOString().slice(0, 16); // YYYY-MM-DDTHH:mm formatına dönüştür

                // Tarih/Zaman input'unun min özelliğine şu anki tarihi ata
                document.getElementById('eventDateTime').min = currentDateString;
var participants = [];
        var removedUsers = [];

        function removeParticipant(button) {
            var listItem = button.closest('li');
            var participantName = listItem.querySelector('span').textContent;

            // Kullanıcıyı participants listesinden kaldır
            participants = participants.filter(name => name !== participantName);

            // Kullanıcıyı removedUsers dizisine ekle (tekrar ekleme kontrolü)
            if (!removedUsers.includes(participantName)) {
                removedUsers.push(participantName);
            }

            // Removed Users List'i güncelle
            updateRemovedUsersList();

            // Participants List'i güncelle
            updateParticipantsList();

            // Restore butonlarını güncelle
            updateRestoreButtons();
        }

        function restoreParticipant() {
            // Diziden en son kaldırılan kullanıcıyı al
            var lastRemoved = removedUsers.pop();

            if (lastRemoved) {
                // Participants List'e geri ekle
                participants.push(lastRemoved);

                // Participants List'i güncelle
                updateParticipantsList();

                // Removed Users List'i güncelle
                updateRemovedUsersList();

                // Restore butonlarını güncelle
                updateRestoreButtons();
            }
        }

        function updateParticipantsList() {
            var participantsList = document.getElementById('participants');
            participantsList.innerHTML = '';

            participants.forEach(name => {
                var listItem = document.createElement('li');
                listItem.innerHTML = '<span>' + name + '</span>' +
                                     '<button onclick="removeParticipant(this)">Remove</button>';
                participantsList.appendChild(listItem);
            });
        }

        function updateRemovedUsersList() {
            var removedUsersList = document.getElementById('removedUsers');
            removedUsersList.innerHTML = '';

            removedUsers.forEach(name => {
                var listItem = document.createElement('li');
                listItem.innerHTML = '<span>' + name + '</span>' +
                                     '<button onclick="restoreUser(\'' + name + '\')">Restore</button>';
                removedUsersList.appendChild(listItem);
            });
        }

        function updateRestoreButtons() {
            var restoreParticipantButton = document.getElementById('restoreParticipant');
            var restoreUserButton = document.getElementById('restoreUser');

            restoreParticipantButton.disabled = removedUsers.length === 0;
            restoreUserButton.disabled = removedUsers.length === 0;
        }

        function restoreUser(name) {
            // Kullanıcıyı removedUsers dizisinden kaldır
            removedUsers = removedUsers.filter(userName => userName !== name);

            // Kullanıcıyı participants listesine ekle
            participants.push(name);

            // Participants List'i güncelle
            updateParticipantsList();

            // Removed Users List'i güncelle
            updateRemovedUsersList();

            // Restore butonlarını güncelle
            updateRestoreButtons();
        }

        // Sayfa yüklendiğinde participants listesini oluştur
        for (var i = 1; i <= 10; i++) {
            participants.push('User ' + i);
        }

        // Participants List'i güncelle
        updateParticipantsList();

        // Removed Users List'i güncelle
        updateRemovedUsersList();

        // Restore butonlarını güncelle
        updateRestoreButtons();
        
