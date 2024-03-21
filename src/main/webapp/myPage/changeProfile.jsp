<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보 수정 페이지</title>
<style>
/* CSS 스타일링 */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 20px;
}

h1 {
	text-align: center;
}

form {
	max-width: 600px;
	margin: 0 auto;
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="number"], input[type="email"], input[type="password"],
	input[type="tel"], input[type="file"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
<%
UserDTO udto = (UserDTO) session.getAttribute("userDTO");
int userIdx = 0;
String userName = null;
String userId = null;
String userAge = null;
String userGender = null;
String userPhoneNumber = null;
String userEmail = null;
String userAddress = null;
String userImage = null;
int userAccount = 0;

if (udto != null) {
	userIdx = udto.getUserIdx();
   userId = udto.getUserId();
   userName = udto.getUserName();
   userAge = udto.getUserAge();
   userGender = udto.getUserGender();
   userPhoneNumber = udto.getUserPhoneNumber();
   userEmail = udto.getUserEmail();
   userAddress = udto.getUserAddress();
   userImage = udto.getUserImage();
   userAccount = udto.getUserAccount();
   
}
%>
</head>
<body class="d-flex flex-column h-100"
	style="background-color: #FFF8D5;">
	<main class="flex-shrink-0">

		<header class="lemon-bg py-5 container px-5"
			style="background-color: #FFFFFF; padding: 2vw 2vw 2vw 2vw; border-radius: 15px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); border: 2px solid rgba(0, 0, 0, 0.1); max-width: 1200px; max-height: 100vh; margin: 0 auto;">
<!-- <form action="/user/updateUserInfo" method="post">
    <label for="username">이름:</label>
    <input type="text" id="username" name="username" value="<%= userName %>"><br>

    <label for="userId">아이디:</label>
    <input type="text" id="userId" name="userId" value="<%= userId %>"><br>

    <label for="userAge">나이:</label>
    <input type="text" id="userAge" name="userAge" value="<%= userAge %>"><br>

    <label for="userGender">성별:</label>
    <input type="text" id="userGender" name="userGender" value="<%= userGender %>"><br>

    <label for="userPhoneNumber">전화번호:</label>
    <input type="text" id="userPhoneNumber" name="userPhoneNumber" value="<%= userPhoneNumber %>"><br>

    <label for="userEmail">이메일:</label>
    <input type="email" id="userEmail" name="userEmail" value="<%= userEmail %>"><br>

    <label for="userAddress">주소:</label>
    <input type="text" id="userAddress" name="userAddress" value="<%= userAddress %>"><br>

    <label for="userImage">프로필 사진:</label>
    <input type="text" id="userImage" name="userImage" value="<%= userImage %>"><br>

    <label for="userAccount">계정 정보:</label>
    <input type="text" id="userAccount" name="userAccount" value="<%= userAccount %>"><br>
</form> -->
			<h1>개인정보 수정 페이지</h1>
			<form id="editForm" action="/update_profile" method="post">
				<label for="profile_image">프로필 이미지</label> <input type="file"
					id="profile_image" name="profile_image"> <label for="name">이름</label>
				<input type="text" id="name" name="name" placeholder="이름을 입력하세요"
					required> <label for="username">아이디</label> <input
					type="text" id="username" name="username" placeholder="아이디를 입력하세요"
					required> <label for="age">나이</label> <input type="number"
					id="age" name="age" placeholder="나이를 입력하세요" required> <label
					for="gender">성별</label> <select id="gender" name="gender" required>
					<option value="male">남성</option>
					<option value="female">여성</option>
					<option value="other">기타</option>
				</select> <label for="phone">전화번호</label> <input type="tel" id="phone"
					name="phone" placeholder="전화번호를 입력하세요" required> <label
					for="email">이메일</label> <input type="email" id="email" name="email"
					placeholder="이메일을 입력하세요" required> <label for="account">계좌번호</label>
				<input type="text" id="account" name="account"
					placeholder="계좌번호를 입력하세요" required>
				<!-- 계좌번호 입력 칸을 추가했습니다 -->


    <button type="submit">정보 수정</button>
			</form>
		</header>
		<script>
window.addEventListener('DOMContentLoaded', (event) => {
    var editForm = document.getElementById("editForm");
    editForm.style.display = "block"; // 페이지 로드 시 폼을 표시합니다
});

function toggleButton() {
    var button = document.getElementById("editButton");
    if (button.value === "수정 하기") {
        button.value = "수정 완료";
        button.setAttribute("onclick", "completeEdit()");
    } else {
        button.value = "수정 하기";
        button.setAttribute("onclick", "toggleButton()");
    }
}

function completeEdit() {
    // 여기에 수정 완료 처리를 추가할 수 있습니다.
    // 예를 들어, 데이터 전송 등을 수행할 수 있습니다.
    
    // 수정 완료 후에는 다시 '수정 하기'로 버튼 상태를 변경합니다.
    var button = document.getElementById("editButton");
    button.value = "수정 하기";
    button.setAttribute("onclick", "toggleButton()");
}
</script>
</body>
</html>