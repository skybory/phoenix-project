<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@page import="com.lemonmarket.web.dto.ProductDTO"%>
<%@ page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<style>
a {
    text-decoration: none !important;
}
.lemon-bg {
	background-color: #E5D85C;
}

.navbar {
	background-color: #343a40; /* 배경색 설정 */
}

.navbar-brand {
	font-size: 1.5rem; /* 로고 텍스트 크기 설정 */
}

.navbar-toggler-icon {
	color: white; /* 햄버거 아이콘 색상 설정 */
}

.navbar-nav .nav-link {
	color: white; /* 네비게이션 링크 텍스트 색상 설정 */
}

/* 로그인/회원가입 링크 스타일 */
.navbar-nav .nav-item:not(:last-child) .nav-link {
	margin-right: 15px; /* 네비게이션 링크 간격 설정 */
}

/* 사용자 인사 메시지 스타일 */
#userGreeting {
	font-weight: bold; /* 굵게 설정 */
	color: #FF5733; /* 글자 색상 설정 */
}

#userGreetingLi {
	margin-left: 20px; /* 왼쪽 여백 설정 */
}

#lemonLogo {
	width: 50px; /* 원하는 너비로 조정 */
	height: auto; /* 높이를 자동으로 조정하여 비율 유지 */
}
.lemon-bg {
   background-color: #E5D85C;
}

.navbar {
   background-color: #343a40; /* 배경색 설정 */
}

.navbar-brand {
   font-size: 1.5rem; /* 로고 텍스트 크기 설정 */
}

.navbar-toggler-icon {
   color: white; /* 햄버거 아이콘 색상 설정 */
}

.navbar-nav .nav-link {
   color: white; /* 네비게이션 링크 텍스트 색상 설정 */
}

/* 로그인/회원가입 링크 스타일 */
.navbar-nav .nav-item:not(:last-child) .nav-link {
   margin-right: 15px; /* 네비게이션 링크 간격 설정 */
}

/* 사용자 인사 메시지 스타일 */
#userGreeting {
   font-weight: bold; /* 굵게 설정 */
   color: #FF5733; /* 글자 색상 설정 */
}

#userGreetingLi {
   margin-left: 20px; /* 왼쪽 여백 설정 */
}

#lemonLogo {
   width: 50px; /* 원하는 너비로 조정 */
   height: auto; /* 높이를 자동으로 조정하여 비율 유지 */
}

.category-container {
   display: grid;
   grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
   /* 카테고리 카드의 최소 너비를 조정해줍니다. */
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
   background-color: #fff; /* 배경색 추가 */
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}

.category:hover {
   transform: translateY(-5px);
   box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.category img {
   width: 100%; /* 이미지가 div에 꽉 차게 */
   height: auto; /* 이미지의 비율을 유지하면서 높이를 자동 조정 */
   max-width: 80px; /* 최대 이미지 너비를 제한합니다. */
   margin-bottom: 8px;
   display: block; /* 이미지를 블록 요소로 만들어 줄 바꿈을 추가 */
   margin-left: auto; /* 가운데 정렬 */
   margin-right: auto; /* 가운데 정렬 */
}

.category p {
   margin-top: 5px;
   font-size: 0.9rem; /* 폰트 크기 조정 */
   color: #333;
}
</style>
<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
String userName = null;
String userId = null;
int userAccount = 0;

if (udto != null) {
	userId = udto.getUserId();
	userName = udto.getUserName();
	userAccount = udto.getUserAccount();
}
%>
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
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- 상단바 -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<img
					src="${pageContext.request.contextPath}/picture/lemon_logo5.png"
					alt="Logo" class="img-fluid" id="lemonLogo"> <a
					class="navbar-brand"
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
							href="${pageContext.request.contextPath}/board/About.bo">소개</a></li>
						<%
						if (udto == null) {
						%>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.bo"
							onclick="showAlert()">카테고리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.bo"
							onclick="showAlert()">중고거래</a></li>

						<!--         로그인이 안되어있을때 나오는 값 -->
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.bo">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Join.bo"">회원가입</a></li>

						<%
						} else {
						%>

						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Category.bo">카테고리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Product.bo">중고거래</a></li>
						<!--     로그인이 되어있을 때 나오는 값 -->
						<li class="nav-item"><a class="nav-link" href="/board/Map.bo">내
								동네 바꾸기</a></li>
						<!-- 		이거쓸꺼면 마이페이지 바로뒤에 붙여야함 -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="userGreeting" href=""
							role="button" data-bs-toggle="dropdown" aria-expanded="false"><%=userName%>님(<%=userId%>)
								안녕하세요</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="/board/MyPage.bo">마이페이지</a></li>
								<li><a class="dropdown-item" href="blog-post.jsp">잔액 :
										<%=userAccount%>원
								</a></li>
							</ul></li>
						<li class="nav-item dropdown">
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
							</ul>
						</li>


						<li class="nav-item"><a class="nav-link" id="userGreeting"
							href="/user/UserLogoutAction.us">로그아웃</a></li>

						<%
						}
						%>
					</ul>
				</div>
			</div>
		</nav>
<div class="container mt-5">
	<div class="category-container">
<c:choose>
    <c:when test="${not empty categoryList}">
        <c:forEach var="category" items="${categoryList}">
            <!-- 카테고리가 있는 경우 -->
            <div class="category">
                <a href="/category/CategoryDisplayAction.cat?categoryIdx=${category.categoryIdx}">
                    <img src="${category.categoryImage}" alt="${category.categoryName}">
                    <p>${category.categoryName}</p>
                </a>
            </div>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <!-- 카테고리가 없는 경우 -->
        <p>No categories available</p>
    </c:otherwise>
</c:choose>
</div>
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
