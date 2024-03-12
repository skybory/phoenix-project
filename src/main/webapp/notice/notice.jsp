<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이미지 업로드</title>
    <style>
        /* 간단한 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 700px;
            margin: auto;
        }
        .image-upload {
            background: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .image-preview {
            margin-top: 20px;
            position: relative;
        }
        .image-preview img {
            max-width: 100%;
            max-height: 300px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>이미지 업로드</h1>

        <!-- 이미지 업로드 폼 -->
        <form id="imageUploadForm" class="image-upload">
            <input type="file" id="imageInput" name="image" accept="image/*">
            <button type="button" onclick="uploadImage()">업로드</button>
        </form>

        <!-- 이미지 미리보기 -->
        <div id="imagePreview" class="image-preview"></div>
    </div>

    <script>
        function uploadImage() {
            var input = document.getElementById('imageInput');
            var imagePreview = document.getElementById('imagePreview');
            var file = input.files[0];
            var reader = new FileReader();

            reader.onload = function (e) {
                imagePreview.innerHTML = '<img src="' + e.target.result + '" alt="Image preview"/>';
            };

            reader.readAsDataURL(file);
        }
    </script>
</body>
</html>
