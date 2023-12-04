var descriptions = [
    "Açıklama 1",
    "Açıklama 2",
    "Açıklama 3",
    "Açıklama 4",
    "Açıklama 5",
    "Açıklama 6",
    "Açıklama 7",
    "Açıklama 8",
    "Açıklama 9",
    "Açıklama 10",
    // Ek örnek veri ekleyebilirsiniz.
];

var itemsPerPage = 3;
var currentPage = 1;

var container = document.getElementById('boxesContainer');
var pagination = document.getElementById('pagination');

function displayList(items, page) {
    container.innerHTML = "";
    page--;

    var start = itemsPerPage * page;
    var end = start + itemsPerPage;
    var paginatedItems = items.slice(start, end);

    paginatedItems.forEach((description, index) => {
        var box = document.createElement('div');
        box.className = 'box';
        box.onclick = redirectToAnotherPage;

        box.innerHTML = `
            <div class="image-container">
                <div class="frame">
                    <!-- Resim buraya gelecek -->
                </div>
            </div>
            <div class="description-container">
                <div class="link-container">
                    <a href="#" class="link-text"></a>
                </div>
                <p>${description}</p>
            </div>
        `;

        container.appendChild(box);
    });
}

function setupPagination(items) {
    pagination.innerHTML = "";
    var pageCount = Math.ceil(items.length / itemsPerPage);

    for (var i = 1; i <= pageCount; i++) {
        var link = document.createElement('a');
        link.textContent = i;
        link.href = "#";

        if (i === currentPage) {
            link.classList.add('active');
        }

        link.addEventListener('click', function () {
            currentPage = parseInt(this.textContent);
            displayList(items, currentPage);
            setupPagination(items);
        });

        pagination.appendChild(link);
    }
}

function redirectToAnotherPage() {
    window.location.href = "https://www.example.com";
}

displayList(descriptions, currentPage);
setupPagination(descriptions);
