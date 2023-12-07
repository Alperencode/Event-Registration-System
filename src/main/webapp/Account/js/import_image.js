function openFileExplorer() {
    document.getElementById('fileInput').click();
}

function loadImage() {
    const input = document.getElementById('fileInput');
    const image = document.getElementById('uploadedImage');
    const uploadText = document.getElementById('uploadText');

    const file = input.files[0];

    if (file) {
        const reader = new FileReader();

        reader.onload = function (e) {
            image.src = e.target.result;
            image.style.display = 'block';
            uploadText.style.display = 'none';
        };

        reader.readAsDataURL(file);
    }
}
