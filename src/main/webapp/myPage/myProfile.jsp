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
    padding: 20px; /* 폼 내부 여백 추가 */
    border-radius: 15px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border: 2px solid rgba(0, 0, 0, 0.1);
    background-color: #FFFFFF;
}

label {
    display: block;
    margin-bottom: 10px;
}

input[type="text"], input[type="number"], input[type="email"], input[type="password"],
    input[type="tel"], input[type="file"], select {
    width: calc(100% - 22px); /* 우측 여백 고려하여 너비 조정 */
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

/* 이미지 최대 너비 설정 */
img {
    max-width: 100%;
    height: auto;
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
            style="max-width: 1200px; max-height: 100vh; margin: 0 auto;">
            <form id="editForm" action="/user/UpdateMyProfileAction.us"> <!-- id 추가 -->
                <!-- Change.jsp로 페이지 이동 -->
               <input type="hidden" name="userIdx" id="userIdx" value="<%= userIdx%>">
                <label for="userImage">프로필 사진:</label> <img src="<%= userImage %>"
                    alt="프로필 사진" name="userImage">
                <!-- 이미지로 출력 -->

                <label for="userName">이름:</label> <input type="text" id="userName"
                    name="userName" value="<%= userName %>" disabled><br>
                <!-- 수정 불가능한 입력란 -->

                <label for="userId">아이디:</label> <input type="text" id="userId"
                    name="userId" value="<%= userId %>" disabled><br>
                <!-- 수정 불가능한 입력란 -->

                <label for="userAge">나이:</label> <input type="text" id="userAge"
                    name="userAge" value="<%= userAge %>" disabled><br>
                <!-- 수정 불가능한 입력란 -->

                <label for="userGender">성별:</label> <input type="text"
                    id="userGender" name="userGender" value="<%= userGender %>"
                    disabled><br>
                <!-- 수정 불가능한 입력란 -->

                <label for="userPhoneNumber">전화번호:</label> <input type="text"
                    id="userPhoneNumber" name="userPhoneNumber"
                    value="<%= userPhoneNumber %>" disabled><br>
                <!-- 수정 불가능한 입력란 -->

                <label for="userEmail">이메일:</label> <input type="email"
                    id="userEmail" name="userEmail" value="<%= userEmail %>" disabled><br>
                <!-- 수정 불가능한 입력란 -->

                <label for="userAddress">주소:</label> <input type="text"
                    id="userAddress" name="userAddress" value="<%= userAddress %>"
                    disabled><br>
                <!-- 수정 불가능한 입력란 -->


                <label for="userAccount">보유 머니:</label> <input type="text"
                    id="userAccount" name="userAccount" value="<%= userAccount %>"
                    disabled><br>
                <!-- 수정 불가능한 입력란 -->

                <!-- 정보 수정 버튼 추가 -->
                <button id="editButton" type="button" onclick="toggleEdit()">정보 수정</button>

                <!-- 제출 버튼 추가 -->
                <button id="submitButton" type="button" onclick="submitForm()">제출</button>
            </form>
        </header>
    </main>

    <script>
    function toggleEdit() {
        var inputs = document.getElementsByTagName('input');
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i].type !== 'submit') {
                inputs[i].disabled = !inputs[i].disabled;
            }
        }
    }

    function submitForm() {
        document.getElementById('editForm').submit();
    }
    </script>
</body>
</html>