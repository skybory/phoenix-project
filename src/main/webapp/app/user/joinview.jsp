<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="/user/userJoin.us" method="post">
	
		<p>
			아이디 <input type="text" name="userid">
		</p>
		
		<p>
			비밀번호 <input type="password" name="userpw">		
		</p>

		<p>
			이메일주소 <input type="text" name="useremail">		
		</p>
		
		<p>
			이름 <input type="text" name="username">		
		</p>

		<p>
			생년월일 8자리 <input type="text" name="userbirth">		
		</p>

		<p>
			남<input type="radio" name="usergender" value="M">		
			여<input type="radio" name="usergender" value="F">		
		</p>
		
		<p>
			휴대전화번호 <input type="text" name="userphone">
		</p>		
		
		<p>
			 <input type="submit" value="회원가입">
		</p>		
		
	</form>

</body>
</html>



















