<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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


<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
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

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

#container {
	width: 701px;
	margin: 50px auto;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 50px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.button {
	display: block;
	width: calc(100% - 40px); /* 버튼의 width에서 좌우 패딩값만큼 제외 */
	padding: 40px 40px;
	margin-bottom: 30px;
	margin-left: 0px; /* 왼쪽 마진 추가 */
	margin-right: 500px; /* 오른쪽 마진 추가 */
	background-color: #FFD700;
	color: #fff;
	text-align: center;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	border-radius : 40px
}

.button:hover {
	background-color: #FFA500;
}
li a {
	color : black;
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
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
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
							href="${pageContext.request.contextPath}/board/Logincheck.bo"
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
						<li class="nav-item" id="userGreetingLi"><a class="nav-link"
							id="userGreeting" href="/board/MyPage.bo"> <%=userName%>님(<%=userId%>)
								안녕하세요
						</a></li>
						<li class="nav-item"><a class="nav-link" id="userGreeting"
							href="/user/UserLogoutAction.us" onclick="showLog()">로그아웃</a></li>

						<%
						}
						%>
					</ul>
				</div>
			</div>
		</nav>
		<div id="container">
			<h2 style="text-align: center; color: orange; margin-bottom : 40px">마이 페이지</h2>


			<!-- 구매내역 링크 -->
			<a class="button"
				href="${pageContext.request.contextPath}/my/PurchaseDetails.my" style = "color : black">구매내역</a>
			<!-- 판매내역 링크 -->
			<a class="button"
				href="${pageContext.request.contextPath}/my/SalesDetails.my" style = "color : black">판매내역</a>
			<!-- 찜 목록 링크 -->
			<a class="button"
				href="${pageContext.request.contextPath}/my/InterestList.my" style = "color : black">찜
				목록</a>
			<!-- 내 정보 링크 -->
			<a class="button"
				href="${pageContext.request.contextPath}/my/ProfileView.my" style = "color : black">내 정보</a>
			<div style="text-align: center; margin-top: 50px;">
				<a class = "button" href="${pageContext.request.contextPath}../index.jsp" style = "color : black; margin-bottom : 30px">
					홈으로 돌아가기 </a>
			</div>
		</div>
	</main>
</body>


</body>
</html>