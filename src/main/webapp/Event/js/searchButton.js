function setPlaceholder() {
    document.querySelector('.tbox-search').setAttribute('placeholder', 'Search');
}

document.getElementById('searchInput').addEventListener('keyup', function(event) {
    if (event.key === 'Enter') {
        search();
    }
});

function search() {
    var searchInputValue = document.getElementById('searchInput').value;
    alert("Arama: " + searchInputValue);
    // Burada gerçek arama işlemlerini yapabilirsiniz.
}
