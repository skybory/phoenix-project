<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>

<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/About.bo">About페이지(편집부탁)</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Contact.bo">Contact페이지(편집부탁)</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Map.bo">위치</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Pricing.bo">중고거래</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Login.bo">로그인(동준작업중)</a></li>                            
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Join.bo">회원가입(동준작업중)</a></li>
							<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="blog-home.jsp">Blog
										Home</a></li>
								<li><a class="dropdown-item" href="blog-post.jsp">Blog
										Post</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownPortfolio"
							href="#" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">Portfolio</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
								<li><a class="dropdown-item" href="portfolio-overview.jsp">Portfolio
										Overview</a></li>
								<li><a class="dropdown-item" href="portfolio-item.jsp">Portfolio
										Item</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>>
		<!-- Product Registration Form -->
		<section class="py-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<h2 class="fw-bolder">상품 등록</h2>
						<form action="process_registration.jsp" method="POST"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label for="title" class="form-label">제목</label> <input
									type="text" class="form-control" id="title" name="title"
									required>
							</div>
							<div class="mb-3">
								<label for="description" class="form-label">자세한 설명</label>
								<textarea class="form-control" id="description"
									name="description" rows="3" required></textarea>
							</div>
							<div class="mb-3">
								<input type="file" id="image" accept="image/*"
									onchange="previewImages(event);" multiple />
								<div id="image_container"></div>
							</div>
							<div id="image-preview" class="row mt-3"></div>
							<div class="mb-3">
								<label for="dealType" class="form-label">거래방식</label> <select
									class="form-select" id="dealType" name="dealType" required>
									<option value="sell">판매하기</option>
									<option value="share">나눔하기</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="price" class="form-label">가격</label> <input
									type="text" class="form-control" id="price" name="price"
									required>
							</div>

							<div class="mb-3">
								<label for="location" class="form-label">거래 희망 장소</label> <input
									type="text" class="form-control" id="location" name="location">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary">작성 완료</button>
								<a href="#" class="btn btn-secondary">취소</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- Footer-->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Footer Content</p>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	<script>
	function previewImages(event) {
	    document.querySelector("#image_container").innerHTML = "";

	    for (var image of event.target.files) {
	        var reader = new FileReader();

	        reader.onload = function(event) {
	            var img = new Image();
	            img.src = event.target.result;
	            img.onload = function() {
	                var canvas = document.createElement('canvas');
	                var ctx = canvas.getContext('2d');
	                var MAX_SIZE = 200;
	                var width = img.width;
	                var height = img.height;

	                if (width > height) {
	                    if (width > MAX_SIZE) {
	                        height *= MAX_SIZE / width;
	                        width = MAX_SIZE;
	                    }
	                } else {
	                    if (height > MAX_SIZE) {
	                        width *= MAX_SIZE / height;
	                        height = MAX_SIZE;
	                    }
	                }
	                
	                canvas.width = width;
	                canvas.height = height;
	                ctx.drawImage(img, 0, 0, width, height);

	                var newImgContainer = document.createElement("div");
	                var newImg = document.createElement("img");
	                newImg.src = canvas.toDataURL();

	                var deleteButton = document.createElement("button");
	                deleteButton.textContent = "x";
	                deleteButton.onclick = function() {
	                    var container = this.parentElement;
	                    container.remove();
	                    var imageURL = this.previousElementSibling.src;
	                    URL.revokeObjectURL(imageURL);
	                };

	                newImgContainer.appendChild(newImg);
	                newImgContainer.appendChild(deleteButton);

	                document.querySelector("#image_container").appendChild(newImgContainer);
	            }
	        };

	        reader.readAsDataURL(image);
	    }
	}
</script>

</body>
</html>
