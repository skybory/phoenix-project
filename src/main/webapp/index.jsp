<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
.lemon-bg {
   background-color: #E5D85C;
}
#userGreeting {
    font-weight: bold; /* 굵게 표시 */
    color: #FF5733; /* 글자 색상 변경 */
}
#userGreetingLi{
margin-left: 20px;
}

.logo-container{
	 position: absolute;
    top: 0px;
    left: 250px;
    right: 0;
    
}
#lemonLogo {
    width: 50px; /* 원하는 너비로 조정 */
    height: auto; /* 높이를 자동으로 조정하여 비율 유지 */
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
<<<<<<< HEAD
							href="${pageContext.request.contextPath}/board/Category.bo">카테고리(편집부탁)</a></li>
=======
							href="${pageContext.request.contextPath}/board/Category.bo">카테고리</a></li>
>>>>>>> 39b36173770b7eb329a188e01794e34abb255eb8
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Pricing.bo">중고거래</a></li>

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
<!-- 		이거쓸꺼면 마이페이지 바로뒤에 붙여야함 -->
		<!-- 						<li class="nav-item dropdown"><a -->
<!-- 							class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" -->
<!-- 							role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a> -->
<!-- 							<ul class="dropdown-menu dropdown-menu-end" -->
<!-- 								aria-labelledby="navbarDropdownBlog"> -->
<!-- 								<li><a class="dropdown-item" href="blog-home.jsp">Blog -->
<!-- 										Home</a></li> -->
<!-- 								<li><a class="dropdown-item" href="blog-post.jsp">Blog -->
<!-- 										Post</a></li> -->
<!-- 							</ul></li> -->
<!-- 						<li class="nav-item dropdown"> -->
<!-- 							<ul class="dropdown-menu dropdown-menu-end" -->
<!-- 								aria-labelledby="navbarDropdownPortfolio"> -->
<!-- 							</ul> -->
<!-- 						</li> -->
		<!-- Header-->
		<header class="lemon-bg py-5">
			<div class="container px-5">
				<div name=val
					class="row gx-5 align-items-center justify-content-center">


               <div class="col-lg-8 col-xl-7 col-xxl-6">
                  <div class="my-5 text-center text-xl-start">
                     <h1 name="val" class="display-5 fw-bolder text-black mb-2">당신
                        근처의 지역 생활 커뮤니티</h1>
                     <%

							%>
							<p class="lead fw-normal text-gray-50 mb-4">
								동네라서 가능한 모든 것<br>당근에서 가까운 이웃과 함께해요.
							</p>
							<div
								class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
								<a class="btn btn-primary btn-lg px-4 me-sm-3"
									href="resgistration/registration.jsp">물건 등록하기</a> <a
									class="btn btn-outline-light btn-lg px-4" href="#!">뭐넣을지 고민중...</a>
							</div>
						</div>
					</div>
					<div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
						<img class="img-fluid rounded-3 my-5"
							src="${pageContext.request.contextPath}/picture/lemon1.jpg"
							alt="..." />
					</div>
				</div>
			</div>
		</header>
		<!-- Features section-->
		<section class="py-5" id="features">
			<div class="container px-5 my-5">
				<div class="row gx-5">
					<div class="col-lg-4 mb-5 mb-lg-0">
						<h2 class="fw-bolder mb-0">현재 판매중인 물건들이에요!</h2>
					</div>
					<div class="col-lg-8">
						<div class="row gx-5 row-cols-1 row-cols-md-2">
							<div class="col mb-5 h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-collection"></i>
								</div>
								<h2 class="h5">Featured title</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
							<div class="col mb-5 h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-building"></i>
								</div>
								<h2 class="h5">Featured title</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
							<div class="col mb-5 mb-md-0 h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-toggles2"></i>
								</div>
								<h2 class="h5">Featured title</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
							<div class="col h-100">
								<div
									class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
									<i class="bi bi-toggles2"></i>
								</div>
								<h2 class="h5">Featured title</h2>
								<p class="mb-0">Paragraph of text beneath the heading to
									explain the heading. Here is just a bit more text.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Testimonial section-->
		<div class="py-5 bg-light">
			<div class="container px-5 my-5">
				<div class="row gx-5 justify-content-center">
					<div class="col-lg-10 col-xl-7">
						<div class="text-center">
							<div class="fs-4 mb-4 fst-italic">"Working with Start
								Bootstrap templates has saved me tons of development time when
								building new projects! Starting with a Bootstrap template just
								makes things easier!"</div>
							<div class="d-flex align-items-center justify-content-center">
								<img class="rounded-circle me-3"
									src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
								<div class="fw-bold">
									Tom Ato <span class="fw-bold text-primary mx-1">/</span> CEO,
									Pomodoro
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Blog preview section-->
		<section class="py-5">
			<div class="container px-5 my-5">
				<div class="row gx-5 justify-content-center">
					<div class="col-lg-8 col-xl-6">
						<div class="text-center">
							<h2 class="fw-bolder">From our blog</h2>
							<p class="lead fw-normal text-muted mb-5">Lorem ipsum, dolor
								sit amet consectetur adipisicing elit. Eaque fugit ratione dicta
								mollitia. Officiis ad.</p>
						</div>
					</div>
				</div>
				<div class="row gx-5">
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0">
							<img class="card-img-top"
								src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
							<div class="card-body p-4">
								<div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
								<a class="text-decoration-none link-dark stretched-link"
									href="#!"><h5 class="card-title mb-3">Blog post title</h5></a>
								<p class="card-text mb-0">Some quick example text to build
									on the card title and make up the bulk of the card's content.</p>
							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<img class="rounded-circle me-3"
											src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
										<div class="small">
											<div class="fw-bold">Kelly Rowan</div>
											<div class="text-muted">March 12, 2023 &middot; 6 min
												read</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0">
							<img class="card-img-top"
								src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
							<div class="card-body p-4">
								<div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
								<a class="text-decoration-none link-dark stretched-link"
									href="#!"><h5 class="card-title mb-3">Another blog
										post title</h5></a>
								<p class="card-text mb-0">This text is a bit longer to
									illustrate the adaptive height of each card. Some quick example
									text to build on the card title and make up the bulk of the
									card's content.</p>
							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<img class="rounded-circle me-3"
											src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
										<div class="small">
											<div class="fw-bold">Josiah Barclay</div>
											<div class="text-muted">March 23, 2023 &middot; 4 min
												read</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 mb-5">
						<div class="card h-100 shadow border-0">
							<img class="card-img-top"
								src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
							<div class="card-body p-4">
								<div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
								<a class="text-decoration-none link-dark stretched-link"
									href="#!"><h5 class="card-title mb-3">The last blog
										post title is a little bit longer than the others</h5></a>
								<p class="card-text mb-0">Some more quick example text to
									build on the card title and make up the bulk of the card's
									content.</p>
							</div>
							<div class="card-footer p-4 pt-0 bg-transparent border-top-0">
								<div class="d-flex align-items-end justify-content-between">
									<div class="d-flex align-items-center">
										<img class="rounded-circle me-3"
											src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
										<div class="small">
											<div class="fw-bold">Evelyn Martinez</div>
											<div class="text-muted">April 2, 2023 &middot; 10 min
												read</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Call to action-->
				<aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
					<div
						class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
						<div class="mb-4 mb-xl-0">
							<div class="fs-3 fw-bold text-white">New products,
								delivered to you.</div>
							<div class="text-white-50">Sign up for our newsletter for
								the latest updates.</div>
						</div>
						<div class="ms-xl-4">
							<div class="input-group mb-2">
								<input class="form-control" type="text"
									placeholder="Email address..." aria-label="Email address..."
									aria-describedby="button-newsletter" />
								<button class="btn btn-outline-light" id="button-newsletter"
									type="button">Sign up</button>
							</div>
							<div class="small text-white-50">We care about privacy, and
								will never share your data.</div>
						</div>
					</div>
				</aside>
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
	<script src="js/map.js"></script>
</body>
</html>

