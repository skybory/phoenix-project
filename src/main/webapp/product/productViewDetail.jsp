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

.card-body.custom-card-body {
	border-top: 0; /* 카드 본문의 위쪽 테두리를 없앱니다. */
}

.card-img2 {
	width: 100%; /* 부모 요소에 꽉 차게 */
	height: 200px; /* 원하는 높이로 지정 */
	object-fit: cover; /* 이미지를 자르기 */
}

/* 모든 상품명의 크기를 동일하게 설정합니다. */
.card-title {
	font-size: 1.5rem; /* 원하는 크기로 설정하세요 */
	font-weight: bold; /* 원하는 글꼴 두께로 설정하세요 */
	margin-bottom: 0.5rem; /* 하단 여백을 조절하세요 */
}

.card-text-price {
	font-size: 1.5rem; /* 원하는 크기로 설정하세요 */
}
</style>
<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
String userName = null;
String userId = null;
String userImage = null;
int userAccount = 0;

if (udto != null) {
	userId = udto.getUserId();
	userName = udto.getUserName();
	userAccount = udto.getUserAccount();
	userImage = udto.getUserImage();
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

		<!-- 추가된 이미지 -->
		<div class="row justify-content-center align-items-center mt-4">
			<div class="card text-center align-items-center">
				<img src=${pdto.productImage } class="card-img custom-card-img"
					alt="이미지 설명">
				<div class="card-body">
					<!-- 프로필, 닉네임, 거주지 -->
					<div class="d-flex align-items-center mb-3"
						style="margin-left: -190px;">
						<!-- Adjust the left margin -->
						<img src=${sellUserDto.userImage } class="rounded-circle" alt="프로필 사진"
							style="width: 50px; height: 50px;">
						<div class="ms-3" style="margin-left: -190px;">
							<p class="m-0">
								판매자 : ${pdto.userId}<br> 거래 장소 : ${pdto.productLocation }
							</p>
						</div>
					</div>
					<!-- 상품 정보 -->
					<input type="hidden" name="productIdx" id="productIdx" value="${pdto.productIdx}">
					<div class="text-start" style="margin-left: -190px;">
						<!-- Adjust the left margin -->
						<h4 class="card-title-name">
							<strong>${pdto.productTitle}</strong>
						</h4>
						<p class="card-text-time">상품 시간 ${pdto.productRegisterDate }</p>
						<p class="card-text-price">
							<strong>${pdto.productPrice }원</strong>
						</p>
						<p class="card-text-explain">${pdto.productDescription}</p>
					</div>
					<!-- 관심 버튼, 채팅 버튼 -->
					<div class="d-flex justify-content-center mt-3">
						<!-- 						<button class="btn btn-outline-primary mr-2" -->
						<!-- 							onclick="toggleInterest()"> -->
						<!-- 						</button> -->
						<a href="" class="btn btn-outline-primary">관심
							${pdto.productInterestCount }</a> <a href="/board/Chatting.bo"
							class="btn btn-outline-primary">채팅 ${pdto.productChatCount }</a>
						<!-- 						<a  class="btn btn-outline-primary" id ="purchaseBtn">구매하기</a> -->
						<button type="button" class="btn btn-outline-primary"
							id="purchaseBtn">구매하기</button>
					</div>
				</div>
			</div>
		</div>


		<!--인기 중고 거래 목록!-->
		<section class="bg-light py-5">
			<div class="container px-5 my-5">
				<div class="text-center mb-5">
					<h1 class="fw-bolder">인기 중고 거래</h1>
				</div>
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
									<p class="text-muted mb-0">
										관심 : <span id="interest"></span>
									</p>
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

	<div class="modal fade" id="purchaseModal" tabindex="-1" role="dialog"
		aria-labelledby="purchaseModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="purchaseModalLabel">구매 확인</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>상품을 구매하시겠습니까?</p>
					<%-- 결제 금액을 출력합니다. --%>
					<p>
						결제 금액 : <span id="productPrice">${pdto.productPrice}원</span>
					</p>
					<%-- 잔액을 계산하여 출력합니다. --%>
					<p>
						잔액 : <span id="remainingBalance"></span> 원
					</p>
				</div>
				<%-- JavaScript로 잔액을 계산하고 출력합니다. --%>
				<script>
					// pdto 값을 JavaScript 변수로 가져옵니다.
					var productPrice = document.getElementById("productPrice").innerText;
					// 결제 금액에서 숫자만 추출합니다.
					productPrice = parseInt(productPrice.replace(/[^0-9]/g, ''));
					// 잔액을 계산합니다.
					var remainingBalance =
				<%=userAccount%>
					- productPrice;
					// 잔액을 출력합니다.
					document.getElementById("remainingBalance").innerText = remainingBalance;
				</script>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">아니오</button>
					<button type="button" class="btn btn-primary"
						id="confirmPurchaseBtn">구매</button>
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!-- Bootstrap 5 CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<!-- Bootstrap 5 JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 이하 생략 -->
	<script src="../js/product.js"></script>

</body>
</html>
