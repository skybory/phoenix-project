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
	display: none; /* 처음에는 폼을 숨깁니다 */
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="number"], input[type="email"], input[type="password"]
	{
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
<body>

	<h1>개인정보 수정 페이지</h1>

	<div class="card text-center align-items-center">
		<img src=<%=userImage %> class="card-img custom-card-img"
			alt="이미지 설명" style="width: 250px; height: 250px;">
	</div>
	<table border="1">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>주소</th>
				<th>계좌</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=userIdx %></td>
				<td><%=userId %></td>
				<td><%=userName %></td>
				<td><%=userAge %></td>
				<td><%=userGender %></td>
				<td><%=userPhoneNumber %></td>
				<td><%=userEmail %></td>
				<td><%=userAddress %></td>
				<td><%=userAccount %></td>

			</tr>
		</tbody>
	</table>




	<button id="editButton">정보 수정</button>
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
			placeholder="계좌번호를 입력하세요" required> <input type="submit"
			value="수정 완료">
	</form>

	<script>
		// 수정 버튼 클릭 시 폼을 표시합니다
		document
				.getElementById("editButton")
				.addEventListener(
						"click",
						function() {
							document.getElementById("editForm").style.display = "block";
						});
	</script>
</body>
</html>
