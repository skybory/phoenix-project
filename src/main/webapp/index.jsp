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
/* 기본 스타일 */
.btn-primary {
	background-color: #427638;
	border-color: #427638;
	color: #FFFFFF;
	transition: all 0.3s ease;
}

/* Hover 시 색상이 진해짐 */
.btn-primary:hover {
	background-color: #325028;
	border-color: #325028;
}

/* Click 시 그림자 효과 추가 */
.btn-primary:active {
	box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.5);
}

.footer-section {
	text-align: center; /* 모든 푸터 섹션을 가운데 정렬합니다. */
}

.footer-section .text-left {
	text-align: left; /* 내용을 왼쪽 정렬합니다. */
}
/* 그림자 효과를 추가할 헤더 */
header {
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 속성 */
}

/* 페이지 전체 배경 색상 설정 */
body {
	background-color: #FFF8D5;
}

.header-container {
	margin-top: 20px;
} /* 적절한 간격으로 조정하세요 */
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
<title>레몬마켓에 오신걸 환영합니다!</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
   rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />





</head>
<body class="d-flex flex-column h-100"
	style="background-color: #FFF8D5;">
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
                     href="/user/UserLogoutAction.us" onclick="showLog()">로그아웃</a></li>

                  <%
                  }
                  %>
               </ul>
            </div>
         </div>
      </nav>

      <header class="lemon-bg py-5 container px-5"
         style="background-color: #FFFFFF; padding: 4vw 4vw 4vw 4vw; border-radius: 15px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); border: 2px solid rgba(0, 0, 0, 0.1); max-width: 1200px; max-height: 100vh; margin: 0 auto;">

         <div class="container px-5">
            <div name=val
               class="row gx-5 align-items-center justify-content-center">
               <div class="col-lg-8 col-xl-7 col-xxl-6">
                  <div class="my-5 text-center text-xl-start">
                     <h1 name="val" class="display-6 fw-bolder text-dark mb-2"
                        style="color: #427638; font-size: 2rem;">
                        레몬처럼 상큼한 지역 생활<br>커뮤니티
                     </h1>
                     <p class="lead fw-normal text-gray-50 mb-5"
                        style="font-size: 1.2rem;">
                        동네라서 가능한 모든 것<br>레몬에서 가까운 이웃과 함께해요.
                     </p>
                     <%
                     if (udto == null) {
                     %>
                     <div
                        class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                        <a class="btn btn-primary btn-lg px-4 me-sm-3"
                           href="${pageContext.request.contextPath}/board/Login.bo"
                           style="background-color: #F0CF1F; border-color: #F0CF1F; color: #000000;"
                           onmouseover="this.style.backgroundColor='#E1BE0E'; this.style.borderColor='#E1BE0E';"
                           onmouseout="this.style.backgroundColor='#F0CF1F'; this.style.borderColor='#F0CF1F';"
                           onclick="showAlert()" this.style.backgroundColor='#E1BE0E'; this.style.borderColor='#E1BE0E';">물건
                           등록하기</a>
                     </div>
                     <%
                  } else {
                  %>

                  <div
                  class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                  <a class="btn btn-primary btn-lg px-4 me-sm-3"
                     href="${pageContext.request.contextPath}/product/ProductWriteBoard.pr"
                     style="background-color: #F0CF1F; border-color: #F0CF1F; color: #000000;"
                     onmouseover="this.style.backgroundColor='#E1BE0E'; this.style.borderColor='#E1BE0E';"
                     onmouseout="this.style.backgroundColor='#F0CF1F'; this.style.borderColor='#F0CF1F';"
                     onclick="this.style.backgroundColor='#E1BE0E'; this.style.borderColor='#E1BE0E';">물건
                     등록하기</a>
               </div>


               <%
            } 
            %>

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
         <div class="row justify-content-center">
            <div class="row gx-5">

               <div class="col-lg-4 mb-5 text-center mx-auto">
                  <h2 class="fw-bolder mb-0">로그인 후 이용해주세요!</h2>
               </div>
 
                  </div>
               </div>
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
   <!-- Core theme JS-->
   <script src="js/map.js"></script>
   <script src="js/all.js"></script>
</body>
</html>
