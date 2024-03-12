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
/* 추가된 이미지의 너비 조정 */
.custom-card-img {
    width: 80%; /* 이미지의 너비를 80%로 설정합니다. */
    max-width: 500px; /* 이미지의 최대 너비를 500px로 설정합니다. */
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.card-text-explain {
    word-wrap: break-word;
}

</style>

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
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Home.bo">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/About.bo">About페이지(편집부탁)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Contact.bo">Contact페이지(편집부탁)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Map.bo">위치(태연작업중)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Pricing.bo">중고거래</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Faq.bo">FAQ페이지(편집부탁)</a></li>
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

		<!-- 추가된 이미지 -->
		<div class="row justify-content-center align-items-center mt-4">
			<div class="card text-center align-items-center">
				<img src="tomcat-cover.png" class="card-img custom-card-img"
					alt="이미지 설명">
				<div class="card-body">
					<!-- 프로필, 닉네임, 거주지 -->
					<div class="d-flex align-items-center mb-3"
						style="margin-left: -190px;">
						<!-- Adjust the left margin -->
						<img src="img.png" class="rounded-circle" alt="프로필 사진"
							style="width: 50px; height: 50px;">
						<div class="ms-3" style="margin-left: -190px;">
							<p class="m-0" >홍길동</p>
							<p class="m-0" >서울시 동작구</p>
						</div>
						
					</div>
					<!-- 상품 정보 -->
					<div class="text-start" style="margin-left: -190px;">
						<!-- Adjust the left margin -->
						<h4 class="card-title-name">
							<strong>마우스</strong>
						</h4>
						<p class="card-text-time">3시간 전</p>
						<p class="card-text-price">
							<strong>300,000원</strong>
						</p>
						<p class="card-text-explain">상세설명</p>
					</div>
					<!-- 관심 버튼, 채팅 버튼 -->
					<div class="d-flex justify-content-center mt-3">
						<button type="button" class="btn btn-primary">관심 8</button>
						<button type="button" class="btn btn-success ms-2">채팅 5</button>
						<!-- Adjust the left margin -->
					</div>
				</div>
			</div>
		</div>