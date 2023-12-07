var descriptions = [
    "Event 1",
    "Event 2",
    "Event 3",
    "Event 4",
    "Event 5",
    "Event 6",
    "Event 7",
    "Event 8",
    "Event 9",
    "Event 10",
];

var itemsPerPage = 3;
var currentPage = 1;

var pagination = document.getElementById('pagination');

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

setupPagination(descriptions);
