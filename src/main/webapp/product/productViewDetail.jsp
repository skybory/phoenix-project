<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
String userName = null;
String userId = null;

if (udto != null) {
   userId = udto.getUserId();
   userName = udto.getUserName();
}
%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<!-- 상단바 -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
			             <img src="${pageContext.request.contextPath}/picture/lemon_logo5.png" alt="Logo" class="img-fluid" id="lemonLogo">
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
							href="${pageContext.request.contextPath}/board/About.bo">소개</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Category.bo">카테고리</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Product.bo">중고거래</a></li>

                  <%
                  if (udto == null) {
                  %>
                  <!--         로그인이 안되어있을때 나오는 값 -->
                  <li class="nav-item"><a class="nav-link"
                     href="${pageContext.request.contextPath}/board/Login.bo">로그인</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="${pageContext.request.contextPath}/board/Join.bo">회원가입</a></li>

                  <%
                  } else {
                  %>

                  <!--     로그인이 되어있을 때 나오는 값 -->
                  <li class="nav-item" id="userGreetingLi">    <a class="nav-link"  id="userGreeting">
        <%=userName%>님(<%=userId%>) 안녕하세요
    </a></li>
                        
                        
                        
                  <li class="nav-item"><a class="nav-link"
                     href="/board/MyPage.bo">마이페이지</a></li>
                  <li class="nav-item"><a class="nav-link" id="userGreeting" href="/user/UserLogoutAction.us">로그아웃</a></li>

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
				<img src=${pdto.productImage } class="card-img custom-card-img" alt="이미지 설명">
				<div class="card-body">
					<!-- 프로필, 닉네임, 거주지 -->
					<div class="d-flex align-items-center mb-3"
						style="margin-left: -190px;">
						<!-- Adjust the left margin -->
						<img src= ${pdto.productImage } class="rounded-circle" alt="프로필 사진"
							style="width: 50px; height: 50px;">
						<div class="ms-3" style="margin-left: -190px;">
							<p class="m-0">
								파는 사람 아이디 ${pdto.userId }<br> 상품 위치 ${pdto.productLocation }
							</p>
						</div>
					</div>
					<!-- 상품 정보 -->
					<div class="text-start" style="margin-left: -190px;">
						<!-- Adjust the left margin -->
						<h4 class="card-title-name">
							<strong>상품 번호 ${pdto.productIdx}</strong>
						</h4>
						<p class="card-text-time">상품 시간 ${pdto.productRegisterDate }</p>
						<p class="card-text-price">
							<strong>상품 가격 ${pdto.productPrice }원</strong>
						</p>
						<p class="card-text-explain">상품 상세 설명 ${pdto.productDescription }</p>
					</div>
					<!-- 관심 버튼, 채팅 버튼 -->
					<div class="d-flex justify-content-center mt-3">
<!-- 						<button class="btn btn-outline-primary mr-2" -->
<!-- 							onclick="toggleInterest()"> -->
<!-- 						</button> -->
						<a href="" class="btn btn-outline-primary">관심 ${pdto.productInterestCount }</a>
						<a href="/board/Chatting.bo" class="btn btn-outline-primary">채팅 ${pdto.productChatCount }</a>
						<!-- Adjust the left margin -->
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
											<p class="text-muted mb-0">관심 : <span id = "interest"></span></p>
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
	<!-- Core theme JS-->
	<script src="./js/scripts.js"></script>
	<script src="./js.js"></script>
	<script>
		//function redirectToProductDetail() {
			//window.location.href = 'product_detail.jsp';
// 		}

		//let interestCount = ${"ProductDTO.productInterestCount"}; // 초기 관심 수 설정 	--> productDTO 에서 관심수를 받아와야함. ${""}
	//	let isIncreased = false; // 관심 수가 증가했는지 여부를 나타내는 변수	--> 페이지에서 관리하는 변수라고 칩시다.
		// 이 변수가 false -> true : productDTO 의 interest count 를 update 시키는 작업(product.xml) (1 늘리기)
		// 이 변수가 true -> false : productDTO의 interest count 를 update 시킴 ( 1 줄이기)

// 		function toggleInterest() {
// 			if (!isIncreased) {
// 				interestCount++; // 관심 수 증가
// 				isIncreased = true;
// 			} else {
// 				if (interestCount > 0) {
// 					interestCount--; // 관심 수 감소
// 				}
// 				isIncreased = false;
// 			}
// 			document.getElementById('productInterestCount').innerText = interestCount; // 관심 수 표시 업데이트
// 		}
	</script>

</body>
</html>
