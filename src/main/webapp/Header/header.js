document.addEventListener("DOMContentLoaded", function () {
    var myEventsBtn = document.getElementById("myEventsBtn");
    var myEventsDropdown = document.getElementById("myEventsDropdown");

    myEventsBtn.addEventListener("click", function () {
        myEventsDropdown.classList.toggle("show");
    });

    // Close the dropdown if the user clicks outside of it
    window.addEventListener("click", function (event) {
        if (!event.target.matches("#myEventsBtn")) {
            if (myEventsDropdown.classList.contains("show")) {
                myEventsDropdown.classList.remove("show");
            }
        }
    });
});