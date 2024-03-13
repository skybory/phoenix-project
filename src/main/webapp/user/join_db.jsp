<%@page import="com.lemonmarket.web.dto.UserDTO"%>
<%@page import="com.lemonmarket.web.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="com.lemonmarket.web.dto.UserDTO"/>
<jsp:setProperty property="*" name="user"/>
<!-- 앞에서 전달된 name 속성과 필드의 이름이 같으면 value가 자동으로 세팅 -->

<%
	UserDAO udao = new UserDAO();
	if(udao.join(user)){	// 회원가입 성공
		
%>
	<script>
		alert("회원가입 성공!");
		location.href = "loginview.jsp";
	</script>

<% } else {					// 회원가입 실패 %>
	<script>
		alert("회원가입 실패!");
		location.href = "joinview.jsp";
	</script>
<% } %>
</body>
</html>