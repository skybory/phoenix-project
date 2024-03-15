<%@ page import="java.util.List" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>카테고리 페이지</title>
<style>
.category-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(100px, 1fr));
	gap: 20px;
	padding: 20px;
	max-width: 1200px;
	margin: 0 auto;
}

.category {
	text-align: center;
	margin: 10px;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	transition: transform 0.2s;
}

.category:hover {
	transform: translateY(-5px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.category img {
	width: 80px; /* 아이콘 크기 조절 */
	height: auto;
	margin-bottom: 8px;
}

.category p {
	margin-top: 5px;
	font-size: 1rem;
	color: #333;
}
</style>
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
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">레몬 마켓</a>
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
							href="${pageContext.request.contextPath}/board/Category.bo">카테고리(편집부탁)</a></li>
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
    <div class="container mt-5">
        <div class="category-container">
            <c:choose>
                <c:when test="${category != null and fn:length(category) > 0}">
                    <c:forEach var="category" items="${category}">
                        <div class="category">
                            <a href="${pageContext.request.contextPath}/pricing/pricing.jsp?categoryId=${category.categoryId}">
                                <img src="${pageContext.request.contextPath}/images/icons/${category.categoryId}.png" alt="${category.categoryName}">
                                <p>${category.categoryName}</p>
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="text-align: center">등록된 카테고리가 없습니다.</div>
                </c:otherwise>
            </c:choose>
        </div>
    
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
		<script src="js/scripts.js"></script>
</body>
</html>
