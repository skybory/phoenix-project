<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style>
/* 전체 폼 컨테이너 스타일 */
body {
	min-height: 100vh;
	background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
		to(#1d466c));
	background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
}

.input-form {
	max-width: 680px;
	margin-top: 80px;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

/* 입력 필드 기본 스타일 */
input[type="text"], input[type="password"], input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 16px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

/* 버튼 스타일 */
button[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

.navbar {
	margin-bottom: 30px;
}

.mb3 {
	margin-bottom: 30px;
}

/* 추가 스타일은 여기에 추가 */
</style>

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
<title>회원가입</title>

</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container px-5">
				<a class="navbar-brand" href="index.jsp">Start Bootstrap</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Home.bo">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/About.bo">About페이지(편집부탁)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Contact.bo">Contact페이지(편집부탁)</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Map.bo">위치</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Pricing.bo">중고거래</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Login.us">로그인</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/board/Join.bo">회원가입</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownBlog">
								<li><a class="dropdown-item" href="blog-home.jsp">Blog
										Home</a></li>
								<li><a class="dropdown-item" href="blog-post.jsp">Blog
										Post</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdownPortfolio"
							href="#" role="button" data-bs-toggle="dropdown"
							aria-expanded="false">Portfolio</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdownPortfolio">
								<li><a class="dropdown-item" href="portfolio-overview.jsp">Portfolio
										Overview</a></li>
								<li><a class="dropdown-item" href="portfolio-item.jsp">Portfolio
										Item</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>

			<form action="/user/UserJoinAction.us" method="post" class="container" name="joinForm">
				<div class="input-form-backgroud row">
					<div class="input-form col-md-12 mx-auto">
						<h4 class="mb-3">회원가입</h4>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">아이디</label> <input type="text"
										class="form-control" id="id" placeholder="" value="" required
										name="userId">
									<div class="invalid-feedback">아이디를 입력해주세요.</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="nickname">비밀번호</label> <input type="password"
										class="form-control" id="password" placeholder="" value=""
										required name="userPw">
									<div class="invalid-feedback">비밀번호를 입력하세요</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="nickname">비밀번호 확인</label> <input type="password"
										class="form-control" id="password_re" placeholder="" value=""
										required name="userPw_re">
									<div class="invalid-feedback">비밀번호를를 입력하세요</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="name">이름</label> <input type="text"
										class="form-control" id="name" placeholder="" value=""
										required name="userName">
									<div class="invalid-feedback">이름을 입력해주세요.</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="age">나이</label> <input type="text"
										class="form-control" id="age" placeholder="" value="" required
										name="userAge">
									<div class="invalid-feedback">나이를 입력해주세요.</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="gender">성별</label> <input type="text"
										class="form-control" id="gender" placeholder="" value=""
										required name="gender">
									<div class="invalid-feedback">성별을 입력해주세요.</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 mb-3">
									<label for="phonenumber">전화번호</label> <input type="text"
										class="form-control" id="phonenumber" placeholder="" value=""
										required name="phoneNumber">
									<div class="invalid-feedback">전화번호를 입력해주세요.</div>
								</div>
							</div>

							<div class="mb-3">
								<label for="email">이메일</label> <input type="email"
									class="form-control" id="email" placeholder="you@example.com"
									required name="userEmail">
								<div class="invalid-feedback">이메일을 입력해주세요.</div>
							</div>

							<div class="mb-3">
								<label for="postcode">우편번호</label> <input type="text"
									class="form-control" id="postcode" placeholder=""
									required name="postcode">
								<div class="invalid-feedback">주소를 검색해주세요</div>
							</div>
							<div class="mb-3">
								<label for="address">주소</label> <input type="text"
									class="form-control" id="address" placeholder="서울특별시 강남구"
									required name="userAddress">
								<div class="invalid-feedback">주소를 검색해주세요</div>
							</div>
							<div class="mb-3">
								<label for="extraAddress">참고항목</label> <input type="text"
									class="form-control" id="extraAddress" placeholder="서초동1길14"
									required name="extraAddress">
								<div class="invalid-feedback">주소를 검색해주세요.</div>
							</div>
							<button onclick="searchAddress()">주소 찾기</button>
							<div class="mb-3">
								<label for="detailAddress">상세주소<span class="text-muted">&nbsp;(선택)</span></label> <input type="text" class="form-control" id="detailAddress"
									placeholder="상세주소를 입력해주세요.">
							</div>


							<div class="row"></div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" class="custom-control-input"
									id="aggrement" required> <label
									class="custom-control-label" for="aggrement">개인정보 수집 및
									이용에 동의합니다.</label>
							</div>
							<div class="mb-4"></div>
							<button class="btn btn-primary btn-lg btn-block" type="submit"
								onclick="sendit();">가입완료</button>
					</div>
			 
 
				</div>
			</div>
		</form>

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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../user.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3d258ce936625da0436a6065893ce2d&libraries=services"></script>


</body>
</html>
