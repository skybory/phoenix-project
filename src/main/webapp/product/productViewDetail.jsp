<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">

<style>
.text-ellipsis {
    white-space: nowrap;       /* 너비를 초과하는 텍스트가 줄 바꿈되지 않도록 설정 */
    overflow: hidden;          /* 너비를 초과하는 텍스트를 숨김 */
    text-overflow: ellipsis;   /* 너비를 초과하는 텍스트가 "..."으로 생략되도록 설정 */
}
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
/* /* 추가된 이미지의 너비 조정 */
*
/
/* .custom-card-img { */
/* 	width: 80%; /* 이미지의 너비를 80%로 설정합니다. */
 
*
/
/* 	max-width: 500px; /* 이미지의 최대 너비를 500px로 설정합니다. */
 
*
/
/* 	display: block; */
/* 	margin-left: auto; */
/* 	margin-right: auto; */
/* } */

/* .card-text-explain { */
/* 	word-wrap: break-word; */
/* } */

/* .card-body.custom-card-body { */
/* 	border-top: 0; /* 카드 본문의 위쪽 테두리를 없앱니다. */
 
*
/
/* } */

/* .card-img2 { */
/* 	width: 100%; /* 부모 요소에 꽉 차게 */
 
*
/
/* 	height: 200px; /* 원하는 높이로 지정 */
 
*
/
/* 	object-fit: cover; /* 이미지를 자르기 */
 
*
/
/* } */

/* /* 모든 상품명의 크기를 동일하게 설정합니다. */
 
*
/
/* .card-title { */
/* 	font-size: 1.5rem; /* 원하는 크기로 설정하세요 */
 
*
/
/* 	font-weight: bold; /* 원하는 글꼴 두께로 설정하세요 */
 
*
/
/* 	margin-bottom: 0.5rem; /* 하단 여백을 조절하세요 */
 
*
/
/* } */

/* .card-text-price { */
/* 	font-size: 1.5rem; /* 원하는 크기로 설정하세요 */
 
*
/
/* } */
</style>
<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
String userName = null;
String userId = null;
String userImage = null;
int userAccount = 0;
int userIdx = 0;

if (udto != null) {
	userId = udto.getUserId();
	userName = udto.getUserName();
	userAccount = udto.getUserAccount();
	userImage = udto.getUserImage();
	userIdx = udto.getUserIdx();
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
<link href="../css/styles.css" rel="stylesheet" />




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

		<!-- 추가된 이미지 -->
		<div class="row justify-content-center align-items-center mt-4">
			<div class="card text-center align-items-center">
				<img src=${pdto.productImage } class="card-img custom-card-img"
					alt="이미지 설명" style="width: 250px; height: 250px;">
				<div class="card-body">
					<!-- 프로필, 닉네임, 거주지 -->
					<div class="d-flex align-items-center mb-3"
						style="margin-left: -190px;">
						<img src=${sellUserDto.userImage } class="rounded-circle"
							alt="프로필 사진" style="width: 50px; height: 50px;">
						<div class="ms-3" style="margin-left: -190px;">
							<p class="m-0">
								판매자 : ${pdto.userId}<br> 거래 장소 : ${pdto.productLocation }
							</p>
						</div>
					</div>
					<!-- 상품 정보 -->
					<input type="hidden" name="productIdx" id="productIdx"
						value="${pdto.productIdx}">
					<div class="text-start" style="margin-left: -190px;">
						<!-- Adjust the left margin -->
						<h4 class="card-title-name">
							<strong>${pdto.productTitle}</strong>
						</h4>
						<p class="card-text-time">${cdto.categoryName }</p>
						<p class="card-text-time">${pdto.productRegisterDate }</p>
						<p class="card-text-price">
							<strong>${pdto.productPrice }원</strong>
						</p>
						<p class="card-text-explain">${pdto.productDescription}</p>
					</div>
					<!-- 관심 버튼, 채팅 버튼 -->
					<div class="d-flex justify-content-center mt-3">
						<button class="btn btn-outline-primary mr-2" onclick="test()">
							<span id="productInterestCount">관심 </span><span id="interest"></span>
						</button>
						<a href="/chatting/chatting.chat?productIdx=${pdto.productIdx}"
							class="btn btn-outline-primary">채팅 <span id="room"></span></a>
						<!-- Adjust the left margin -->
						<button class="btn btn-outline-primary" id="purchaseBtn">
							<span id="default">구매하기 </span>
						</button>
						<script>
						    // userId와 pdto.userId를 비교하여 조건에 따라 버튼을 비활성화
						    if ('<%=userId%>' == "${pdto.userId}") {
						    	
						    	document.getElementById("default").innerText = "";
						    	document.getElementById("default").innerText = "등록한 상품";
						    	
						        // 버튼 요소 가져오기
						        document.getElementById('purchaseBtn').disabled = true;
						        
						        }
						     
						</script>
					</div>
				</div>
			</div>
		</div>


		<section class="py-2" style="background-color: #FFF8D5;">
			<div class="container px-5 my-5" >
				<div class="row gx-5 justify-content-center">
					<c:choose>
						<c:when test="${not empty productList}">
							<c:forEach var="product" items="${productList}">
								<!-- Pricing card -->
								<div class="col-lg-6 col-xl-4 mb-4">
									<div class="card mb-5 mb-xl-0">
										<div class="card-body p-5">
											<a
												href="/product/ViewDetailAction.pr?productIdx=${product.productIdx}"
												class="card-link"> <!-- 상품 이미지 --> <img
												src="${product.productImage}" alt="Product Image"
												alt="Product Image" class="card-img mb-3"
												style="width: 250px; height: 250px;"> <!-- 상품명 -->
												<h4 class="card-title">
													<c:choose>
														<c:when test="${fn:length(product.productTitle) <= 10}">
                                                    ${product.productTitle}
                                                </c:when>
														<c:otherwise>
                                                    ${fn:substring(product.productTitle, 0, 10)}...
                                                </c:otherwise>
													</c:choose>
												</h4>
												<div class="mb-3">
													<!-- 상품가격 -->
													<span class="fw-bold" style="font-size: 2rem;">${product.productPrice}</span>
												</div> <!-- 지역 -->
												<p class="text-muted mb-4 text-ellipsis">${product.productLocation}</p>
												<div
													class="d-flex justify-content-between align-items-center">
													<p class="text-muted mb-0">관심:
														${product.productInterestCount}</p>
													<p class="text-muted mb-0">채팅:
														${product.productChatCount}</p>
												</div>
											</a>
										</div>
									</div>
								</div>

							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="col-12 text-center">
								<p>등록된 상품이 없습니다.</p>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<!-- Pagination -->
			<c:if test="${totalPage > 1}">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center mt-4">
						<li class="page-item ${nowPage == 1 ? 'disabled' : ''}"><a
							class="page-link"
							href="?page=${nowPage - 1}&productIdx=${productIdx}"
							tabindex="-1">Previous</a></li>
						<c:forEach begin="${startPage}" end="${endPage}" step="1"
							varStatus="loop">
							<li class="page-item ${nowPage == loop.index ? 'active' : ''}">
								<a class="page-link"
								href="?page=${loop.index}&productIdx=${productIdx}">${loop.index}</a>
							</li>
						</c:forEach>
						<li class="page-item ${nowPage == totalPage ? 'disabled' : ''}">
							<a class="page-link"
							href="?page=${nowPage + 1}&productIdx=${productIdx}">Next</a>
						</li>
					</ul>
				</nav>
			</c:if>
		</section>
	</main>

	<footer class="bg-light text-dark py-4"
		style="background-color: #DFDFDF;">
		<div class="container">
			<div class="row justify-content-center">
				<!-- 회사명 -->
				<div class="col-md-4 text-center">
					<h5>회사명</h5>
					<p class="text-left">(주)레몬마켓</p>
				</div>
				<!-- 링크 -->
				<div class="col-md-4 text-center">
					<h5>제공되는 서비스</h5>
					<ul class="list-unstyled text-left">
						<li><a
							href="${pageContext.request.contextPath}/board/About.bo">소개</a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/Category.bo">카테고리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/board/Product.bo">중고거래</a></li>
						<li><a href="${pageContext.request.contextPath}/board/Map.bo">위치찾기</a></li>
						<li><a href="/product/chatting.jsp">채팅</a></li>
					</ul>
				</div>
				<!-- 소셜 미디어 -->
				<div class="col-md-4 text-center">
					<h5>SNS</h5>
					<ul class="list-unstyled text-left">
						<li><a href="https://www.facebook.com">Facebook</a></li>
						<li><a href="https://twitter.com">Twitter</a></li>
						<li><a href="https://www.instagram.com">Instagram</a></li>
						<li><a href="https://www.youtube.com">Youtube</a></li>
					</ul>
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
	<!-- Core theme JS-->
	<script src="./product/product.js"></script>
	<script src="./js.js"></script>
	<script>
	
	window.onload = function(){
		view();
		
	}

	function view(){
		
		$.ajax({
			type : 'POST',
			url : '/product/getItem.pr',
			data : {
				"prIdx" : ${pdto.productIdx},
			},
			success : function(result) {

				let ajaxresult = JSON.parse(JSON.stringify(result));
				// 				             $("#max").val(ajaxresult.max);
				document.getElementById("interest").innerHTML = ajaxresult.interCnt;
				document.getElementById("room").innerHTML = ajaxresult.roomCnt;

			},
			error : function(result) {
				console.log(result);
			}
		}

		);
	}
	
	function test(){
			var userId = <%=userIdx%> ;
			var prIdx = ${pdto.productIdx} ;
			//idx로 바꿔라
			interest(userId, prIdx)
		}
	
	function interest(userIdx, prIdx) {

		$.ajax({
			type : 'POST',
			url : '/product/DecreaseInterest.pr',
			data : {
				"prIdx" : prIdx,
				"userIdx" : userIdx
			},
			success : function(result) {

				let ajaxresult = JSON.parse(JSON.stringify(result));
				// 				             $("#max").val(ajaxresult.max);
				document.getElementById("interest").innerHTML = ajaxresult.result;

			},
			error : function(result) {
				console.log(result);
			}
		}

		);
	}


	</script>


</body>
<script src="../js/productViewDetail.js"></script>
<script src="../js/all.js"></script>
</html>
