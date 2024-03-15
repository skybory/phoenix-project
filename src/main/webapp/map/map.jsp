<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
/* Style for the address form */
#addressForm {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: #f5f5f5;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* Style for the form fields */
.form-group {
	margin-bottom: 15px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 3px;
}

/* Style for the button */
button {
	background-color: #4caf50;
	color: #fff;
	padding: 10px 15px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}
</style>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content />
<meta name="author" content />
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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">레몬 마켓</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/About.bo">About페이지(편집부탁)</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Categorie.bo">카테고리(편집부탁)</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Pricing.bo">중고거래</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/LoginTest.bo">로그인테스트</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Login.bo">로그인</a></li>                            
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/Join.bo">회원가입</a></li>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/MyPage.bo">마이페이지</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
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
		</nav>
		<!-- Page content-->
		<section class="py-5">
			<div class="container px-5">
				<!-- Contact form-->
				<div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
					<div class="text-center mb-5">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-envelope"></i>
						</div>
						<h1 class="fw-bolder">내 위치 찾기</h1>
						<p class="lead fw-normal text-muted mb-0">주소를 입력해서 내 위치를
							등록해주세요!</p>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-6">
							<!--  여기에 주소 입력해서 내 위치를 등록하자  -->

							<div id="addressForm">


								<!-- 추가한 폼 필드들   -->
								<div class="form-group">
									<label for="postcode">우편번호</label> <input type="text"
										id="postcode" readonly>
								</div>
								<div class="form-group">
									<label for="address">주소</label> <input type="text"
										id="address" readonly>
								</div>
								<div class="form-group">
									<label for="extraAddress">참고항목</label> <input
										type="text" id="extraAddress" readonly>
								</div>
								<div class="form-group">
									<label for="detailAddress">상세주소</label> <input
										type="text" id="detailAddress">
								</div>
								<button onclick="searchAddress()">주소 찾기</button>
								<button onclick="${pageContext.request.contextPath}/board/Pricing.bo">주소 저장하기</button>
								
							</div>
 

						</div>
					</div>
				</div>
				<!-- Contact cards-->
				<div class="row gx-5 row-cols-2 row-cols-lg-4 py-5">
					<div class="col">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-chat-dots"></i>
						</div>
						<div class="h5 mb-2">Chat with us</div>
						<p class="text-muted mb-0">Chat live with one of our support
							specialists.</p>
					</div>
					<div class="col">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-people"></i>
						</div>
						<div class="h5">Ask the community</div>
						<p class="text-muted mb-0">Explore our community forums and
							communicate with other users.</p>
					</div>
					<div class="col">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-question-circle"></i>
						</div>
						<div class="h5">Support center</div>
						<p class="text-muted mb-0">Browse FAQ's and support articles
							to find solutions.</p>
					</div>
					<div class="col">
						<div
							class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
							<i class="bi bi-telephone"></i>
						</div>
						<div class="h5">Call us</div>
						<p class="text-muted mb-0">Call us during normal business
							hours at (555) 892-9403.</p>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; Your
						Website 2023</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<!-- 		<script src="/js/scripts.js"></script> -->
	<script src="../js/map.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3d258ce936625da0436a6065893ce2d&libraries=services"></script>
</body>
</html>
