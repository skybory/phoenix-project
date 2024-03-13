<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	UserDAO udao = new UserDAO();
	UserDTO udto = udao.login(userId, userPw);
</body>
</html>