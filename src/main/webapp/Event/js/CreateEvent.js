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

//for description's
function validateForm() {
    var shortDescription = document.getElementById('shortDescription').value;
    var description = document.getElementById('description').value;

    // Short Description boş bırakılabilir, Description boş bırakılamaz
    if (description.trim() === '') {
        alert('Description cannot be empty.');
        return false;
    }

    return true;
}

// CreateEvent.js

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

// CreateEvent.js

document.addEventListener("DOMContentLoaded", function() {
    // Şu anki tarihi al
    var currentDate = new Date();
    var currentDateString = currentDate.toISOString().slice(0, 16); // YYYY-MM-DDTHH:mm formatına dönüştür

    // Tarih/Zaman input'unun min özelliğine şu anki tarihi ata
    document.getElementById('eventDateTime').min = currentDateString;

    // Resim yükleme alanının durumunu kontrol et
    checkImageUpload();

    // Katılanları Listeden Çıkarma
    function removeParticipant(button) {
        var listItem = button.parentNode;
        listItem.parentNode.removeChild(listItem);
    }

    // Resim yükleme alanının durumunu kontrol etme fonksiyonu
    function checkImageUpload() {
        var fileInput = document.getElementById('fileInput');
        var createButton = document.getElementById('createButton');

        fileInput.addEventListener('change', function() {
            // Eğer dosya seçildiyse, Create butonunu aktif et
            createButton.disabled = !fileInput.files.length > 0;
        });
    }
});

// Formu doğrula ve resim yükleme kontrolü
function validateForm() {
    var shortDescription = document.getElementById('shortDescription').value;
    var description = document.getElementById('description').value;
    var fileInput = document.getElementById('fileInput');

    // Short Description boş bırakılabilir, Description boş bırakılamaz
    if (description.trim() === '') {
        return false;
    }

    // Resim yükleme alanı boşsa formu gönderme
    if (fileInput.files.length === 0) {
        return false;
    }

    return true;
}

