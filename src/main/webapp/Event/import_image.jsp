<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/import_image.css">
        <title>import image</title>
    </head>
    <body>
        <div class="event-container">
            <div class="upload-area" onclick="openFileExplorer()">
                <input type="file" name="image" id="fileInput" accept="image/*" style="display: none" onchange="loadImage()">
                <img id="uploadedImage">
                <p id="uploadText">Click to upload</p>
            </div>
        </div>    
        <script src="js/import_image.js"></script>
    </body>
</html>