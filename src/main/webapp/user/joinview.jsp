<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
String userName = null;
String userId = null;

if (udto != null) {
	userId = udto.getUserId();
	userName = udto.getUserName();
}
%>
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
<link href="../css/styles.css" rel="stylesheet" />
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
<title>회원가입</title>

</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
						<li class="nav-item" id="userGreetingLi"><a class="nav-link"
							id="userGreeting"> <%=userName%>님(<%=userId%>) 안녕하세요
						</a></li>



						<li class="nav-item"><a class="nav-link"
							href="/board/MyPage.bo">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" id="userGreeting"
							href="/user/UserLogoutAction.us">로그아웃</a></li>

						<%
						}
						%>
					</ul>
				</div>
			</div>
		</nav>

		<form name="joinForm" action="/user/UserJoinAction.us" method="post"
			enctype="multipart/form-data" class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-12 mx-auto">
					<h4 class="mb-3">회원가입</h4>
					<div id="image-preview" class="row mt-3"></div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">아이디</label> <input type="text"
								class="form-control" id="id" placeholder="" value=""
								name="userId">
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
							<input type="button" value="중복확인"
								onclick="checkId(joinForm.userId.value);" /> <span id="check"></span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호</label> <input type="password"
								class="form-control" id="password" placeholder="" value=""
								name="userPw">
							<div class="invalid-feedback">비밀번호를 입력하세요</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="userImage" class="form-label">이미지 업로드</label> <input
							type="file" id="userImage" name="userImage" accept="image/*"
							onchange="previewImages(event);">
						<div id="image_container"></div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="nickname">비밀번호 확인</label> <input type="password"
								class="form-control" id="password_re" placeholder="" value=""
								name="userPw_re">
							<div class="invalid-feedback">비밀번호를를 입력하세요</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" placeholder="" value=""
								name="userName">
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="age">나이</label> <input type="text"
								class="form-control" id="age" placeholder="" value=""
								name="userAge">
							<div class="invalid-feedback">나이를 입력해주세요.</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="gender">성별</label>
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-secondary"> <input type="radio"
									name="userGender" id="male" value="male"> 남
								</label> <label class="btn btn-secondary"> <input type="radio"
									name="userGender" id="female" value="female"> 여
								</label> <label class="btn btn-secondary"> <input type="radio"
									name="userGender" id="notSpecified" value="notSpecified">
									미공개
								</label>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="phonenumber">전화번호</label> <input type="text"
									class="form-control" id="phonenumber" placeholder="" value=""
									name="userPhoneNumber">
								<div class="invalid-feedback">전화번호를 입력해주세요.</div>
							</div>
						</div>

						<div class="mb-3">
							<label for="email">이메일</label> <input type="email"
								class="form-control" id="email" placeholder="you@example.com"
								name="userEmail">
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>

						<div class="form-group">
							<label for="postcode">우편번호</label> <input type="text"
								id="postcode" readonly>
						</div>
						<div class="form-group">
							<label for="address">주소</label> <input type="text" id="address"
								readonly>
						</div>
						<div class="form-group">
							<label for="extraAddress">참고항목</label> <input type="text"
								id="extraAddress" readonly>
						</div>
						<div class="form-group">
							<label for="detailAddress">상세주소<span class="text-muted">&nbsp;(선택)</span></label>
							<input type="text" id="detailAddress">
						</div>
						<div class="row">
							<div class="col-md-6">
								<button type="button" onclick="searchAddress()"
									class="btn btn-primary">주소 찾기</button>
								<input type="hidden" name="userAddress" id="userAddress">
							</div>
						</div>
						<!-- 							<button type="button" onclick="combineAddress()">주소 저장하기</button> -->

						<!-- userAddress를 담을 hidden 필드 추가 -->

						<div class="row"></div>
						<div class="custom-control custom-checkbox mb-3">
							<input type="checkbox" class="custom-control-input"
								id="agreement" required> <label
								class="custom-control-label" for="agreement">개인정보 수집 및
								이용에 동의합니다.</label>
							<div class="invalid-feedback">개인정보 수집 및 이용에 동의해야 합니다.</div>
						</div>
						<div class="mb-4"></div>
						<button class="btn btn-primary btn-lg btn-block" type="submit"
							onclick="sendit();" id="submitButton" disabled>가입완료</button>
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
				<div class="h5 mb-2">일대일 문의</div>
				<p class="text-muted mb-0">일대일 채팅으로 상담 해드립니다. 문의 주세요.</p>
			</div>
			<div class="col">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<i class="bi bi-people"></i>
				</div>
				<div class="h5">커뮤니티</div>
				<p class="text-muted mb-0">커뮤니티에 질문 해주세요.</p>
			</div>
			<div class="col">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<i class="bi bi-question-circle"></i>
				</div>
				<div class="h5">서비스센터</div>
				<p class="text-muted mb-0">FAQ's 와 여러가지 문제들 해결해 드립니다.</p>
			</div>
			<div class="col">
				<div
					class="feature bg-primary bg-gradient text-white rounded-3 mb-3">
					<i class="bi bi-telephone"></i>
				</div>
				<div class="h5">연락처</div>
				<p class="text-muted mb-0">전화로 문의 시 (+82) 109-1004.</p>
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
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f3d258ce936625da0436a6065893ce2d&libraries=services"></script>

	<script src="../user.js"></script>
	<script src="../js/scripts.js"></script>
	<script src="../js/map.js"></script>
	<script src="../js/user.js"></script>

</body>
</html>
