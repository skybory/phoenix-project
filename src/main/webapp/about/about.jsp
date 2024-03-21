<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.team-member {
  width: 120px; /* 모든 이미지에 적용될 너비 */
  height: 120px; /* 모든 이미지에 적용될 높이 */
  border-radius: 50%; /* 이미지를 원형으로 만듭니다 */
  object-fit: cover; /* 이미지가 컨테이너를 채우도록 설정합니다 */
}

/* 원형 이미지를 위한 추가적인 스타일링 */
.rounded-circle {
  border-radius: 50% !important; /* 이미지를 강제로 원형으로 만듭니다 */
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
<title>팀원 소개</title>
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
		<!-- Header-->
		
		
		
		
		<!-- Team members section-->
		<section class="py-5 bg-light">
			<div class="container px-5 my-5">
				<div class="text-center">
					<h2 class="fw-bolder">팀</h2>
					<p class="lead fw-normal text-muted mb-5">팀 Pheonix불사조</p>
				</div>
				<div
					class="row gx-5 row-cols-1 row-cols-sm-2 row-cols-xl-5 justify-content-center " style = "width : 100%">
					<div class="col mb-5 mb-5 mb-xl-0">
						<div class="text-center">
							<img class="img-fluid team-member" style="width:100px; height:100px;"
								src="/about/ceo.jpg" alt="About Image" />
							<h5 class="fw-bolder">김태연</h5>
							<div class="fst-italic text-muted">팀장 &amp; 메인페이지 &amp; 총괄 매니지먼트</div>
						</div>
					</div>
					<div class="col mb-5 mb-5 mb-xl-0">
						<div class="text-center">
							<img class="img-fluid team-member" style="width:100px; height:100px;"
								src="/about/cio.jpg" alt="About Image" />
							<h5 class="fw-bolder">Sooyoung Jo</h5>
							<div class="fst-italic text-muted">CIO &amp; CTO</div>
						</div>
					</div>
					<div class="col mb-5 mb-5 mb-sm-0">
						<div class="text-center">
							<img class="img-fluid team-member" style="width:100px; height:100px;"
								src="/about/cfo.png" alt="About Image" />
							<h5 class="fw-bolder">Jeonggyeom Kim</h5>
							<div class="fst-italic text-muted">CFO &amp; CPO</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="text-center">
							<img class="img-fluid team-member" style="width:100px; height:100px;"
								src="/about/coo.jpg" alt="About Image" />
							<h5 class="fw-bolder">Jisoo Lee</h5>
							<div class="fst-italic text-muted">CKO &amp; COO</div>
						</div>
					</div>
					<div class="col mb-5">
						<div class="text-center">
							<img class="img-fluid team-member" style="width:100px; height:100px;"
								src="/about/cso.png" alt="About Image" />
							<h5 class="fw-bolder">Dongjun Shin</h5>
							<div class="fst-italic text-muted">CSO</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		
		
		
		
		<header class="py-5">
			<div class="container px-5">
				<div class="row justify-content-center">
					<div class="col-lg-8 col-xxl-6">
						<div class="text-center my-5">
							<h1 class="fw-bolder mb-3">` mission is to make building
								websites easier for everyone.</h1>
							<p class="lead fw-normal text-muted mb-4">Start Bootstrap was
								built on the idea that quality, functional website templates and
								themes should be available to everyone. Use our open source,
								free products, or support us by purchasing one of our premium
								products or services.</p>
							<a class="btn btn-primary btn-lg" href="#scroll-target">Read
								our story</a>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- About section one-->
		<section class="py-5 bg-light" id="scroll-target">
			<div class="container px-5 my-5">
				<div class="row gx-5 align-items-center">
					<div class="col-lg-6">
						<img class="img-fluid rounded mb-5 mb-lg-0"
							src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
					</div>
					<div class="col-lg-6">
						<h2 class="fw-bolder">Our founding</h2>
						<p class="lead fw-normal text-muted mb-0">Lorem ipsum dolor
							sit amet consectetur adipisicing elit. Iusto est, ut esse a
							labore aliquam beatae expedita. Blanditiis impedit numquam libero
							molestiae et fugit cupiditate, quibusdam expedita, maiores eaque
							quisquam.</p>
					</div>
				</div>
			</div>
		</section>
		<!-- About section two-->
		<section class="py-5">
			<div class="container px-5 my-5">
				<div class="row gx-5 align-items-center">
					<div class="col-lg-6 order-first order-lg-last">
						<img class="img-fluid rounded mb-5 mb-lg-0"
							src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
					</div>
					<div class="col-lg-6">
						<h2 class="fw-bolder">Growth &amp; beyond</h2>
						<p class="lead fw-normal text-muted mb-0">Lorem ipsum dolor
							sit amet consectetur adipisicing elit. Iusto est, ut esse a
							labore aliquam beatae expedita. Blanditiis impedit numquam libero
							molestiae et fugit cupiditate, quibusdam expedita, maiores eaque
							quisquam.</p>
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
	<script src="../js/all.js"></script>
</body>
</html>
