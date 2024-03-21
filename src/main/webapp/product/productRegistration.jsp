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

.btn-lg { /* 두 버튼에 동일한 클래스를 부여하고 크기를 지정합니다. */
	padding: .5rem 1rem; /* 패딩 설정 */
	font-size: 1.25rem; /* 글자 크기 설정 */
	border-radius: .3rem; /* 버튼 모서리 둥글기 설정 */
	line-height: 1.5; /* 줄 높이 설정 */
}

.btn-block { /* 버튼을 블록 레벨 요소로 만들어 전체 너비를 차지하게 합니다. */
	display: block; /* 블록 레벨 요소로 표시 */
	width: 25%; /* 너비를 100%로 설정 */
}

.register-item-btn {
	border-color: #F0CF1F; /* 테두리 색도 배경색과 동일하게 설정 */
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
					alt="Logo" class="img-fluid" id="lemonLogo" style="width: 40px">
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
								<li><a class="dropdown-item" href="/board/MyPage.bo">잔액 :
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
		<section class="py-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<form name="joinForm" action="/product/ProductRegisterAction.pr"
							method="POST" enctype="multipart/form-data">
							<div class="mb-3">
								<label for="title" class="form-label">제목</label> <input
									type="text" class="form-control" id="productTitle"
									name="productTitle" required>
							</div>
							<!-- 카테고리 추가 -->
							<div class="mb-3">
								<label for="categoryIdx" class="form-label">카테고리</label> <select
									class="form-select" id="categoryIdx" name="categoryIdx"
									required>
									<option value="">카테고리를 선택하세요</option>
									<c:forEach var="category" items="${categoryList}">
										<option value="${category.categoryIdx}">${category.categoryName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="mb-3">
								<label for="description" class="form-label">자세한 설명</label>
								<textarea class="form-control" id="productDescription"
									name="productDescription" rows="3" required></textarea>
							</div>
							<!-- 이미지 업로드 추가 -->
							<div class="mb-3">
								<label for="productImage" class="form-label">이미지 업로드</label> <input
									type="file" id="productImage" name="productImage"
									accept="image/*" onchange="previewImages(event);" multiple />
								<div id="image_container"></div>
							</div>
							<!-- 이미지 미리보기 영역 -->
							<div id="image-preview" class="row mt-3"></div>
							<div class="mb-3">
								<label for="dealType" class="form-label">거래방식</label> <select
									class="form-select" id="productDealType" name="productDealType"
									required>
									<option value="sell">판매하기</option>
									<option value="share">나눔하기</option>
								</select>
							</div>
							<div class="mb-3">
								<label for="price" class="form-label">가격</label> <input
									type="text" class="form-control" id="productPrice"
									name="productPrice" required>
							</div>
							<div class="mb-3">
								<label for="location" class="form-label">거래 희망 장소</label> <input
									type="text" class="form-control" id="productLocation"
									name="productLocation">
							</div>
							<div class="text-center"></div>
							<button class="btn btn-primary btn-lg btn-block" type="submit"
								onclick="sendit();"
								style="background-color: #F0CF1F; border-color: #F0CF1F; color: #000000;">물품
								등록하기</button>
							<a href="javascript:history.back()"
								class="btn btn-secondary btn-lg btn-block">취소</a>
			 
						</form>
					</div>
				</div>
			</div>
		</section>
	</main>
	 
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="../js/map.js"></script>
	<script src="../js/all.js"></script>
	<script src="../js/product.js"></script>
</body>
</html>
