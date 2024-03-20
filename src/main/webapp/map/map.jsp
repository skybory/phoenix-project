<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<style>
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
		<!-- Page content-->
		<section class="py-5">
<!-- 			<div class="row gx-5 justify-content-center"> -->
<!-- 				<div class="col-lg-8 col-xl-6"> -->
<!-- 					주소 입력 폼 -->
<!-- 					<form id="addressForm" action="/user/UserupdateAddressAction.us" -->
<!-- 						method="post"> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="postcode">우편번호</label> <input type="text" -->
<!-- 								id="postcode" readonly> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="address">주소</label> <input type="text" id="address" -->
<!-- 								readonly> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="extraAddress">참고항목</label> <input type="text" -->
<!-- 								id="extraAddress" readonly> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="detailAddress">상세주소</label> <input type="text" -->
<!-- 								id="detailAddress"> -->
<!-- 						</div> -->
<!-- 						<input type="hidden" name="userAddress" id="userAddress"> -->
<!-- 						<button type="button" onclick="searchAddress()">주소 찾기</button> -->
<!-- 						<button class="btn btn-primary btn-lg btn-block" type="submit" -->
<!-- 							onclick="sendit();" id="submitButton">변경 완료</button> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<div class="row gx-5 justify-content-center">
    <div class="col-lg-8 col-xl-6">
        <form id="addressForm" action="/user/UserupdateAddressAction.us" method="post">
            <div class="form-group">
                <label for="postcode">우편번호</label>
                <input type="text" id="postcode" readonly>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address">
            </div>
            <div class="form-group">
                <label for="extraAddress">참고항목</label>
                <input type="text" id="extraAddress">
            </div>
            <div class="form-group">
                <label for="detailAddress">상세주소</label>
                <input type="text" id="detailAddress">
            </div>
            <input type="hidden" name="userAddress" id="userAddress">
            <button type="button" onclick="searchAddress()">주소 찾기</button>
            <button class="btn btn-primary btn-lg btn-block" type="submit" onclick="sendit();" id="submitButton">변경 완료</button>
        </form>
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
					<p class="text-muted mb-0">Browse FAQ's and support articles to
						find solutions.</p>
				</div>
				<div class="col">
					<div
						class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
						<i class="bi bi-telephone"></i>
					</div>
					<div class="h5">Call us</div>
					<p class="text-muted mb-0">Call us during normal business hours
						at (555) 892-9403.</p>
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
