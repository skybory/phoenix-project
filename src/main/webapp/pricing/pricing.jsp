<%@page import="com.lemonmarket.web.dto.UserDTO"%>
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
<style>
/* 이미지 크기 및 자르기 */
.card-img {
	width: 100%; /* 부모 요소에 꽉 차게 */
	height: 200px; /* 원하는 높이로 지정 */
	object-fit: cover; /* 이미지를 자르기 */
}
</style>
<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
String userName = null;
String userId = null;

if (udto != null) {
 userId = udto.getUserId();
 userName = udto.getUserName();
}
%>


<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand"
					href="${pageContext.request.contextPath}/index.jsp">레몬 마켓</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/About.bo">About페이지(편집부탁)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Categorie.bo">카테고리(편집부탁)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Pricing.bo">중고거래</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/LoginTest.bo">로그인테스트</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.bo">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Join.bo">회원가입</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/MyPage.bo">마이페이지</a></li>
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
							aria-expanded="false"> 
							<% if(udto == null) { %> 로그인 해주세요 <% } else { %>
								<%= userName %>님(<%= userId %>) 안녕하세요 <% } %>
						</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
								<li><a class="dropdown-item" href="portfolio-overview.jsp">마이페이지(연결필요)</a></li>
								<li><a class="dropdown-item" href="portfolio-item.jsp">로그아웃(구현필요)</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- Pricing section-->
		<section class="bg-light py-5">
			<div class="container px-5 my-5">
				<div class="text-center mb-5">
					<h1 class="fw-bolder">믿을만한 이웃 간 중고거래</h1>
					<p class="lead fw-normal text-muted mb-0">동네 주민들과 가깝고 따뜻한 거래를
						지금 경험해보세요.</p>
				</div>
				<div class="row gx-5 justify-content-center">
					<!-- Banner -->
					<section class="banner-section bg-primary py-3 mb-5">
						<div class="container px-4">
							<div class="row justify-content-center align-items-center">
								<div class="col-lg-8 text-center">

									<span id="setLocation"></span>

									<p class="banner-text text-white-50">위치를 설정하시겠어요?</p>
									<!-- 추가된 버튼 -->
									<a class="btn btn-outline-light btn-lg" href="/board/Map.bo">위치
										등록하기</a>
								</div>
							</div>
						</div>
					</section>

					<section>
						<div class="row gx-5 justify-content-center">
							<%
							for (int i = 0; i < 12; i++) {
							%>
							<!-- Pricing card -->
							<div class="col-lg-6 col-xl-4 mb-4">
								<div class="card mb-5 mb-xl-0">
									<div class="card-body p-5" onclick="redirectToProductDetail()">
										<!-- 상품 이미지 -->
										<img src="img.png" alt="Product Image" class="card-img mb-3">
										<!-- 상품명 -->
										<h4 class="card-title">상품명</h4>
										<div class="mb-3">
											<!-- 상품가격 -->
											<span class="fw-bold" style="font-size: 2rem;">300,000원</span>
										</div>
										<!-- 지역 -->
										<p class="text-muted mb-4">지역: 서울시 동작구</p>
										<!-- mb-4로 간격 늘림 -->
										<!-- 찜하기, 채팅 개수 -->
										<div class="d-flex justify-content-between align-items-center">
											<p class="text-muted mb-0">관심 8</p>
											<p class="text-muted mb-0">채팅 5</p>
										</div>
									</div>
								</div>
							</div>
							<%
							}
							%>
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
	<script src="js/scripts.js"></script>

	<script>
		function redirectToProductDetail() {
			window.location.href = 'product_detail.jsp';
		}

		function addInterest() {
			var interestCountElement = document.getElementById("interestCount");
			var currentCount = parseInt(interestCountElement.innerText);
			var newCount = currentCount + 1;
			interestCountElement.innerText = newCount;
		}
	</script>
</body>
</html>
