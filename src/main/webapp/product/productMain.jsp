<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

#userGreetingLi {
	margin-left: 20px; /* 왼쪽 여백 설정 */
}

.test {
	--bs-primary-rgb: 248, 249, 250;
	--bs-light-rgb: #FFF8D5;
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
<body class="d-flex flex-column h-100" style="background: #FFF8D5;">
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
							href="${pageContext.request.contextPath}/board/Join.bo">회원가입</a></li>

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
						<!--       이거쓸꺼면 마이페이지 바로뒤에 붙여야함 -->
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
		<!-- Pricing section-->
		<section class="bg-light py-1 test">
			<!-- py-1로 수정하여 위 아래의 패딩 값을 줄임 -->
			<div class="container px-5 my-5" style="background: #FFF8D5;">
				<div class="text-center mb-5">
					<h1 class="fw-bolder">믿을만한 이웃 간 중고거래</h1>
					<p class="lead fw-normal text-muted mb-0">동네 주민들과 가깝고 따뜻한 거래를
						지금 경험해보세요.</p>
				</div>
				<div class="row gx-5 justify-content-center">
					<!-- Banner -->
					<section class="banner-section bg-primary py-3 mb-4">
						<div class="container px-4">
							<div class="row justify-content-center align-items-center">
								<div class="col-lg-8 text-center">
									<span id="setLocation"></span>
									<p class="banner-text text-black-0">물건을 등록하시겠습니까?</p>
									<!-- 수정된 버튼 -->
									<a class="btn btn-outline-light btn-lg"
										href="/product/ProductWriteBoard.pr"
										style="background-color: #F0CF1F; border-color: #F0CF1F; color: #000000;">물건
										등록하기</a>
								</div>
							</div>
						</div>
					</section>
				</div>
			</div>
		</section>


		<section class="bg-light py-2 test" style="background: #FFF8D5;">
			<div class="container px-5 my-5" style="background: #FFF8D5;">
				<div class="row gx-5 justify-content-center"
					style="background: #FFF8D5;">
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
      </section>


		<!-- Pagination -->
		<c:if test="${totalPage > 1}">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center mt-4">
					<li class="page-item ${nowPage == 1 ? 'disabled' : ''}"><a
						class="page-link" href="?page=${nowPage - 1}" tabindex="-1">Previous</a>
					</li>
					<c:forEach begin="${startPage}" end="${endPage}" step="1"
						varStatus="loop">
						<li class="page-item ${nowPage == loop.index ? 'active' : ''}">
							<a class="page-link" href="?page=${loop.index}">${loop.index}</a>
						</li>
					</c:forEach>
					<li class="page-item ${nowPage == totalPage ? 'disabled' : ''}">
						<a class="page-link" href="?page=${nowPage + 1}">Next</a>
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
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../user.js"></script>
	<script src="../js/map.js"></script>
	<script src="../js/product.js"></script>

</body>
</html>