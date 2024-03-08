<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "stylesheet" href="css/bootstrap.css">
	<link rel = "stylesheet" href="css/custom.css">
	<script src = "js/bootstrap.js"></script>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
	
	
	
	
	
   <a href="${pageContext.request.contextPath}/board/BoardWrite.bo">[검색]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[알림]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[홈]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[동네생활]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[내 근처]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[채팅]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[나의 당근]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[지역선택]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[글쓰기]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[지역선택]</a>
   <a href="${pageContext.request.contextPath}/board/BoardList.bo">[지역선택]</a>
   
   
   
   
   
   <%
		String userId = null;
	if(session.getAttribute("userId")!=null){
		userId = (String) session.getAttribute("userId");
	}
	%>
	
<!-- <nav class="navbar navbar-expand-lg navbar-light bg-light"> -->  부트스트랩연습
<!--   <div class="container-fluid"> -->
<!--     <a class="navbar-brand" href="#">Navbar</a> -->
<!--     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--       <span class="navbar-toggler-icon"></span> -->
<!--     </button> -->
<!--     <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!--       <ul class="navbar-nav me-auto mb-2 mb-lg-0"> -->
<!--         <li class="nav-item"> -->
<!--           <a class="nav-link active" aria-current="page" href="#">Home</a> -->
<!--         </li> -->
<!--         <li class="nav-item"> -->
<!--           <a class="nav-link" href="#">Link</a> -->
<!--         </li> -->
<!--         <li class="nav-item dropdown"> -->
<!--           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!--             Dropdown -->
<!--           </a> -->
<!--           <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--             <li><a class="dropdown-item" href="#">Action</a></li> -->
<!--             <li><a class="dropdown-item" href="#">Another action</a></li> -->
<!--             <li><hr class="dropdown-divider"></li> -->
<!--             <li><a class="dropdown-item" href="#">Something else here</a></li> -->
<!--           </ul> -->
<!--         </li> -->
<!--         <li class="nav-item"> -->
<!--           <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
<!--         </li> -->
<!--       </ul> -->
<!--       <form class="d-flex"> -->
<!--         <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"> -->
<!--         <button class="btn btn-outline-success" type="submit">Search</button> -->
<!--       </form> -->
<!--     </div> -->
<!--   </div> -->
<!-- </nav> -->
</body>
</html>